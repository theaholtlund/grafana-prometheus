# Script to initiate inside Node Exporter #1 container
#!/bin/sh

while true; do
  echo 'my_batch_job_completion_time' $(date +%s) > ./textfile-metrics/my_batch_job.prom.$$
  mv ./textfile-metrics/my_batch_job.prom.$$ ./textfile-metrics/my_batch_job.prom
  sleep 15
done
