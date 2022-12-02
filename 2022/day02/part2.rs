use std::collections::HashMap;

fn main() {
    let rounds: Vec<Vec<&str>> = include_str!("input.txt")
        .trim_end()
        .lines()
        .map(|l| l.split(' ').collect())
        .collect();

    let points = HashMap::from([('X', 1), ('Y', 2), ('Z', 3)]);

    let win = ["AY", "BZ", "CX"]; // 6
    let draw = ["AX", "BY", "CZ"]; // 3
    let lose = ["AZ", "BX", "CY"]; // 0

    let result: u32 = rounds
        .iter()
        .map(|round| match round[1] {
            "X" => {
                let p = detect_point(round[0], lose.to_vec());
                points.get(&p).unwrap() + 0
            }
            "Y" => {
                let p = detect_point(round[0], draw.to_vec());
                points.get(&p).unwrap() + 3
            }
            "Z" => {
                let p = detect_point(round[0], win.to_vec());
                points.get(&p).unwrap() + 6
            }
            &_ => 0,
        })
        .sum();

    println!("{:?}", result);
}

fn detect_point(x: &str, combinations: Vec<&str>) -> char {
    combinations
        .iter()
        .find(|&&c| c.starts_with(x))
        .unwrap()
        .chars()
        .last()
        .unwrap()
}

// 13022
