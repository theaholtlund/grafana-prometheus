# Grafana Monitoring and Alerting Application

## Introduction
This project provides a Docker-based monitoring and alerting solution, based primarily on Grafana, Prometheus, Node Exporter, Telegraf and MSSQL, allowing a user to monitor the health of devices, databases and other services. It was created as a way to learn how the technologies work, their dependencies and how they can be deployed through Docker, and is therefore relatively introductory and a work in progress. It is also important to note that it is created with macOS in mind, and is therefore tailored to functionality and limitations accordingly.

## Prerequisites
- Docker
- Docker Compose

## Getting Started
To set up and run the application, follow these steps:

1. Clone the repository to your local machine.

2. Navigate to the project directory.

3. Add environment variables referenced in the `docker-compose.yml` file to a project `.env` file. However, it is important to note that SMTP credentials used by Alertmanager, such as usernames and passwords, must be added directly to the `alertmanager.yml` file. This is because Prometheus currently does not support the use of environment variables or configuration substitution. 

4. Start the stack using Docker Compose:
   ```bash
   docker-compose up -d

## Project Component Stack
- **Grafana**: Create user-friendly data visualisations, primarily aimed at observability and analytics. Can be configured for a variety of data sources, and is particularly powerful when creating dashboards and time-series data visualisations. Can also be used for altering through **Grafana OnCall**, which is configured in the web-based UI.
- **Prometheus**: Monitor defined targets, to check on their health and performance. Collects system-level metrics like CPU usage, memory consumption and disk space. Also has alerting functionality through **Alertmanager**, which is specifically created to handle routing, grouping and notifications of Prometheus metric alerts.
- **Telegraf**: Non-specific, platform-agnostic exporter, used for collecting metrics from a wide range of sources, including system metrics, services and databases. As it is not tied to a specific OS, it can collect metrics from Windows, Linux, macOS and other platforms.
- **Node Exporter**: Specialised exporter focused Unix-based systems, and part of the Prometheus ecosystem. In this project, it is used to gather system-level metrics from containers running on the OS, which in this case is macOS, providing insights into the health and resource utilisation of the containers.
- **MSSQL**: Create a containerised Microsoft SQL Server instance, and configure it with some specified environment variables. Allow for testing of an environment where the SQL Server database is running in a container.
- **MSSQL Exporter**: Exporter used to collect metrics from a Microsoft SQL Server instance, enabling monitoring of SQL Server-specific performance metrics and database health.
- **Windows Exporter**: Specialised exporter for Windows-based systems, and only configured in the `prometheus.yml` file for this project, as it is hosted from a macOS and therefore scrapes metrics from a Windows VM where it is running.

## Configuration Details
- [Prometheus Configuration](https://prometheus.io/docs/prometheus/latest/configuration/configuration/): Details on syntax and options when configuring Prometheus.
- [Node Exporter Configuration](https://prometheus.io/docs/guides/node-exporter/): Details on syntax and options when configuring Node Exporter for Prometheus.
- [Telegraf General Inputs](https://github.com/influxdata/telegraf/tree/master/plugins/inputs): Configuration options and settings for input plugins, where each plugin represents a data source or collector that can be used to gather metrics.
- [Telegraf Prometheus Outputs](https://github.com/influxdata/telegraf/tree/master/plugins/outputs/prometheus_client): Configuration settings for Prometheus outputs, used to modify metrics, tags and fields.
- [MSSQL Exporter Documentation](https://github.com/awaragi/prometheus-mssql-exporter/tree/master): Documentation on use and configuration of Prometheus MSSQL Exporter for Docker container environments.

## Additional Learning and Documentation
- [Getting Started with Grafana and Prometheus](https://grafana.com/docs/grafana/latest/getting-started/get-started-grafana-prometheus/): Guide on how to use the technologies together, with useful information on the configuration.
- [Connect to Docker Host from Inside a Container](https://medium.com/@TimvanBaarsen/how-to-connect-to-the-docker-host-from-inside-a-docker-container-112b4c71bc66): Details on how to connect to the Docker host from inside a Docker container, explaining the logic and workflow.
- [Docker on Windows for SQL Server](https://www.sqlservercentral.com/articles/docker-desktop-on-windows-10-for-sql-server-step-by-step): Useful in understanding the configurations for Docker containers on Windows for SQL Server, and how to share data with the host.