# linux development environment in docker on mac

### build

```shell
docker build --tag devhost .
```

### change memory limit for container

1. open Docker Desktop for Mac

2. Settings -> Resources -> Advanced

> **NOTE**
> the above operations are to set hard limit on memory.
> `docker run --memory 520m -it --name foo devhost` set the soft limit.
>
> Memory usage can be observed by command `docker stat foo`
