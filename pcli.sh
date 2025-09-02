#!/usr/bin/env bash

set -eo pipefail

init(){

    [ ! -d "./problems" ] && mkdir problems

    last=$(find ./problems -maxdepth 1 -type d -name "problem_*" \
    | sed -E 's#.*/problem_([0-9]+)$#\1#' \
    | sort -n \
    | tail -1)

    last=${last:-0}
    next=$((last + 1))
    problem_dir="./problems/problem_${next}"
    mkdir -p "${problem_dir}"

    echo "Created ./problems/problem_${next}"

    echo "Copying required files"

    cp template/data.json \
        template/description.md \
        template/init_task \
        template/task_submit \
        template/entrypoint.sh \
        "${problem_dir}"

}

synth(){
    local problem=$1
    local synth_dir="./synth/${problem}"
    local problem_dir="./problems/${problem}"

    [ -z "${problem}" ] && echo "missing problem" && exit 1
    [ ! -d "${problem_dir}" ] && { echo "${problem} does not exit, create one with init command first" && exit 1; }
    [ ! -d "./synth" ] && mkdir synth
    
    # Cleanup old synthed dir
    [  -d "${synth_dir}" ] && rm -rf "${synth_dir}"

    mkdir -p "${synth_dir}"

    cp -r "${problem_dir}"/* "${synth_dir}"
    
    cp "./template/setup.sh" "${synth_dir}"

    python3 - <<EOF
import json
from pathlib import Path
from jinja2 import Template

problem_dir = "${problem_dir}"
synth_dir = "${synth_dir}"

template = Template(Path("./template/Dockerfile").read_text())

with open(Path(f"./{problem_dir}/data.json"), "r") as f: data = json.load(f)

rendered = template.render(base_image=data.get("base_image", "ubuntu:22.04"), external_packages=data.get("external_packages", []))

(Path(f"./{synth_dir}") / "Dockerfile").write_text(rendered)

EOF

}

build(){
    echo "Building stuff"
}

# Script starts here
subcmd="${1}"
args="${2}"

case "$subcmd" in
    "init")
        echo "Initializing new problem dir"
        init
        ;;
    "synth")
        synth "$args"
        ;;
    "build")
        node liri.js "$args"
        ;;
    *)
        echo "Unknown subcommand $subcmd"
        ;;
esac