# linux development environment in docker on mac

### build

```shell
docker build --tag devhost .
```

### change memory limit for container

1. open Docker Desktop for Mac

2. Settings -> Resources -> Advanced

> **NOTE**
>
> * the above operations are to set hard limit on memory.
> * `docker run --memory 520m -it --name foo devhost` set the soft limit.
> * Memory usage can be observed by command `docker stat foo`


**Disadvantages**

* not very convenient, especialy for docker command


### vagrant

another option is to use vagrant + virtualbox.

create a directory and copy **Vagrantfile** to that direcoty. execute following commands:

```shell
./build.sh
```

**Disadvantages**

* often subtle problem so hard to solve


---------------

**references**

* https://m1314.cn/598.html
