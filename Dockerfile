FROM node:alpine AS builder 

# /app/build
WORKDIR '/app'
COPY package.json .
RUN npm install 
#No volumes needed
COPY . . 
RUN npm run build

FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html
