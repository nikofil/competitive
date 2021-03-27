use std::io;

const PS: usize = 100;
const QS: usize = 10000;

fn normalize(x: &mut [f32; QS]) {
    let min = *x.iter().min_by(|a, b| {a.partial_cmp(b).unwrap()}).unwrap();
    let max = *x.iter().max_by(|a, b| {a.partial_cmp(b).unwrap()}).unwrap();

    x.iter_mut().for_each(|i| {
        *i = ((*i - min) * 6.0) / (max-min) - 3.0;
    });
}

fn sigmoid(skill: f32, diff: f32) -> f32 {
    let x = skill - diff;
    return 1.0 / (1.0 + (-x).exp())
}

fn get_successes(skill: f32, diffs: &[f32; QS]) -> usize {
    diffs.iter().filter(|d| skill > **d).count()
}

fn estimate_skill(actual_successes: &[u8; QS], diff: &[f32; QS]) -> f32 {
    let step = 0.001;
    let mut skill = 0.0;
    let actual = actual_successes.iter().filter(|i| **i==1).count();
    if actual < actual_successes.len() / 3 {
        return -100.0;
    }
    let mut succ = 0usize;
    for _ in 0..10 {
        succ = get_successes(skill, diff);
    }
    let dist = (actual as i32) - (succ as i32);
    skill += step * (dist as f32);
    skill
}

fn main() {
    let mut buf = String::new();
    let stdin = io::stdin();
    stdin.read_line(&mut buf).unwrap();
    let ntot = buf.trim().parse::<u32>().unwrap();
    stdin.read_line(&mut buf).unwrap();

    let mut results = [[0u8; QS]; PS];
    let mut diffs = [0f32; QS];

    for n in 0..ntot {
        for i in 0..PS {
            let mut buf = String::new();
            stdin.read_line(&mut buf).unwrap();
            buf.trim().chars()
                .into_iter()
                .enumerate()
                .for_each(|(j, c)| {
                    let x = if c == '1' {1} else {0};
                    diffs[j] -= x as f32;
                    results[i][j] = x;
                });
        }

        normalize(&mut diffs);

        let mut res = 0;
        let mut most_susp = std::f32::NEG_INFINITY;
        for i in 0..PS {
            let skill = estimate_skill(&results[i], &diffs);
            if skill > -99.0 {
                let mut lost_diffs = diffs
                    .iter()
                    .enumerate()
                    .filter(|(j, _)| {results[i][*j] == 0})
                    .map(|(_, &d)| sigmoid(skill, d))
                    .collect::<Vec<f32>>();
                lost_diffs.sort_by(|a, b| a.partial_cmp(b).unwrap());
                let susp = lost_diffs[lost_diffs.len()/2];
                if susp > most_susp {
                    res = i+1;
                    most_susp = susp;
                }
            }
            // println!("p {} has {}", i+1, skill);
        }

        println!("Case #{}: {}", n+1, res);
    }
}

