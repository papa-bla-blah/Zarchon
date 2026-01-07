#!/bin/bash
# Setup script for Zarchon on M1 Mac

echo "╔═══════════════════════════════════════╗"
echo "║   ZARCHON - Setup Script v0.1         ║"
echo "║   Archon Ultra Remake for Godot 4.5   ║"
echo "╚═══════════════════════════════════════╝"
echo ""

# Check if Godot is installed
GODOT_PATH="/Applications/Godot.app/Contents/MacOS/Godot"

if [ ! -f "$GODOT_PATH" ]; then
    echo "⚠️  Godot not found at $GODOT_PATH"
    echo "Please install Godot 4.5.1 from https://godotengine.org/download"
    exit 1
fi

# Get Godot version
VERSION=$($GODOT_PATH --version 2>&1 | head -n 1)
echo "✓ Found Godot: $VERSION"
echo ""

# Ask for installation directory
echo "Where would you like to install Zarchon?"
echo "Default: ~/Documents/Zarchon"
read -p "Press Enter for default or type path: " INSTALL_DIR

if [ -z "$INSTALL_DIR" ]; then
    INSTALL_DIR="$HOME/Documents/Zarchon"
fi

echo ""
echo "Installing to: $INSTALL_DIR"

# Create directory structure
mkdir -p "$INSTALL_DIR"
mkdir -p "$INSTALL_DIR/scripts"
mkdir -p "$INSTALL_DIR/scenes"

echo "✓ Created directories"

# Copy files (assumes they're in current directory)
if [ -f "project.godot" ]; then
    cp project.godot "$INSTALL_DIR/"
    cp icon.svg "$INSTALL_DIR/"
    cp README.md "$INSTALL_DIR/"
    cp -r scripts/* "$INSTALL_DIR/scripts/"
    cp -r scenes/* "$INSTALL_DIR/scenes/"
    echo "✓ Copied project files"
else
    echo "⚠️  Project files not found in current directory"
    echo "Please run this script from the zarchon directory"
    exit 1
fi

echo ""
echo "╔═══════════════════════════════════════╗"
echo "║   Installation Complete! 🎮           ║"
echo "╚═══════════════════════════════════════╝"
echo ""
echo "To open the project:"
echo "1. Launch Godot 4.5.1"
echo "2. Click 'Import'"
echo "3. Navigate to: $INSTALL_DIR/project.godot"
echo "4. Click 'Import & Edit'"
echo ""
echo "Or run from command line:"
echo "$GODOT_PATH --path \"$INSTALL_DIR\""
echo ""
echo "Press F5 in Godot to run the game!"
echo ""
