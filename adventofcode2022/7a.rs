use std::collections::HashSet;
use std::iter::FromIterator;

fn main() {
    let mut d = vec![0; 999];
    let mut s = vec![0; 999];
    let mut l = 0;
    let mut idx: i32 = 0;
    include_str!("7").lines().for_each(|x| {
        match &x[0..3] {
            "$ c" => {
                println!("{}", &x[5..]);
                idx += if &x[5..] == ".." { -1 } else { d[idx as usize] = l; l += 1; 1 };
                println!("idx {} l {}", idx, l);
            }
            "$ l" | "dir" => {}
            _ => {
                let c = x.split(' ').next().unwrap().parse::<u64>().unwrap();
                println!("num {}", c);
                for i in 0..idx as usize {s[d[i]] += c}
            }
        }
    });
    println!("{:?}", s);
    println!("{:?}", s.iter().filter(|x| **x <= 100000).sum::<u64>());
}
