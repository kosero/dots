# !/bin/bash

sh -c 'cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk "{print \$2}" | awk -F "." "{print \$1}"); ram_usage=$(free | awk "/Mem:/ {print int((\$3/\$2)*100)}"); echo "{ \"text\": \"  $ram_usage% 󰍛 $cpu_usage%\" }"'
