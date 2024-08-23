# OpenResty Docker Setup with Custom Nginx Configuration and Lua Scripts

This repository contains a Docker setup for running OpenResty with a custom Nginx configuration. The setup includes the installation of the `lua-resty-jwt` module and a custom `nginx.conf` to configure the server. Additionally, there are examples of Lua scripts that can be used to extend the functionality of the Nginx server.

## Getting Started

### Prerequisites

Make sure you have the following installed on your system:

- Docker: [Install Docker](https://docs.docker.com/get-docker/)
- Docker Compose: [Install Docker Compose](https://docs.docker.com/compose/install/)

### Installation

1. Clone this repository:

    ```bash
    git clone https://github.com/saeedshoh/openresty-docker.git
    cd openresty-docker
    ```

2. Build and start the Docker container:

    ```bash
    docker-compose up --build
    ```

3. Open your browser and navigate to `http://localhost:8080` to see the running OpenResty server.

### Configuration

- The `nginx.conf` file is located in the `conf/` directory. You can modify this file to adjust the Nginx configuration according to your needs.
- The Docker container mounts this configuration file into the container at `/usr/local/openresty/nginx/conf/nginx.conf`.

### Environment Variables

You can configure the following environment variables in the `docker-compose.yml` file or pass them directly using Docker commands:

- `PORT`: The port on which the OpenResty server listens (default is `8080`).

### Troubleshooting

If you encounter errors related to file mounting or container startup, ensure that:

- The file paths in `docker-compose.yml` are correct and the files exist in the specified locations.
- The permissions on the `nginx.conf` file are set correctly to allow it to be read by Docker.

### Using Lua Scripts

You can extend the functionality of Nginx by using Lua scripts. Below are examples of how to use Lua directly in your `nginx.conf` file and how to include external Lua scripts.

#### Example 1: Inline Lua Script

You can write Lua code directly in the Nginx configuration using the `content_by_lua_block` directive. Here's an example:

```nginx
location /hello {
    content_by_lua_block {
        local hello = string.format("Привет %s!", ngx.var.remote_addr)
        ngx.say(hello)
    }
}
```

### Customization

You can customize the Docker image by modifying the `Dockerfile`. For example, you can add additional Lua modules or customize the OpenResty installation.

### Contributing

Contributions are welcome! Please fork this repository, make your changes, and submit a pull request.

### License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
