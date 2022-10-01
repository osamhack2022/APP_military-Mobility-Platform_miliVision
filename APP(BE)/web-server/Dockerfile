FROM python:3.9

WORKDIR /MMP
RUN apt update && apt-get install python3 python3-pip -y
RUN pip install poetry
ADD . .
WORKDIR /MMP/backend
RUN poetry install
EXPOSE 8000
