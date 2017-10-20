FROM python:3.6.3-alpine3.6


WORKDIR /app

COPY dependecies.txt /app/
RUN pip install -r dependecies.txt

COPY main.py /app/
COPY Enigmatos-468c9c05e0f7.json /app/



CMD ["python", "main.py"]