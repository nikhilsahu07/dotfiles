#!/bin/bash

# ============================================================================
# FASTFETCH COLORED ASCII ART GENERATOR
# Creates a colored version of ASCII art using ANSI 256-color codes
# ============================================================================

# Color definitions (256-color palette for skin-like tones)
readonly LIGHT_PEACH=216      # Light peach tone
readonly LIGHTER_PEACH=223    # Lighter peach tone  
readonly VERY_LIGHT_PEACH=230 # Very light peach tone
readonly ALMOST_WHITE=231     # Almost white tone

# File paths
readonly INPUT_FILE="$HOME/.config/fastfetch/animegirl.txt.backup"
readonly OUTPUT_FILE="$HOME/.config/fastfetch/animegirl.txt"

# Function to apply color to a character
colorize_char() {
    local char="$1"
    local color_code="$2"
    echo "\x1b[38;5;${color_code}m${char}\x1b[0m"
}

# Check if input file exists
if [[ ! -f "$INPUT_FILE" ]]; then
    echo "Error: Input file $INPUT_FILE not found!"
    exit 1
fi

echo "🎨 Creating colored ASCII art from $INPUT_FILE"

# Create array of braille characters and their assigned colors
# We'll cycle through the skin tone colors to create depth and variation
declare -A char_colors=(
    ["⠀"]=$LIGHT_PEACH
    ["⢀"]=$LIGHTER_PEACH
    ["⣤"]=$VERY_LIGHT_PEACH
    ["⣶"]=$LIGHT_PEACH
    ["⣿"]=$LIGHTER_PEACH
    ["⣷"]=$VERY_LIGHT_PEACH
    ["⣦"]=$LIGHT_PEACH
    ["⣄"]=$LIGHTER_PEACH
    ["⣾"]=$VERY_LIGHT_PEACH
    ["⡿"]=$LIGHT_PEACH
    ["⠿"]=$LIGHTER_PEACH
    ["⢿"]=$VERY_LIGHT_PEACH
    ["⣟"]=$LIGHT_PEACH
    ["⣮"]=$LIGHTER_PEACH
    ["⡄"]=$VERY_LIGHT_PEACH
    ["⠠"]=$LIGHT_PEACH
    ["⠼"]=$LIGHTER_PEACH
    ["⡇"]=$VERY_LIGHT_PEACH
    ["⢻"]=$LIGHT_PEACH
    ["⠋"]=$LIGHTER_PEACH
    ["⠇"]=$VERY_LIGHT_PEACH
    ["⢰"]=$LIGHT_PEACH
    ["⢸"]=$LIGHTER_PEACH
    ["⡀"]=$VERY_LIGHT_PEACH
    ["⣇"]=$LIGHT_PEACH
    ["⣀"]=$LIGHTER_PEACH
    ["⣠"]=$VERY_LIGHT_PEACH
    ["⡏"]=$LIGHT_PEACH
    ["⣧"]=$LIGHTER_PEACH
    ["⡰"]=$VERY_LIGHT_PEACH
    ["⠟"]=$LIGHT_PEACH
    ["⠓"]=$LIGHTER_PEACH
    ["⢹"]=$VERY_LIGHT_PEACH
    ["⡁"]=$LIGHTER_PEACH
    ["⠈"]=$LIGHT_PEACH
    ["⠁"]=$LIGHTER_PEACH
    ["⣸"]=$VERY_LIGHT_PEACH
    ["⠔"]=$LIGHT_PEACH
    ["⣹"]=$LIGHTER_PEACH
    ["⠎"]=$LIGHTER_PEACH
    ["⢃"]=$LIGHT_PEACH
    ["⡔"]=$VERY_LIGHT_PEACH
    ["⡆"]=$LIGHTER_PEACH
    ["⠒"]=$LIGHT_PEACH
    ["⢴"]=$VERY_LIGHT_PEACH
    ["⢟"]=$LIGHT_PEACH
    ["⠆"]=$VERY_LIGHT_PEACH
    ["⠖"]=$LIGHT_PEACH
    ["⠂"]=$LIGHTER_PEACH
    ["⡈"]=$VERY_LIGHT_PEACH
    ["⡠"]=$LIGHTER_PEACH
    ["⣡"]=$LIGHT_PEACH
    ["⠊"]=$LIGHTER_PEACH
    ["⠞"]=$LIGHT_PEACH
    ["⠥"]=$LIGHTER_PEACH
    ["⡤"]=$VERY_LIGHT_PEACH
    ["⠤"]=$VERY_LIGHT_PEACH
    ["⠉"]=$LIGHTER_PEACH
    ["⠲"]=$VERY_LIGHT_PEACH
    ["⠑"]=$LIGHTER_PEACH
    ["⠌"]=$LIGHT_PEACH
    ["⣴"]=$LIGHTER_PEACH
    ["⠘"]=$LIGHT_PEACH
    ["⠱"]=$VERY_LIGHT_PEACH
    ["⠐"]=$VERY_LIGHT_PEACH
    ["⢱"]=$LIGHTER_PEACH
)

# Build sed command dynamically
sed_command=""
for char in "${!char_colors[@]}"; do
    color="${char_colors[$char]}"
    colored_char=$(colorize_char "$char" "$color")
    if [[ -n "$sed_command" ]]; then
        sed_command+="; "
    fi
    sed_command+="s/${char}/${colored_char}/g"
done

# Apply the coloring transformation
sed "$sed_command" "$INPUT_FILE" > "$OUTPUT_FILE"

echo "✅ Colored ASCII art created successfully at $OUTPUT_FILE"
echo "🌈 Using skin tone colors: $LIGHT_PEACH, $LIGHTER_PEACH, $VERY_LIGHT_PEACH"

