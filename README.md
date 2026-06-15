# Identity API

Authentication and authorization microservice for the e-commerce platform.

## Features

* User registration
* User login
* JWT authentication
* Prometheus metrics
* Health checks
* MySQL integration

## Tech Stack

* ASP.NET Core 10
* Entity Framework Core
* MySQL
* Docker

## Run with Docker

### Build Image

```bash
docker build -t identity-api:v1 .
```

### Run Container

```bash
docker run -d \
--name identity-api-dev \
-p 8080:8080 \
-e ASPNETCORE_URLS=http://+:8080 \
-e ConnectionStrings__MySQL="Server=host.docker.internal;Port=3306;Database=ecommerce;User=root;Password=rootpass123;" \
-e Jwt__Key="ThisIsA32CharOrLongerSuperSecretKey!2025" \
-e Jwt__Issuer="ecommerce-identity" \
-e Jwt__Audience="ecommerce" \
identity-api:v1
```

## Endpoints

* `/api/identity/register`
* `/api/identity/login`
* `/health`
* `/metrics`

## Port

* 8080
# trigger Mon Jun 15 06:14:51 PM EEST 2026
