use std::collections::HashMap;
use std::fs;

fn main() {
    // let file_path = "input_example.txt";
    let file_path = "input.txt";
    let file_content =
        fs::read_to_string(file_path).expect("Should have been able to read the file");

    let lines: Vec<&str> = file_content.trim_end().lines().collect();

    // println!("{:?}", lines);

    let range = 'a'..='z';
    // println!("{:?}", range);

    let mut priorities = HashMap::new();

    range.for_each(|c| {
        let ord = <char as Into<u32>>::into(c);
        let priority = ord - 96;

        priorities.insert(c, priority);
        priorities.insert(c.to_ascii_uppercase(), priority + 26);
    });

    // println!("{:?}", priorities);

    let result: Vec<Vec<char>> = lines.iter().map(|l| l.chars().collect()).collect();

    let mut sum = 0;

    result.iter().for_each(|r| {
        let mut chunks: _ = r.chunks(r.len() / 2);

        let c1 = chunks.next().unwrap().to_vec();
        let c2 = chunks.next().unwrap().to_vec();

        let intersect: char = intersection(&c1, &c2)[0];
        let priority = priorities.get(&intersect).unwrap();

        sum += priority;
    });

    println!("{:?}", sum);
}

fn intersection(a: &Vec<char>, b: &Vec<char>) -> Vec<char> {
    let mut c = a.clone();

    c.retain(|x| b.contains(x));
    c
}

// 7793
