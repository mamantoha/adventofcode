use std::collections::HashMap;

const LOST: u32 = 0;
const DRAW: u32 = 3;
const WIN: u32 = 6;

const ROCK: u32 = 1;
const PAPER: u32 = 2;
const SCISSORS: u32 = 3;

fn main() {
    let rounds: Vec<Vec<&str>> = include_str!("input.txt")
        .trim_end()
        .lines()
        .map(|l| l.split(' ').collect())
        .collect();

    let points = HashMap::from([('X', ROCK), ('Y', PAPER), ('Z', SCISSORS)]);

    let win = ["AY", "BZ", "CX"];
    let draw = ["AX", "BY", "CZ"];
    let lose = ["AZ", "BX", "CY"];

    let result: u32 = rounds
        .iter()
        .map(|round| match round[1] {
            "X" => {
                let p = detect_point(round[0], lose);
                points.get(&p).unwrap() + LOST
            }
            "Y" => {
                let p = detect_point(round[0], draw);
                points.get(&p).unwrap() + DRAW
            }
            "Z" => {
                let p = detect_point(round[0], win);
                points.get(&p).unwrap() + WIN
            }
            &_ => 0,
        })
        .sum();

    println!("{:?}", result);
}

fn detect_point(x: &str, combinations: [&str; 3]) -> char {
    combinations
        .iter()
        .find(|&&c| c.starts_with(x))
        .unwrap()
        .chars()
        .last()
        .unwrap()
}

// 13022
