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

    let mut priorities = HashMap::new();

    range.for_each(|c| {
        let ord = <char as Into<u32>>::into(c);
        let priority = ord - 96;

        priorities.insert(c, priority);
        priorities.insert(c.to_ascii_uppercase(), priority + 26);
    });

    let sum: u32 = lines
        .iter()
        .map(|line| {
            let chunks: Vec<Vec<char>> = line
                .chunks(line.len() / 2)
                .map(|chunk| chunk.to_vec())
                .collect();

            let c1 = &chunks[0];
            let c2 = &chunks[1];

            let intersect: char = intersection(&c1, &c2)[0];
            let priority = priorities.get(&intersect).unwrap();

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
