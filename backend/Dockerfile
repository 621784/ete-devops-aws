FROM node:20-alpine

# 2. Create app directory

WORKDIR /app

COPY package*.json ./
 
#Install only production dependencies

RUN npm install --production
 
# Copy the rest of your backend code

COPY . .
 
# Expose backend API port

EXPOSE 5000
 
#Start backend server

CMD ["node", "index.js"]

 