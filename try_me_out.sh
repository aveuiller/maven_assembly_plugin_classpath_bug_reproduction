#!/bin/bash

EXPERIMENT_DIR="experiment"

echo "=============================="
echo "|Testing jar build consistency|"
echo "=============================="
echo ""

echo "Manually building & executing"
echo "-----------------------------"
cd $EXPERIMENT_DIR; ./run_manual.sh; cd ..
echo ""

echo "Automatically building & executing"
echo "-----------------------------"

mvn package
cd $EXPERIMENT_DIR; ./run_automated.sh; cd ..

echo "Done."

