# Cup

The easiest way to manage your container updates.

Cup is a small utility with a big impact. Simplify your container management workflow with fast and efficient update checking, a full-featured CLI and web interface, and more.

## Links

<https://cup.sergi0g.dev>

<https://github.com/sergi0g/cup>

<https://ghcr.io/sergi0g/cup>

## Config

Configurations are done via a user-config.

- create a folder structure like that:


- docker-compose.yml:

```yml
services:
  volumes:
      - ${RUNTIPI_APP_DATA_PATH}/user-config/${APP_STORE_ID}/${APP_NAME}/cup.json:/config/cup.json
  cup:
    command: -c /config/cup.json serve
```

- cup.json:

  <https://cup.sergi0g.dev/docs/configuration#configuration-file>