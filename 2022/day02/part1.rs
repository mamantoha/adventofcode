fn main() {
    let rounds: Vec<Vec<&str>> = include_str!("input.txt")
        .trim_end()
        .lines()
        .map(|l| l.split(' ').collect())
        .collect();

    let win = ["AY", "BZ", "CX"]; // 6
    let draw = ["AX", "BY", "CZ"]; // 3
    let lose = ["AZ", "BX", "CY"]; // 0

    let mut sum = 0;

    rounds.iter().for_each(|round| {
        // println!("{:?}", round[1]);
        let x1 = match round[1] {
            "X" => 1,
            "Y" => 2,
            "Z" => 3,
            &_ => 0,
        };

        let combination = round.join("");

        // https://doc.rust-lang.org/std/vec/struct.Vec.html#method.contains

        let x2 = if win.iter().any(|e| e == &combination) {
            6
        } else if draw.iter().any(|e| e == &combination) {
            3
        } else if lose.iter().any(|e| e == &combination) {
            0
        } else {
            0
        };

        sum += x1 + x2;
    });

    // println!("{:?}", rounds);
    println!("{:?}", sum);
}

// 11841
