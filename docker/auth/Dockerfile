FROM node
WORKDIR /app
COPY auth/package*.json /app
RUN npm install
COPY auth/*.html auth/*.js /app
CMD ["node","listen.js"]
