# Captcha Solver Script

This project is a simple script that solves captcha challenges via terminal using the Expect scripting language. It interacts with a bash script that prompts for a captcha, captures the challenge, computes the result, and sends it back automatically.

## Features
- Automatically detects and solves arithmetic captcha prompts.
- Works with bash scripts that output arithmetic problems for captcha validation.
- Utilizes Expect for automating terminal interactions.

## Prerequisites
- **Expect**: Make sure Expect is installed on your system.
  - On Ubuntu, you can install it using: 
    ```bash
    sudo apt-get install expect
    ```

## Usage

1. Clone this repository or copy the script.
2. Make sure the bash script that prompts for the captcha (e.g., `captcha.sh`) is executable and placed in the same directory.
3. Run the Expect script to automatically solve the captcha:

```bash
chmod +x captcha_solver.sh
./captcha_solver.sh
