FROM alpine
RUN apk add --no-cache bash nmap-ncat
WORKDIR /app
COPY jokebox/*.sh .
CMD ["/app/listen.sh"] 
EXPOSE 8080
