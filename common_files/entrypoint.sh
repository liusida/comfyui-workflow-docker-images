#!/bin/bash

# download models
bash models.sh

# generate defaultGraph.js
python workflow_2_defaultGraph.py ${WORKFLOW}
cp defaultGraph.js web/scripts/defaultGraph.js

python main.py --listen=0.0.0.0 --port=${PORT}
