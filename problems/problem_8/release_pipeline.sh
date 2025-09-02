#!/usr/bin/env bash

echo "Starting release pipeline"

echo "Checking for latest releases"
[ ! -d "./releases" ] && { echo "Not releases directory"; exit 1; }

latest=$(ls -d ./releases/release_* 2>/dev/null | tail -n 1)

[ -z "$latest" ] && { echo "No releases found"; exit 1; }

echo "Found $latest as latest release"

pushd "./$latest" || exit 1

atrifact=$(jq -r .artifact < configs.json)
required_version=$(jq -r .release_version < configs.json)

echo "Checking for $atrifact"
[ -f "./$atrifact" ] && echo "Found $atrifact" || { echo "Artifact not found"; exit 1; }

artifact_version=$("./$atrifact" --version)

if [ "$artifact_version" != "$required_version" ]; then
    echo "Version of artifact does not match with version in configs.json"
    exit 1
fi

echo "Release successful..."

popd
