# multistage build

# stage I, python dependencies
FROM python:3.7.3-alpine3.9 AS dependencies

# create workdir in container
WORKDIR /usr/src/app

# copy and install dependencies (as root)
COPY requirements.txt ./
RUN pip install --no-cache-dir --target vendor -r requirements.txt

# stage II, run app
FROM python:3.7.3-alpine3.9 AS app

# create and switch to user
RUN addgroup -S -g 1000 usergroup && adduser -S -D -u 1000 appuser
USER appuser:usergroup

# create workdir in container
WORKDIR /usr/src/app

# copy stage I dependencies adding user permission
COPY --from=dependencies --chown=appuser:usergroup /usr/src/app/vendor /usr/src/app/vendor

# copy app adding user permission
COPY --chown=appuser:usergroup ./main.py ./usr/src/app/main.py

# define port
EXPOSE 5000

# run app
CMD ["python", "main.py"]
