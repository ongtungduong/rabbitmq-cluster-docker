# RabbitMQ Cluster Docker

Setup a RabbitMQ Cluster using the [RabbitMQ](https://hub.docker.com/_/rabbitmq/) official docker image with Docker Compose.


## Quick start

```
chmod +x start.sh
./start.sh
```


## Configuration

### `docker-compose.yml`

Docker [compose](https://docs.docker.com/compose/compose-file/) config file, including 3 RabbitMQ service cluster and a HAProxy.

| Service      | Description               |
| ------------ | ------------------------- |
| `rabbitmq-1` | RabbitMQ (cluster)        |
| `rabbitmq-2` | RabbitMQ (cluster member) |
| `rabbitmq-3` | RabbitMQ (cluster member) |
| `haproxy`    | Load Balancer             |

#### Default expose ports

| Host              | Description                                         |
| ----------------- | --------------------------------------------------- |
| `localhost:5672`  | AMQP 0-9-1 and AMQP 1.0 clients                     |
| `localhost:15672` | HTTP API clients, management UI and `rabbitmqadmin` |

### `.env`

RABBITMQ_PASSWORD will be generated automatically.

| Name                     | Default |
| ------------------------ | ------- |
| `RABBITMQ_USER`          | admin   |
| `RABBITMQ_PASSWORD`      | ?       |
| `RABBITMQ_VHOST`         | /       |

### `.erlang.cookie`

.erlang.cookie will be generated automatically.

### `haproxy.cfg`

Load balancer [HA Proxy](http://www.haproxy.org/) config. Including the load balancing config and the hostnames of the nodes in cluster.
