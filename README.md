# Dated Comment Removal Tool - `dcom_rm.py`

### Project Overview
This Python program, `dcom_rm.py`, is designed to remove all **dated comments** from a given C++ source code file. A **dated comment** is defined as any comment (either single-line or block) that contains a date in the format `DD/MM/YYYY` anywhere in the **first line** of the comment.

The program reads an input C++ file, removes any dated comments, and outputs a new file where only the non-dated comments and regular code remain.

### Features
- Handles both **single-line** comments (starting with `//`) and **block** comments (starting with `/*` and ending with `*/`).
- Detects a date in the format `DD/MM/YYYY` where `D`, `M`, and `Y` can be any digit (0-9).
- Skips writing comments that contain a date to the output file.
- Writes non-dated comments and all regular code to the output file.
- **No regular expressions** are used, complying with the project requirements.

### Files
- `dcom_rm.py`: The main Python script that processes the input C++ file to remove dated comments.
- Input file (`inputC.cpp`): A sample or actual C++ file containing comments.
- Output file (`inputC_rm.cpp`): The result file with all dated comments removed.

### How to Use

#### Requirements
- Python 3.x installed on your system.
- Basic knowledge of command-line tools.

#### Running the Program

1. Make sure the Python script `dcom_rm.py` is in the same directory as your C++ input file (e.g., `inputC.cpp`).
   
2. Open your terminal (or command line) and navigate to the directory containing the script and input file.

3. Run the program using the following command:

   ```bash
   python dcom_rm.py inputC.cpp inputC_rm.cpp
Where:

- `inputC.cpp` is the name of your input C++ file containing the comments you want to process.
- `inputC_rm.cpp` is the name of the output file that will contain the C++ code with all dated comments removed.
- After running the program, check the contents of `inputC_rm.cpp`. It will be the same as `inputC.cpp` but without the dated comments.

#### Example

Let's say the input file `inputC.cpp` contains the following:
  ```cpp
  // 31/12/2023 fixing bug
  int main() {
      // regular comment
      return 0;
  }
  
  /* 01/01/2024 new feature */
  ```
After running the program with:
  
  ```bash
  python dcom_rm.py inputC.cpp inputC_rm.cpp
  ```

The output file inputC_rm.cpp will contain:

  ```cpp
  int main() {
      // regular comment
      return 0;
  }
  ```

### How the Program Works
1. The script reads through the input C++ file line by line.
2. It checks for both single-line (`//`) and block comments (`/* */`).
3. If a comment contains a date in the format `DD/MM/YYYY` on the first line of the comment, the entire comment is ignored and not written to the output file.
4. If no date is found, the comment (and any non-comment code) is written to the output file as-is.

### Limitations
- This program assumes that the date appears only in the first line of a comment. If the date appears on a subsequent line in a block comment, the comment will not be removed.
- Only comments with dates in the format `DD/MM/YYYY` are removed. Other comments remain unchanged.
