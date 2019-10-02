#!/usr/bin/python3
import sys
import xml.etree.ElementTree as ET
import os
import shutil
import subprocess

def get_name(elem):
    return elem.attrib['{http://openoffice.org/2001/registry}name']

def get_type(elem):
    return elem.attrib['{http://openoffice.org/2001/registry}type']

SPELL_DEST = "hunspell"
HYPH_DEST = "hyphen"
THES_DEST = "mythes"

def parse_props(elem, origin):
    props = {}
    for prop in elem.getchildren():
        prop_name = get_name(prop)
        prop_type = get_type(prop)
        res = None
        if prop_type == "xs:string":
            res = ""
            for i in prop.getchildren()[0].itertext():
                res = res + i.replace("%origin%", origin)
        elif prop_type == "oor:string-list":
            res = []
            for i in prop.getchildren()[0].itertext():
                res = res + i.replace("%origin%", origin).split()
        else:
            print("Unknown type %s" % prop_type)
        props[prop_name] = res
    return props

def handle_file(filename):
    tree = ET.parse(filename)
    lang = os.path.basename(os.path.dirname(filename)).split("_")[0]
    root = tree.getroot()
    dicts = root.getchildren()[0].getchildren()[0].getchildren()
    for element in dicts:
        name = get_name(element)
        props = parse_props(element, os.path.dirname(filename))
        props_format = props['Format']
        print("Installing %s dictionary %s for lang %s:" % (props_format, name, lang))
        if props_format == 'DICT_SPELL':
            dest = SPELL_DEST
            prefix = ""
            suffix = ""
        elif props_format == 'DICT_HYPH':
            dest = HYPH_DEST
            prefix = "hyph_"
            suffix = ""
        elif props_format == 'DICT_THES':
            dest = THES_DEST
            prefix = "th_"
            suffix = "_v2"
        else:
            print("Unknown format %s" % props_format)
            continue

        install_root = os.environ.get('DESTDIR', '')
        full_dest = "/usr/share/locale/" + lang + "/" + dest + "/"
        symlink_dest = "/usr/share/" + dest + "/"
        os.makedirs(install_root + full_dest, exist_ok=True)
        os.makedirs(install_root + symlink_dest, exist_ok=True)

        for file in props['Locations']:
            if props_format == 'DICT_THES' and file.endswith(".dat") and os.path.isfile(file):
                idxname = file.replace(".dat", ".idx")
                if not os.path.isfile(idxname):
                    print(" Generate %s from %s" % (idxname, file))
                    f_in = open(file, "r")
                    f_out = open(idxname, "w")
                    subprocess.run(["./th_gen_idx.pl"], stdin=f_in, stdout=f_out)
                    if idxname not in props['Locations']:
                        props['Locations'].append(idxname)

        for file in props['Locations']:
            if not os.path.isfile(file):
                continue
            ext = os.path.splitext(file)[1]
            basename = os.path.basename(file)
            if lang != "en":
                full_dest_file = full_dest + basename
            else:
                full_dest_file = symlink_dest + basename
            print(" copy %s to %s" % (file, install_root + full_dest_file))
            shutil.copyfile(file, install_root + full_dest_file)
            for loc in props['Locales']:
                symlink = symlink_dest + prefix + loc.replace("-", "_")+suffix+ext
                if symlink != full_dest_file:
                    print(" symlink %s to %s" % (install_root + symlink, full_dest_file))
                    os.symlink(os.path.relpath(full_dest_file, os.path.dirname(symlink)), install_root + symlink)

for i in sys.argv[1:]:
    handle_file(i)
