FROM alpine AS build-env
RUN apk add --no-cache build-base
WORKDIR /app
COPY quotebox/*.c quotebox/*.h quotebox/Makefile .
RUN make listen

FROM alpine
COPY --from=build-env /app/listen /app/listen
WORKDIR /app
CMD ["/app/listen"] 
