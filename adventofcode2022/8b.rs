fn main() {
    let s = include_str!("8").lines().map(|x|x.as_bytes()).collect::<Vec<&[u8]>>();
    let mut v = vec![vec![vec![0i64;4];999];999];
    for i in 0..s.len() {
        for j in 0..s[0].len() {
            for (i,j,k,m,n) in [(i,j,0,-1i64,0i64),(j,i,1,0,-1),(s.len()-j-1,i,2,0,1),(i,s.len()-j-1,3,1,0)] {
                let mut y = (i as i64 + n) as usize;
                let mut x = (j as i64 + m) as usize;
                if x < s[0].len() && y < s.len() {v[i][j][k] = 1}
                while x < s[0].len() && y < s.len() && s[i][j] > s[y][x] {
                    let t = v[y][x][k];
                    v[i][j][k] += t;
                    y = (y as i64+n*t) as usize;
                    x = (x as i64+m*t) as usize;
                    if t==0{break};
                    // println!("{} {}",x, y);
                }
                //v[i][j]=v[i][j].min(x[k]);
                //if i < s.len() {x[k]=x[k].max(s[i].chars().nth(j).unwrap_or('#'));}
            }
        }
    }
    s[0..5].iter().for_each(|x| println!("{:?}", x[0..5].iter().map(|i| *i as char).collect::<String>()));
    v[0..5].iter().for_each(|x| println!("{:?}", &x[0..5]));
    println!("{:?}", v.iter().map(|x| x.iter().map(|y| y[0]*y[1]*y[2]*y[3]).max().unwrap()).max());
    /*let mut c = 0;
    for i in 0..s.len() {
        for j in 0..s[0].len() {
            if s[i].chars().nth(j).unwrap() > v[i][j] {
                c+=1;
            }
        }
    }
    println!("{}", c);
     */
}
