#!/bin/bash

echo "=============================="
echo "|Testing jar build consistency|"
echo "=============================="
echo ""

echo "Manually building & executing"
echo "-----------------------------"
cd manual_experiment; ./run.sh; cd ..
echo ""

echo "Automatically building & executing"
echo "-----------------------------"

mvn package
cd experiment; ./run.sh; cd ..

echo "Done."

