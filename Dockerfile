FROM anasty17/mltb:latest

RUN apt-get update && apt-get remove -y python3-pip \
    && curl -sS https://bootstrap.pypa.io/get-pip.py | python3

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN pip install --no-cache-dir --upgrade setuptools --break-system-packages

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt --break-system-packages

COPY . .

CMD ["bash", "start.sh"]
