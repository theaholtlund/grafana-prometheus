# Script to initiate inside Node Exporter #1 container
# Potentially look into automating through Go WriteToTextfile funtion or GitHub example scripts
#!/bin/sh

while true; do
  echo 'my_batch_job_completion_time' $(date +%s) > ./textfile-metrics/my_batch_job.prom.$$
  mv ./textfile-metrics/my_batch_job.prom.$$ ./textfile-metrics/my_batch_job.prom
  echo 'Script executed at: $(date)' >> ./update-metrics-log.txt
  sleep 15
done
