#!/usr/bin/bash

# Paths
LOG_DIR="hospital_data/active_logs"
REPORT_DIR="reports"
REPORT_FILE="$REPORT_DIR/analysis_report.txt"

# Create reports directory if missing
mkdir -p "$REPORT_DIR"

# Menu
echo "Select log file to analyze:"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"
read -p "Enter choice (1-3): " choice

# Determine log file
case "$choice" in
    1)
        LOG_FILE="$LOG_DIR/heart_rate.log"
        LOG_NAME="Heart Rate"
        ;;
    2)
        LOG_FILE="$LOG_DIR/temperature.log"
        LOG_NAME="Temperature"
        ;;
    3)
        LOG_FILE="$LOG_DIR/water_usage.log"
        LOG_NAME="Water Usage"
        ;;
    *)
        echo "❌ Invalid choice. Please select 1, 2, or 3."
        exit 1
        ;;
esac

# Validate log file exists and is not empty
if [[ ! -f "$LOG_FILE" ]]; then
    echo "❌ Log file not found: $LOG_FILE"
    exit 1
fi

if [[ ! -s "$LOG_FILE" ]]; then
    echo "❌ Log file is empty: $LOG_FILE"
    exit 1
fi

# Report header
{
    echo "========================================"
    echo "Log Analysis Report"
    echo "Log Type: $LOG_NAME"
    echo "Log File: $LOG_FILE"
    echo "Analysis Date: $(date)"
    echo "----------------------------------------"
} >> "$REPORT_FILE"

# Device count + first/last timestamps
awk '
{
    device = $3
    timestamp = $1 " " $2

    count[device]++

    if (!(device in first)) {
        first[device] = timestamp
    }
    last[device] = timestamp
}
END {
    for (d in count) {
        print "Device:", d
        print "  Total Entries:", count[d]
        print "  First Entry:", first[d]
        print "  Last Entry:", last[d]
        print ""
    }
}
' "$LOG_FILE" >> "$REPORT_FILE"

echo "Analysis complete. Results appended to $REPORT_FILE"

