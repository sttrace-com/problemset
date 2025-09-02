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
    [ -z "${problem}" ] && echo "missing problem" && exit 1

    local synth_dir="./synth/${problem}"
    local problem_dir="./problems/${problem}"

    [ ! -d "${problem_dir}" ] && { echo "${problem} does not exist, create one with init command first" && exit 1; }
    [ ! -d "./synth" ] && mkdir synth
    
    local data_file="${problem_dir}/data.json"
    local runner=$(jq -r .runner_type < "${data_file}")
    local base_image=$(jq -r .base_image < "${data_file}")
    local image_name="${base_image%%:*}"
    local component_dir="./template/runners/${runner}/${image_name}"
    
    # Cleanup old synthed dir
    [  -d "${synth_dir}" ] && rm -rf "${synth_dir}"

    mkdir -p "${synth_dir}"

    cp -r "${problem_dir}"/* "${synth_dir}"
    
    cp "${component_dir}/setup.sh" "${synth_dir}"

    python3 - <<EOF
import json
from pathlib import Path
from jinja2 import Template

problem_dir = "${problem_dir}"
synth_dir = "${synth_dir}"
component_dir = "${component_dir}"


with open(Path(f"./{problem_dir}/data.json"), "r") as f: data = json.load(f)

template = Template(Path(f"{component_dir}/Dockerfile").read_text())

rendered = template.render(base_image=data["base_image"], external_packages=data["external_packages"])

(Path(f"./{synth_dir}") / "Dockerfile").write_text(rendered)

EOF

}

build(){

    local problem="${1}"
    local synth_dir="./synth/${problem}"
    local problem_dir="./problems/${problem}"

    [ -z "${problem}" ] && echo "Problem name argument cannot be blank" && exit 1
    [ ! -d "${problem_dir}" ] && { echo "${problem} does not exist, create one with init command first" && exit 1; }
    [ ! -d "${synth_dir}" ] && { echo "${problem} does not exist, create one with synth command first" && exit 1; }

    pushd "${synth_dir}"
        echo "Building docker image"
        docker build -t "$problem" .
    popd
}

run(){
    local problem="${1}"
    local synth_dir="./synth/${problem}"
    
    [ -z "${problem}" ] && echo "Problem name argument cannot be blank" && exit 1
    [ ! -d "${synth_dir}" ] && { echo "${problem} does not exist, create one with synth command first" && exit 1; }

    pushd "${synth_dir}"
        echo "Starting ${problem}:latest"
        docker run -d -p 22:22 --name "${problem}_${RANDOM}" "${problem}"
    popd
}

check(){
    if ! which jq > /dev/null; then
        echo "jq is not installed" && exit 1
    fi
}


usage(){
    cat <<EOF
Usage: $(basename "$0") <command> [args]

Commands:
  init                  Initialize a new problem directory from template
  synth <problem_name>  Generate (synthesize) the problem into ./synth/<problem_name>
  build <problem_name>  Build problem artifacts
  run   <problem_name>  Runs docker container with <problem_name>:latest image
  help                  Show this help message

Examples:
  $(basename "$0") init
  $(basename "$0") synth problem_1
  $(basename "$0") build problem_1
  $(basename "$0") run problem_1

EOF
    exit 1
}

######### Script starts here #########
subcmd="${1}"
args="${2}"

[ "$IGNORE_CHECK" = "Y" ] || check

case "$subcmd" in
    "init")
        echo "Initializing new problem dir"
        init
        ;;
    "synth")
        synth "$args"
        ;;
    "build")
        build "$args"
        ;;
    "run")
        run "$args"
        ;;
    *)
        usage
        ;;
esac