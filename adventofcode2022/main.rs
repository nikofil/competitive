fn main(){let mut z=include_str!("1").split("\n\n").map(|y|y.split("\n").map(|z|z.parse().unwrap_or(0)).sum()).collect::<Vec<i64>>();z.sort_by_key(|i|-i);println!("{}",z[0]+z[1]+z[2]);}
