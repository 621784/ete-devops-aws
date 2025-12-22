FROM node:20-alpine

# Create app directory

WORKDIR /app

COPY package*.json ./
 
#Install only production dependencies

RUN npm install --production
RUN npm install --save express
 
# Copy the rest of your backend code

COPY . .
 
# Expose backend API port

EXPOSE 5000
 
#Start backend server

CMD ["node", "index.js"]

 