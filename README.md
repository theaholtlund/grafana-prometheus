# Grafana Monitoring and Alerting Application

## Introduction
This project provides a Docker-based monitoring and alerting solution, using primarily Grafana, Prometheus, Node Exporter and MSSQL, allowing a user to monitor the health of devices, databases and other services. It was created as a way to learn how the technologies work, their dependencies and how they can be deployed through Docker, and is therefore relatively introductory and a work in progress. It is also important to note that it is created with macOS in mind, and is therefore tailored to functionality and limitations accordingly.

## Project Component Stack
- **Prometheus**: Monitor targets defined for the project, to check on the health and performance of elements such as servers, virtual machines and network devices. Collects system-level metrics like CPU usage, memory consumption and disk space. Also has alerting functionality through **Alertmanager**, which is specifically created to handle routing, grouping and notifications for Prometheus metric alerts.
- **Grafana**: Create user-friendly data visualisations, primarily aimed at observability and analytics. Can be configured for a variety of data sources, and is particularly powerful when creating dashboards and time-series data visualisations. Can also be used for altering through **Grafana OnCall**, which is configured in the web-based UI and used for managing and acknowledging alerts, tracking ongoing incidents and collaborating with team members.
- **Node Exporter**: Specialised exporter focused Unix-based systems, and part of the Prometheus ecosystem. In this project, it is used to gather system-level metrics from containers running on the OS, which in this case is macOS, providing insights into the health and resource utilisation of the containers.
- **Windows Exporter**: Specialised exporter for Windows-based systems, and only configured in the `prometheus.yml` file for this project, as it is hosted from a macOS and therefore scrapes metrics from a Windows VM where it is running. Used to collect Windows-specific metrics and monitor the health and performance of the Windows VM.
- **Telegraf**: Non-specific, platform-agnostic exporter, used for collecting metrics from a wide range of sources, including system metrics, services and databases. As it is not tied to a specific OS, it can collect metrics from Windows, Linux, macOS and other platforms, making it more versatile.
- **MSSQL**: Create a containerised Microsoft SQL Server instance for the project, and configure it with some specified environment variables. This allows for testing the setup and implications of an environment where the SQL Server database is running in a containerised environment.
- **MSSQL Exporter**: Exporter used to collect metrics from a Microsoft SQL Server instance, enabling monitoring of SQL Server-specific performance metrics and database health.

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

## Additional Documentation
- [Getting Started with Grafana and Prometheus](https://grafana.com/docs/grafana/latest/getting-started/get-started-grafana-prometheus/): Guide on how to use the technologies together, with useful information on the configuration.
- [Connect to Docker Host from Inside a Container](https://medium.com/@TimvanBaarsen/how-to-connect-to-the-docker-host-from-inside-a-docker-container-112b4c71bc66): Details on how to connect to the Docker host from inside a Docker container, explaining the logic and workflow.
- [Docker on Windows for SQL Server](https://www.sqlservercentral.com/articles/docker-desktop-on-windows-10-for-sql-server-step-by-step): Useful in understanding the configurations for Docker containers on Windows for SQL Server, and how to share data with the host.