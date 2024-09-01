#!/bin/bash

. "$HOME/.cargo/env"

cargo new env_test --lib
cargo new helloworld

cargo check
cargo build
cargo build --release

cargo run --release
# run subdir
cargo run --release -p $sub_dir


