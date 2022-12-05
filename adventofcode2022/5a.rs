fn main() {
    let mut v: Vec<Vec<_>> = Vec::new();
    include_str!("5").lines().map(|l|(l,l.chars().collect::<Vec<_>>())).for_each(|(z,l)| {
        match l.get(1) {
            Some('1') | None => {},
            Some('o') => {
                if let [_,Ok(a),_,Ok(b),_,Ok(c)] = z.split(' ').map(|c|c.parse::<usize>()).collect::<Vec<_>>()[..] {
                    (0..a).for_each(|_|{let j = v[b-1].pop().unwrap();v[c-1].push(j);});
                    println!("{} {} {} {:?}", a,b,c, v);
                }
            },
            _ => {
                for i in 0..l.len()/4+1 {
                    if v.len()==i {v.push(Vec::new());}
                    if l[i*4+1] != ' ' {
                        v[i].insert(0, l[i*4+1]);
                    }
                }
            },
        }
    });
    println!("{:?}", v);
    println!("{:?}", v.iter().map(|x| x.last().unwrap_or(&' ')).collect::<String>());
}
