#!/usr/bin/env bash
set -euo pipefail

input="$(cat)"

printf 'import HelloEng.gf\nimport HelloIta.gf\nparse -lang=HelloEng "%s" | linearize -lang=HelloIta\n' "$input" | gf --run
