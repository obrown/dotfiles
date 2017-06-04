mkdir "$PROJECT_PATH/$PROJECT_NAME"
mkdir "$PROJECT_PATH/tests"

touch "$PROJECT_PATH/$PROJECT_NAME/__init__.py"
touch "$PROJECT_PATH/requirements.txt"

cp "$TEMPLATE_PATH/gitignore" "$PROJECT_PATH/.gitignore"
cp "$TEMPLATE_PATH/pre-commit-config.yaml" "$PROJECT_PATH/.pre-commit-config.yaml"
