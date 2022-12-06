use std::collections::HashSet;
use std::iter::FromIterator;

fn main() {
    include_str!("6").as_bytes().windows(4).enumerate().find(|(i,x)| {
        HashSet::<&u8>::from_iter(*x).len() == 4
    }).map(|(i,_)| println!("{}", i+4));
}
