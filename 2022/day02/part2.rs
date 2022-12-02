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

    let combination = "AZ";
    println!("{:?}", lose.iter().find(|&&c| c == combination));

    let result: u32 = rounds
        .iter()
        .map(|round| {
            let x = match round[1] {
                "X" => {
                    let p = lose
                        .iter()
                        .find(|&&c| c.starts_with(round[0]))
                        .unwrap()
                        .chars()
                        .last()
                        .unwrap();

                    points.get(&p).unwrap() + 0
                }
                "Y" => {
                    let p = draw
                        .iter()
                        .find(|&&c| c.starts_with(round[0]))
                        .unwrap()
                        .chars()
                        .last()
                        .unwrap();

                    points.get(&p).unwrap() + 3
                }
                "Z" => {
                    let p = win
                        .iter()
                        .find(|&&c| c.starts_with(round[0]))
                        .unwrap()
                        .chars()
                        .last()
                        .unwrap();

                    points.get(&p).unwrap() + 6
                }
                &_ => 0,
            };

            x
        })
        .sum();

    println!("{:?}", result);
}

// 13022
