FROM anasty17/mltb:latest

RUN apt update && apt upgrade -y
RUN apt-get install git -y
RUN git clone https://github.com/rahulkhatri137/mirror-leech-telegram-bot /root/bot
RUN chmod 777 /root/bot
WORKDIR /root/bot
COPY extract /usr/local/bin
COPY pextract /usr/local/bin
RUN chmod +x /usr/local/bin/extract && chmod +x /usr/local/bin
COPY .netrc /root/.netrc
RUN pip3 install --no-cache-dir -r requirements.txt
COPY config.env .
COPY token.pickle .
COPY start .
CMD ["bash", "/root/bot/start"]
