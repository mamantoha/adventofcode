use std::fs;

fn main() {
    let contents = fs::read_to_string("input.txt").expect("Should have been able to read the file");

    let mut v: Vec<u32> = contents
        .trim_end()
        .split("\n\n")
        .map(|e| e.lines().map(|c| c.parse::<u32>().unwrap()).sum())
        .collect::<Vec<u32>>();

    v.sort();

    let result: u32 = v.iter().rev().take(3).sum();

    println!("{:?}", result);
}

// 207576
