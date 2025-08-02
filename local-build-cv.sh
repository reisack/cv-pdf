# Make it executable
# chmod +x local-build-cv.sh

#!/bin/bash
set -e

# Load secrets
source secrets.env

# Create temporary file
TEMP_TEX="cv_temp.tex"
cp cv.tex "$TEMP_TEX"

# Replace placeholders with secrets
sed -i "s|__MOBILE__|$MOBILE|g" "$TEMP_TEX"
sed -i "s|__ADDRESS_1__|$ADDRESS_1|g" "$TEMP_TEX"
sed -i "s|__ADDRESS_2__|$ADDRESS_2|g" "$TEMP_TEX"
sed -i "s|__EMAIL__|$EMAIL|g" "$TEMP_TEX"

# Compile LaTeX
pdflatex -interaction=nonstopmode "$TEMP_TEX" > /dev/null

# Rename output
mv cv_temp.pdf cv.pdf

# Cleanup
rm "$TEMP_TEX" cv_temp.aux cv_temp.log cv_temp.out