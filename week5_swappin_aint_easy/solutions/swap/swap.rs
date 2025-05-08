fn swap(a: i32, b: i32) -> (i32, i32) {
    (b, a)
}

fn main() {
    let (a, b) = (5, 3);
    println!("Before: a={}, b={}", a, b);
    let (a, b) = swap(a, b);
    println!("After: a={}, b={}", a, b);
}
