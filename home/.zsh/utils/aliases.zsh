alias "${CMDLEADER}netstat-open-ports"="sudo netstat -nap | awk '($1 ~ /Proto/ && $9 !~ /Path/) || ($1 ~ /tcp|udp/ && $4 ~ /0.0.0.0.*/) { print }'"
