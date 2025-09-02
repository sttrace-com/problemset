#!/usr/bin/env python3
import sys
import time
import logging
import hashlib

logging.basicConfig(
    level=logging.DEBUG,
    format="%(asctime)s [%(levelname)s] %(message)s",
    datefmt="%H:%M:%S",
)

def process_file(src, dst):
    start = time.time()
    logging.info(f"Reading {src} and writing to {dst}")

    text = ""
    with open(src, "r") as f:
        for line in f:
            line_clean = line.strip()
            line_hash = hashlib.sha256(line_clean.encode()).hexdigest()
            text += f"{line_clean}"
            text += f" {line_hash}\n"

    for ch in text:
        with open(dst, "a") as f:
            f.write(ch)

    elapsed = time.time() - start
    logging.info(f"Finished in {elapsed:.4f} seconds")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python script.py <input_file> <output_file>")
        sys.exit(1)

    process_file(sys.argv[1], sys.argv[2])