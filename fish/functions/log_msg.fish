# USAGE: level -> INFO, DEBUG, WARN, ERROR
# log_msg error "Failed to connect to the database." ~/.cache/somelog.log
function log_msg --argument-names level message logfile
    set -l timestamp (date "+%Y-%m%d %H:%M:%S")
    set -l formatted_msg "[$timestamp] ["(string upper $level)"] $message"

    switch $level
        case error
            echo $formatted_msg | tee -a $logfile >&2
        case '*'
            echo $formatted_msg | tee -a $logfile
    end
end

