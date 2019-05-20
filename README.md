# hello-python

1. Run docker container from Docker Hub base image with mounted app folder with python script:

   docker run -it --name running-script --rm -v /home/lu/Projects/docker-app:/app python:3 bash
   docker run -it --name running-script --rm -v /home/lu/Projects/docker-app:/app python:3.7.3-alpine3.8 sh
   docker run -it --name running-script --rm -v /home/lu/Projects/docker-app:/app -w /app python:3.7.3-alpine3.8 python calculator.py
   
2. Build and run docker container from Dockerfile image listening on port 5000
   
   docker build -t hello-python . && docker run -it -p 5000:5000 --rm hello-python
