#!/bin/bash

. "$HOME/.cargo/env"

cargo new <name> --lib
cargo new <name>

cargo check
cargo build
cargo build --release

cargo run --release
# run subdir
cargo run --release -p $sub_dir
cargo run --features "right_code"

