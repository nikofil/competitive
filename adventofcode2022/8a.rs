fn main() {
    let s = include_str!("8").lines().collect::<Vec<&str>>();
    let mut v = vec![vec!['9';999];999];
    for i in 0..999 {
        let mut x = ['#';4];
        for j in 0..999 {
            for (i,j,k) in [(i,j,0),(j,i,1),(i,998-j,2),(998-j,i,3)] {
                v[i][j]=v[i][j].min(x[k]);
                if i < s.len() {x[k]=x[k].max(s[i].chars().nth(j).unwrap_or('#'));}
            }
        }
    }
    s[0..5].iter().for_each(|x| println!("{:?}", &x[0..5]));
    v[0..5].iter().for_each(|x| println!("{:?}", &x[0..5]));
    let mut c = 0;
    for i in 0..s.len() {
        for j in 0..s[0].len() {
            if s[i].chars().nth(j).unwrap() > v[i][j] {
                c+=1;
            }
        }
    }
    println!("{}", c);
}
