function start_recording
    set recordings_dir ~/terminal_recordings
    mkdir -p $recordings_dir

    set timestamp (date -u +%Y%m%d_%H%M%S)
    set cast_file $recordings_dir/session_$timestamp.cast

    echo "Starting recording: $cast_file"
    echo "Exit with 'exit' or Ctrl+D to stop"

    asciinema rec -q -i 0.5 $cast_file

    echo "Finished recording"
end
