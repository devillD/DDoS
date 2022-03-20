FROM ghcr.io/devilld/py-dev

WORKDIR /app
COPY . .

RUN apt -qq update && \
    apt -qq install git -y && \
    pip3 install --no-cache-dir -r requirements.txt && \
    apt remove git -y && \
    apt autoremove -y && \
    apt clean all && rm -rf /var/cache/apt/*

ENTRYPOINT ["python3", "/app/start.py"]
