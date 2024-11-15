# Docker Examples

## Web Server

This Docker Compose file defines a development environment with three interconnected services: a PHP-based web server, a MySQL database server, and a phpMyAdmin interface for database management. The web server hosts the application code, which is mounted from the local `./code` directory, and is accessible on port `8080` of the host machine. It relies on the MySQL database for backend data storage, ensuring the database is fully initialized and healthy before starting other services.

The MySQL server is configured with a persistent named volume to retain data across container restarts and initializes with an SQL script provided locally. A phpMyAdmin service, exposed on port `5050`, offers a web interface for managing the database. Both the web server and phpMyAdmin services are set to depend on the MySQL server's health status. This setup is useful for local development or testing of PHP applications with MySQL.

## Microservices (Version 1)

This Docker Compose file sets up a multi-service application architecture consisting of a frontend, a backend, a PostgreSQL database, and an NGINX reverse proxy. The frontend, built from the `./frontend` directory, runs on port `3000`, while the backend, built from the `./backend` directory, operates on port `6000`. Both services share a common network (`app-network`) to facilitate communication.  Code is copied to containers on build.

PostgreSQL database provides persistent data storage, running on port `5432`. An NGINX reverse proxy, built from the `./nginx` directory, acts as the gateway for the application, routing traffic to the appropriate services. Exposed on port `8080`, the NGINX service ensures that both the frontend and backend are fully operational before starting. This setup is suitable for developing or testing a full-stack application with clear service separation and a centralized proxy for managing requests.

## Microservices (Version 2)

This Docker Compose file defines a comprehensive multi-service application environment, including a React-based frontend, a Node.js backend, a PostgreSQL database, a phpPgAdmin-like pgAdmin interface, and an NGINX reverse proxy. All services are interconnected through a shared app-network for seamless communication (similar to version 1).

The frontend, built from the `./frontend` directory, is mapped to port `3000` and uses mounted volumes for live updates during development (bo rebuild required).   The backend, built from the `./backend` directory, runs on port `6000` and also mounts source files for development purposes. Both the frontend and backend have their `node_modules` directories preserved to prevent accidental overwrites.

A pgAdmin service, exposed on port `5555`, provides a graphical interface for managing the PostgreSQL database, with data persisted using a volume. The NGINX reverse proxy, running on port `8080`, handles routing between the frontend, backend, and other services. Dependencies ensure that services start in the correct order, with pgAdmin waiting for the database to initialize and NGINX depending on the readiness of the frontend and backend.

This setup is suitable for full-stack application development, offering a complete environment with live-reloading for code changes, database management tools, and centralized request routing.
