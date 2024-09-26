# Project Ludi - On-Premises Infrastructure Monitoring Solution Using Zabbix

## Overview

Project Ludi is a pilot web application designed for enterprise-level IT infrastructure monitoring, leveraging the robust Zabbix engine. The project aims to assess the functionality and scalability of the system in managing complex network environments. It provides comprehensive monitoring, real-time analytics, and performance insights tailored to large-scale operations. As a proof of concept (PoC), Project Ludi will be refined and extended based on initial feedback.

## Key Features

- Real-Time Monitoring: Monitor system performance, availability, and security events in real-time.
- Scalability: Designed to support both small and large-scale environments, easily adapting to growing infrastructure needs.
- Custom Alerts: Configure custom triggers and alerts to monitor critical thresholds and events.
- Performance Analysis: Track and visualize historical performance data to optimize infrastructure usage.
- Open-Source: Built on top of the open-source Zabbix engine, allowing for customization and integration with other systems.

## Requirements

### Languages and Frameworks

- Ruby on Rails
- Ruby 2.4.3
- VueJS
- jQuery 2.x
- SCSS

### System Dependencies

- CentOS 7.x
- CentOS 6.x

### Database

- MariaDB 10.x

## Configuration

- Ensure the following configuration files are properly set:
  - `config/database.yml`: Database configuration settings.
  - `config/application.yml`: Application-level environment settings.

## Installation

### Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/baecheongho/project_ludi.git
   cd project_ludi
   ```

2. Install the required system dependencies on a CentOS 6.x or 7.x server.

3. Set up the Zabbix server and database:
   - Install MariaDB 10.x.
   - Configure the database using `config/database.yml`.

4. Install Ruby on Rails and the required gems:
   ```bash
   bundle install
   ```

5. Configure the application settings using `config/application.yml`.

6. Start the Rails server:
   ```bash
   rails -s xxx.xxx.xxx.xxx -p xxxx
   ```

## Testing

To run the test suite, use the following command:
```bash
rails test
```

## Usage

1. Add Hosts: Add servers, switches, or devices you want to monitor through the Zabbix interface.
2. Configure Triggers: Set up custom conditions for alerts and notifications.
3. Visualize Data: Use the web interface to monitor real-time data and generate performance reports.

## Project Structure

- `config/`: Configuration files for databases, environment settings, and application settings.
- `scripts/`: Custom monitoring scripts for additional use cases.
- `docs/`: Documentation on installation, usage, and configuration.

## Contributions

Contributions to Project Ludi are welcome. Feel free to fork the repository and submit a pull request. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

This version provides a clearer structure, highlights key features, and includes instructions that are more aligned with real-world usage. It also incorporates the previous setup information in a more standardized way.
