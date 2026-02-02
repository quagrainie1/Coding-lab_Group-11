# Group-Coding-lab
Group 11
Hospital Data Monitoring & Archival System
Project Overview

This project implements a Hospital Data Monitoring and Archival System that captures real-time data from multiple simulated hospital devices. The system continuously records heart rate readings, temperature readings, and water usage, and stores them in structured log files. It also provides an interactive log archival mechanism and a command-line analysis tool.

The project demonstrates proficiency in:

Shell scripting (menus, input validation, error handling)

File manipulation and log rotation

Real-time monitoring using Python simulations

Data extraction and pattern analysis using Linux CLI tools

Automation and reporting

Directory Structure
.
├── archive_logs.sh
├── analyze_logs.sh
├── heart_rate_monitor.py
├── temperature_recorder.py
├── water_consumption.py
├── README.md
│
└── hospital_data/
    ├── active_logs/
    │     ├── heart_rate.log
    │     ├── temperature.log
    │     └── water_usage.log
    │
    ├── archives/
    │     ├── heart_rate/
    │     ├── temperature/
    │     └── water_usage/
    │
    └── reports/
          └── analysis_report.txt

System Components
1. Real-Time Data Monitoring (Python Simulators)

Each Python script simulates two devices and continuously generates timestamped readings. The readings are written into log files located in hospital_data/active_logs/.

To start each simulator (run each in a separate terminal):

python3 heart_rate_monitor.py start
python3 temperature_recorder.py start
python3 water_consumption.py start


You can verify data flow using:

tail -f hospital_data/active_logs/heart_rate.log


Each simulator:

Runs continuously until manually stopped

Appends new readings in real time

Ensures consistent timestamp formatting

2. Log Archival System (archive_logs.sh)

This script allows users to interactively archive logs from ongoing monitoring.

Features:

Displays an interactive menu (Heart Rate, Temperature, Water Usage)

Validates user input

Moves selected log file to its corresponding archive subdirectory

Adds a timestamped filename (e.g., heart_rate_2026-02-02_14-31-55.log)

Creates a new empty log file for continued monitoring

Handles missing files and invalid selections

To run the script:

./archive_logs.sh

3. Log Analysis System (analyze_logs.sh)

This script evaluates stored log data and appends an analysis summary to analysis_report.txt.

Features:

Interactive menu selection for log type

Input validation

Counts occurrences of each device using awk, sort, and uniq

Extracts first and last timestamp entries

Appends formatted results to report file

Run the script:

./analyze_logs.sh


The generated report includes:

Total log entries per device

Timestamp of first data entry

Timestamp of most recent entry

Log file analyzed

Date and time the report was generated

Key Linux Commands Used
Log Archival

mv – moving and renaming files

touch – generating new log files

date – generating timestamps

case and read – menu-driven input

test / -f – checking for file existence

Log Analysis

awk – extracting device identifiers

sort – ordering text data

uniq -c – counting repeated device labels

head and tail – retrieving earliest/latest log entries

echo with redirection (>>) – appending to report

Learning Objectives Achieved
Shell Scripting Proficiency

Created interactive scripts using menu systems

Validated user input and handled errors

Used system commands for file operations

Built scripts that integrate multiple Linux tools

Log Management & Automation

Implemented automated log rotation

Created structured archival directories

Ensured uninterrupted real-time monitoring

Data Analysis with CLI Tools

Extracted meaningful insights from logs

Identified device-level activity patterns

Recorded analysis outputs in an organized report file

How to Run the System End-to-End

Open three terminals and start each simulator using:

python3 heart_rate_monitor.py start
python3 temperature_recorder.py start
python3 water_consumption.py start


Confirm that logs are updating:

tail -f hospital_data/active_logs/heart_rate.log


Archive logs as needed:

./archive_logs.sh


Analyze any log:

./analyze_logs.sh

Group Collaboration Summary

The group collaborated through:

Shared contributions via GitHub commits

Division of tasks across simulators, scripts, and documentation

Testing and refining scripts together

Maintaining proper directory structure for ease of running the system

The repository reflects clear teamwork, progressive contributions, and adherence to project requirements.

Conclusion

This project successfully integrates automated data monitoring, log rotation, and log analysis into a unified system. It demonstrates competence in scripting, automation, log processing, and real-time system design. All components work together to provide a functional and extensible monitoring framework suitable for Linux-based environment.
