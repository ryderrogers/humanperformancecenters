#!/bin/sh
# Changes the Biosuite VIP link code. The old link stops working once pushed.
# Usage: ./rotate-vip-code.sh            (random new code)
#        ./rotate-vip-code.sh mycode123  (choose your own)
set -e
cd "$(dirname "$0")"
OLD=$(ls -d biosuite/vip-*/ | head -1); OLD=${OLD%/}
NEW=${1:-$(LC_ALL=C tr -dc 'a-z0-9' </dev/urandom | head -c 12)}
git mv "$OLD" "biosuite/vip-$NEW"
echo "New VIP link: https://hpcla.com/biosuite/vip-$NEW/"
echo "Commit and push to make it live."
