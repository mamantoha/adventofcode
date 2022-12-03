use std::collections::HashMap;
use std::fs;

fn main() {
    let file_path = "input.txt";
    let file_content =
        fs::read_to_string(file_path).expect("Should have been able to read the file");

    let lines: Vec<Vec<char>> = file_content
        .trim_end()
        .lines()
        .map(|l| l.chars().collect())
        .collect();

    let range = 'a'..='z';

    let priorities = range.fold(HashMap::new(), |mut memo, c| {
        let priority: u32 = <char as Into<u32>>::into(c) - 96;

        memo.insert(c, priority);
        memo.insert(c.to_ascii_uppercase(), priority + 26);

        memo
    });

    let sum: u32 = lines
        .iter()
        .map(|line| {
            let chunks: Vec<Vec<char>> = line
                .chunks(line.len() / 2)
                .map(|chunk| chunk.to_vec())
                .collect();

            let intersect: char = intersection(&chunks[0], &chunks[1])[0];
            let priority: &u32 = priorities.get(&intersect).unwrap();

            priority
        })
        .sum();

    println!("{:?}", sum);
}

fn intersection(a: &Vec<char>, b: &Vec<char>) -> Vec<char> {
    let mut c = a.clone();

    c.retain(|x| b.contains(x));
    c
}

// 7793
