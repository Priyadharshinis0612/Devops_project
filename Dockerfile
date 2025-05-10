# Base image with Node.js
FROM node:18

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json (if any)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy everything into the container
COPY . .

# Expose the port
EXPOSE 3000

# Start the app
CMD ["node", "server.js"]
