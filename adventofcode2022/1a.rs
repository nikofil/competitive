fn main() {
    println!("{}", include_str!("1").split("\n\n").map(|y|y.split("\n").map(|z|z.parse().unwrap_or(0)).sum::<i64>()).max().unwrap());
}
