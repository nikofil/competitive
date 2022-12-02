fn main() {
    println!("{}",include_str!("2").lines().map(|i|
        if let [x,_,y]=i.as_bytes() {
            println!("{}-{} {}", (y-88) as i8, (x-65) as i8, ((((y-88) as i8-(x-65) as i8+4)%3)));
            ((((y-88) as i8-(x-65) as i8+4)%3)*3 + (y-87) as i8) as i64
        } else {
            0
        }
    ).sum::<i64>());
}
