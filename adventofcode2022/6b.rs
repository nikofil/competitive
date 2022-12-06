use std::collections::HashSet;
use std::iter::FromIterator;

fn main() {
    include_str!("6").as_bytes().windows(14).enumerate().find(|(i,x)| {
        HashSet::<&u8>::from_iter(*x).len() == 14
    }).map(|(i,_)| println!("{}", i+14));
}
