### deso stuff
kill_pg () {
  local pid=`sudo lsof -i :6789 | awk 'NR==2 {print $2}'`
  if [[ -z "$pid" ]]; then
    echo "No postgres process running on port 6789"
    return
  fi
  sudo kill "$pid"
  echo "Killed postgress with pid: $pid"
}

