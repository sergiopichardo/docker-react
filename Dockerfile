# Build phase 
FROM node:alpine 

WORKDIR /app/

COPY package*.json ./

RUN npm install --no-optional

COPY ./ ./

RUN npm run build


# Run Phase
FROM nginx 

COPY --from=0 /app/build /usr/share/nginx/html

EXPOSE 80

# https://stackoverflow.com/questions/25970711/what-is-the-difference-between-nginx-daemon-on-off-option
CMD ["nginx", "-g", "daemon off;"]


