fn main() {
    let mut j = include_str!("3").lines();
    let mut o=0u64;
    while let(Some(x),Some(y),Some(z))= (j.next(),j.next(),j.next()) {
        x.bytes().filter(|c|y.contains(*c as char) && z.contains(*c as char)).next().map(|c|{println!("{}", c as char); o += if c < 91 {c-64+26} else {c-96} as u64});
    }
    println!("{}", o);
}
