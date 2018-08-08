fn main() {
    println!("{}", hello());
}

fn hello() -> String {
    "Hello, world".into()
}

#[test]
fn test_hello() {
    assert_eq!("Hello, world", hello())
}
