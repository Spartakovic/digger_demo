#!/bin/bash

# Create the YAML file and write the initial structure
echo "projects:" > projects.yaml

# Check if names are provided
if [ $# -eq 0 ]
then
    echo "No arguments provided"
    exit 1
fi

# Loop over the arguments (names)
for name in "$@"
do
    # Create a directory for each name
    mkdir "$name"

    # Navigate into the directory
    cd "$name"

    # Create a basic Terraform config file with a null resource
    cat << EOF > main.tf
    resource "null_resource" "$name" {}
EOF

    # Navigate back to the root directory
    cd ..

    # Add the project to the YAML file
    echo "- name: $name" >> projects.yaml
    echo "  dir: ./$name" >> projects.yaml
done

echo "Directories, Terraform configuration files, and the projects.yaml file have been created."

