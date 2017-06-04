mkdir "$PROJECT_PATH/tests"
mkdir "$PROJECT_PATH/src"

touch "$PROJECT_PATH/makefile"

cp "$TEMPLATE_PATH/gitignore" "$PROJECT_PATH/.gitignore"
cp "$TEMPLATE_PATH/pre-commit-config.yaml" "$PROJECT_PATH/.pre-commit-config.yaml"
