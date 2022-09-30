FROM python:3.9

WORKDIR /MMP
RUN apt update && apt-get install python3 python3-pip -y
ADD . .
RUN pip install poetry
RUN poetry install
EXPOSE 8000


WORKDIR /MMP/backend
CMD poetry run daphne -b 0.0.0.0 -p 8000 backend.asgi:application
