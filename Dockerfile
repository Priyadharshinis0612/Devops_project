# Base image with Node.js
FROM node:18

# Create app directory inside container
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of your code
COPY . .

# Run the app
CMD ["node", "app.js"]

