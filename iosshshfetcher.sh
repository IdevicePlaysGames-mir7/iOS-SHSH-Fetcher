#!/bin/bash

# Clear screen for a clean presentation
clear

# 1 & 2: Title, Developer name with lines made of equal signs
echo "=================================================="
echo -e "\033[1;32miOS SHSH Fetcher\033[0m"
echo "--------------------------------------------------"
echo -e "\033[1;35mby mir7\033[0m"
echo "=================================================="

# 3: Press enter to continue
read -p "Press enter to continue..."

echo ""

# Helper escape sequence for bold user input
BOLD=$(tput bold 2>/dev/null || echo -e "\033[1m")
RESET=$(tput sgr0 2>/dev/null || echo -e "\033[0m")

# 4: Ask for iDevice model
read -p "Type your iDevice model here: ${BOLD}" DEVICE_MODEL
echo -n "${RESET}"

# 5: Ask for ECID
read -p "Type your ECID here: ${BOLD}" ECID
echo -n "${RESET}"

# 6: Ask for iOS version
read -p "Type your iOS version here: ${BOLD}" IOS_VERSION
echo -n "${RESET}"

echo ""

# Get current script directory and create 'shsh' subfolder
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SHSH_DIR="$SCRIPT_DIR/shsh"
mkdir -p "$SHSH_DIR"

# 7: Format and run tsschecker command
# Command format: ./tsschecker -d [Device Model] -e [ECID] -i [iOS version] --save --save-path [shsh_folder]
echo "Running command: ./tsschecker -d $DEVICE_MODEL -e $ECID -i $IOS_VERSION --save"
./tsschecker -d "$DEVICE_MODEL" -e "$ECID" -i "$IOS_VERSION" --save --save-path "$SHSH_DIR" > /dev/null 2>&1 &
TSS_PID=$!

echo ""

# 8: Show "Fetching and Saving SHSH blobs" in deep purple bold with a 0%-100% green progress bar
echo -e "\033[1;35mFetching and Saving SHSH blobs\033[0m"

# Simulate a smooth progress bar from 0% to 100% while tsschecker runs in the background
for i in {0..100}; do
    # Calculate bar blocks (e.g., 20 characters total width)
    completed=$((i / 5))
    remaining=$((20 - completed))
    
    bar="["
    for ((c=0; c<completed; c++)); do bar+="="; done
    for ((r=0; r<remaining; r++)); do bar+=" "; done
    bar+="]"

    # Print progress bar in green dynamically on the same line
    printf "\r\033[1;32m%s %3d%%\033[0m" "$bar" "$i"
    
    # Slight sleep just to make the progress animation smooth
    sleep 0.03
done
echo ""

# Wait for the background tsschecker process to finish just in case it takes a moment longer
wait $TSS_PID 2>/dev/null

# Fallback move for any generated SHSH files in current directory to shsh directory
mv *.shsh *.shsh2 "$SHSH_DIR/" > /dev/null 2>&1

echo ""
echo -e "\033[1;31mYour blobs have been saved to the folder 'shsh' in the directory itself\033[0m"

# 10: Final success message
echo ""
echo -e "\033[1;32mSuccessfully Saved SHSH Blobs!\033[0m"