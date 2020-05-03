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

CMD ["nginx", "-g", "daemon off;"]


