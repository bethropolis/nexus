#!/bin/bash

# Define the current directory as the project directory
project_dir="."

# Function to create directories
create_directories() {
    for entry in "$@"; do
        if [[ "$entry" == *"/"* ]]; then
            mkdir -p "$project_dir/${entry%/*}" || { echo "Failed to create directory: $project_dir/${entry%/*}"; exit 1; }
        else
            mkdir -p "$project_dir/$entry" || { echo "Failed to create directory: $project_dir/$entry"; exit 1; }
        fi
    done
}

# Function to create files
create_files() {
    for entry in "$@"; do
        touch "$project_dir/$entry" || { echo "Failed to create file: $project_dir/$entry"; exit 1; }
    done
}

# Define the directories and files
directories=(
    "cmd/nexus/"
    "internal/compiler/ast/"
    "internal/compiler/lexer/"
    "internal/compiler/parser/"
    "internal/compiler/semantic/"
    "internal/crawler/extraction/"
    "internal/crawler/navigation/"
    "internal/crawler/rendering/"
    "internal/crawler/scheduler/"
    "internal/interpreter/"
    "internal/output/json/"
    "internal/output/csv/"
    "pkg/nexuslib/"
    "testdata/examples/"
)

files=(
    "cmd/nexus/main.go"
    "internal/compiler/ast/ast.go"
    "internal/compiler/lexer/lexer.go"
    "internal/compiler/parser/parser.go"
    "internal/compiler/semantic/semantic.go"
    "internal/crawler/crawler.go"
    "internal/crawler/extraction/extractor.go"
    "internal/crawler/navigation/navigator.go"
    "internal/crawler/rendering/renderer.go"
    "internal/crawler/scheduler/scheduler.go"
    "internal/interpreter/interpreter.go"
    "internal/output/json/json.go"
    "internal/output/csv/csv.go"
    "pkg/nexuslib/nexuslib.go"
    "testdata/examples/example.nxs"
    "go.mod"
    "go.sum"
    "README.md"
)

# Create directories
create_directories ${directories[@]}

# Create files
create_files ${files[@]}

echo "Project structure created successfully!"