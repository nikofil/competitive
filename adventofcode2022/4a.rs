fn main() {
    println!("{}", include_str!("4").lines().filter(|l| {
        if let[a,b,c,d] = l.split(&['-',','][..]).map(|c| c.parse().unwrap()).collect::<Vec<i64>>()[..] {
            (a-c)*(b-d) <= 0
        } else {false}
    }).count());
}
