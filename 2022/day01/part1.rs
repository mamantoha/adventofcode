// brew install rust rustfmt

// Read file
// https://doc.rust-lang.org/book/ch12-02-reading-a-file.html
//
// String to integer
// https://doc.rust-lang.org/std/primitive.str.html#method.parse
//
// Rust chomp method
// https://doc.rust-lang.org/std/string/struct.String.html#method.trim_end

// Sort array (Vec)
// https://rust-lang-nursery.github.io/rust-cookbook/algorithms/sorting.html

use std::fs;

fn main() {
    // let file_path = "input_example.txt";
    let file_path = "input.txt";
    let contents = fs::read_to_string(file_path).expect("Should have been able to read the file");
    // println!("With text:\n{contents}");

    // let v: Vec<&str> = contents.split("\n\n").collect();

    // let v: Vec<Vec<u32>> = contents
    //   .trim_end()
    //   .split("\n\n")
    //   .map(|x| x.split("\n").map(|c| c.parse::<u32>().unwrap()).collect())
    //   .collect();

    // let v: Vec<u32> = contents
    //   .trim_end()
    //   .split("\n\n")
    //   .map(|x| x.split("\n").map(|c| c.parse::<u32>().unwrap()))
    //   .map(|cc| cc.sum::<u32>())
    //   .collect();

    // let v: u32 = contents
    //   .trim_end()
    //   .split("\n\n")
    //   .map(|e| e.split("\n").map(|c| c.parse::<u32>().unwrap()))
    //   .map(|c| c.sum::<u32>())
    //   .max()
    //   .unwrap();

    let v: u32 = contents
        .trim_end()
        .split("\n\n")
        .map(|e| e.lines().map(|c| c.parse::<u32>().unwrap()).sum::<u32>())
        .max()
        .unwrap();

    println!("{:?}", v);
}
