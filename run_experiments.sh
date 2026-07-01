#!/bin/bash
#!/bin/bash
PARAM_FILE="experiment_sentence_32bits.txt"

# Ensure the file exists
if [[ ! -f "$PARAM_FILE" ]]; then
    echo "Parameter file not found: $PARAM_FILE"
    exit 1
fi

# Run each line as an experiment (skip empty lines and comments)
grep -E -v '(^[[:space:]]*#|^[[:space:]]*$)' "$PARAM_FILE" | while IFS= read -r line
do
    echo "Running experiment: $line"
    dotnet run -c Release -- $line
done