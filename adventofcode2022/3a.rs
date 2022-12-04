fn main() {
    print!("{}", include_str!("3").lines().map(|x| {
        let mut c = [0usize;54];
        x.bytes().enumerate().for_each(|(i, y)| {
            c[if y < 91 { y - 65 + 27 } else { y - 97 + 1 } as usize] |= i * 2 / x.len() + 1;
        });
        (0..54).map(|i| if c[i]>2 {i} else {0}).sum::<usize>()
    }).sum::<usize>())
}
