fn main(){print!("{}",include_str!("2").lines().map(|i|if let[x,_,y]=i.as_bytes(){(x+y-1)%3+1+(y-88)*3}else{0}as i64).sum::<i64>());}
