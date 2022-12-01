fn main() {
    println!("{}", include_str!("../input.txt").split("\n\n").map(|y|y.split("\n").map(|z|z.parse::<i64>().unwrap_or(0)).sum::<i64>()).max().unwrap());
}
