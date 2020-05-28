#!/bin/bash

EXPERIMENT_DIR="experiment"

function run_experiment {
  name=$1
  cd $EXPERIMENT_DIR;
  ./$name
  cd ..;
}

echo "=============================="
echo "|Testing jar build consistency|"
echo "=============================="
echo ""

echo "Manually building & executing"
echo "-----------------------------"
run_experiment "run_manual.sh"
echo ""

echo "Automatically building & executing"
echo "----------------------------------"
mvn package
run_experiment "run_automated.sh"
echo ""

echo "Re-building automated jar & executing"
echo "-------------------------------------"
run_experiment "run_extract_and_rebuild.sh"
echo ""

echo "Done."


