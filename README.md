# Grafana Monitoring and Alerting Application

## Introduction
This project provides a Docker-based monitoring and alerting solution using primarily Prometheus, Grafana, Node Exporter and MSSQL, allowing a user to monitor the health of devices, databases and other services. It was created as a way to learn how the technologies work and can be deployed through Docker, and is therefore relatively introductory and a work in progress.

## Prerequisites
- Docker
- Docker Compose

## Getting Started
To set up and run the application, follow these steps:

1. Clone the repository to your local machine.

2. Navigate to the project directory.

3. Add environment variables for SMTP credentials, such as the username and password, to the alertmanager.yml file. This must be fone manually because Prometheus currently does not support environment variables or configuration substitution. 

3. Start the stack using Docker Compose:
   ```bash
   docker-compose up -d

## Additional Documentation
- [Getting Started with Grafana and Prometheus](https://grafana.com/docs/grafana/latest/getting-started/get-started-grafana-prometheus/): Guide on how to use the technologies together, with useful information on the configuration.