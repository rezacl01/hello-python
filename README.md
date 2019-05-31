# hello-python

1. Run docker container from Docker Hub base image with mounted app folder with python script:

   docker run -it --name running-script --rm -v /home/lu/Projects/hello-python:/app python:3 bash
   docker run -it --name running-script --rm -v /home/lu/Projects/hello-python:/app python:3.7.3-alpine3.8 sh
   docker run -it --name running-script --rm -v /home/lu/Projects/hello-python:/app -w /app python:3.7.3-alpine3.8 python main.py
   
2. Build and run docker container from Dockerfile image listening on port 5000
   
   docker build -t hello-python . && docker run -p 5000:5000 --rm hello-python - pridat volume
   
3. Run docker container from Dockerfile image with mounted volume to avoid rebuilding during development

   docker run -v /home/lu/Projects/hello-python/main.py:/usr/src/app/main.py -p 5000:5000 --rm hello-python
   
4. Access container from console
   docker build -t hello-python . && docker run -it --rm hello-python sh
   
5. Docker-compose
   docker-compose build
   docker-compose up


