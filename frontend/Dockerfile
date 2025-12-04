# STAGE 1 — BUILD FRONTEND

FROM node:22-alpine AS build
 
WORKDIR /app
 
COPY package*.json ./
RUN npm install
 
COPY . .
 
RUN npm run build
 
# STAGE 2 — SERVE WITH NGINX

FROM nginx:1.25-alpine
 
# Remove the default Nginx static assets
RUN rm -rf /usr/share/nginx/html/*
 
# Copy React build output from Stage 1
COPY --from=build /app/dist /usr/share/nginx/html
 
# Expose port 80 for the ALB/ECS/Browser
EXPOSE 80
 
# Start Nginx
CMD ["nginx", "-g", "daemon off;"]