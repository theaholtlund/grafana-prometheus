# Grafana Monitoring and Alerting Application

## Introduction

This project provides a Docker-based monitoring and alerting solution, based primarily on Grafana, Prometheus, Node Exporter, Telegraf and MSSQL, allowing a user to monitor the health of devices, databases and other services. It was created as a way to learn how the technologies work, their dependencies and how they can be deployed through Docker, and is therefore relatively introductory and a work in progress. It is also important to note that it is created with macOS in mind, and is therefore tailored to functionality and limitations accordingly.

## Prerequisites

<details open>
<summary>Show / Hide Section</summary>

- Docker
- Docker Compose

</details>

## Getting Started

<details open>
<summary>Show / Hide Section</summary>

To set up and run the application, follow these steps:

1. Clone the repository to your local machine.

2. Navigate to the project directory.

3. Add environment variables referenced in the `docker-compose.yml` file to a project `.env` file. However, it is important to note that SMTP credentials used by Alertmanager, such as usernames and passwords, must be added directly to the `alertmanager.yml` file in the `configs` folder. This is because Prometheus currently does not support the use of environment variables or config substitution.

4. Add an `nginx.conf` file to the `configs` folder, if you want to use proxying. The `docker-compose.yml` file will create an Nginx container, but configs must be added manually as the Nginx config does not support environment variables out of the box.

5. Start the stack using Docker Compose:

   ```bash
   docker-compose up -d

   ```

6. The first Node Exporter container, `node_exporter_1`, has functionality for textfilt metrics. Enable a (hypothetical, as this is for testing as of now) continuous gathering of defined metrics by running the `update-metrics.sh` script inside the container:

   ```bash
   docker exec -it node_exporter_1 /bin/sh -c "chmod +x ./update-metrics.sh"
   ```

</details>

## Project Component Stack

<details hide>
<summary>Show / Hide Section</summary>

- **Grafana**: Create data visualisations, primarily aimed at observability and analytics. Can be configured for a variety of data sources, and is particularly powerful when creating dashboards and time-series data visualisations. Can also be used for altering through **Grafana Alerting**, combined with incident response management through **Grafana OnCall**, which is configured in the web-based UI.
- **Grafana OnCall**: Serves as the core component for the monitoring and alerting functionality, offering incident management, escalation policies and on-call scheduling. Configured in the Grafana web-based UI.
- **Celery**: Handles asynchronous and distributed task processing and queue management. Can be implemented for parallel execution and scheduled tasks.
- **Redis**: An in-memory key-value store and the message broker for Celery, acting as a communication channel between different parts of the application by facilitate communication and task distribution. Commonly used for internal communication between containers.
- **Nginx**: Can be used as a web server, reverse proxy and load balancer, to facilitate caching, serve web pages, applications and balance incoming web traffic to multiple servers.
- **Prometheus**: Monitor defined targets, to check on their health and performance. Collects system-level metrics like CPU usage, memory consumption and disk space. Also has alerting functionality through **Alertmanager**, which is specifically created to handle routing, grouping and notifications of Prometheus metric alerts.
- **Telegraf**: Non-specific, platform-agnostic exporter, used for collecting metrics from a wide range of sources. Can collect metrics from Windows, Linux, macOS and other platforms, as well as services, databases and more.
- **Node Exporter**: Specialised exporter focused Unix-based systems, and part of the Prometheus ecosystem. In this project, it is used to gather system-level metrics from containers running on the OS, which in this case is macOS.
- **MSSQL Server**: Create a containerised Microsoft SQL Server environment on Linux for Docker Engine. It is here used to create an instance of the MSSQL Server program, a relational database management system, later used for creating testing databases.
- **MSSQL Exporter**: Exporter used to collect metrics from a Microsoft SQL Server instance, enabling monitoring of SQL Server-specific performance metrics and database health.
- **Windows Exporter**: Specialised exporter for Windows-based systems, and only configured in the `prometheus.yml` file for this project, as it is hosted from a macOS and therefore scrapes metrics from a Windows VM where it is running.

</details>

## Configuration Details

<details hide>
<summary>Show / Hide Section</summary>

- [Prometheus Configuration](https://prometheus.io/docs/prometheus/latest/configuration/configuration/): Details on syntax and options when configuring Prometheus.
- [Node Exporter Configuration](https://prometheus.io/docs/guides/node-exporter/): Details on syntax and options when configuring Node Exporter for Prometheus.
- [Telegraf General Inputs](https://github.com/influxdata/telegraf/tree/master/plugins/inputs): Configuration options and settings for input plugins, where each plugin represents a data source or collector that can be used to gather metrics.
- [Telegraf Prometheus Outputs](https://github.com/influxdata/telegraf/tree/master/plugins/outputs/prometheus_client): Configuration settings for Prometheus outputs, used to modify metrics, tags and fields.
- [MSSQL Exporter Documentation](https://github.com/awaragi/prometheus-mssql-exporter/tree/master): Documentation on use and configuration of Prometheus MSSQL Exporter for Docker container environments.

</details>

## Additional Learning and Documentation

<details hide>
<summary>Show / Hide Section</summary>

- [Getting Started with Grafana and Prometheus](https://grafana.com/docs/grafana/latest/getting-started/get-started-grafana-prometheus/): Guide on how to use the technologies together, with useful information on the configuration.
- [Connect to Docker Host from Inside a Container](https://medium.com/@TimvanBaarsen/how-to-connect-to-the-docker-host-from-inside-a-docker-container-112b4c71bc66): Details on how to connect to the Docker host from inside a Docker container, explaining the logic and workflow.
- [Docker on Windows for SQL Server](https://www.sqlservercentral.com/articles/docker-desktop-on-windows-10-for-sql-server-step-by-step): Useful in understanding the configurations for Docker containers on Windows for SQL Server, and how to share data with the host.

</details>
