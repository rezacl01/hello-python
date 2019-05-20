FROM python:3.7.3-alpine3.9 AS dependencies

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip install --no-cache-dir --target vendor -r requirements.txt

COPY . .


FROM python:3.7.3-alpine3.9 AS app

WORKDIR /usr/src/app

COPY --from=dependencies /usr/src/app /usr/src/app

EXPOSE 5000

CMD ["python", "main.py"]

