#!/bin/bash
mkdir "$PROJECT_PATH/src"
mkdir "$PROJECT_PATH/tests"

touch "$PROJECT_PATH/package.json"

cp "$TEMPLATE_PATH/gitignore" "$PROJECT_PATH/.gitignore"
cp "$TEMPLATE_PATH/pre-commit-config.yaml" "$PROJECT_PATH/.pre-commit-config.yaml"
