#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_NAME="ai_7030_class_1"

# Load Miniconda (adjust module name for your cluster if needed)
module load miniconda3/24.1.2-py310

cd "$SCRIPT_DIR"

conda env create -f environment.yml
conda activate "$ENV_NAME"

# pip install -r requirements.txt

python -m ipykernel install --user --name "$ENV_NAME" --display-name "Python ($ENV_NAME)"
Rscript -e "IRkernel::installspec(name='ir_${ENV_NAME}', displayname='R (${ENV_NAME})')"

echo "Environment '${ENV_NAME}' is ready."
echo "Activate with: conda activate ${ENV_NAME}"
