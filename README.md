```
git clone https://github.com/wllenyj/qemu-build-image.git
cd qemu-build-image
sudo docker build -f ./Dockerfile -t wllenyj/qemu-build context
sudo docker push wllenyj/qemu-build:latest
```

```
sudo docker pull wllenyj/qemu-build:latest
sudo docker run -u YOUR-UID -v `pwd`:/build -w /build --rm wllenyj/qemu-build:latest bash
```
