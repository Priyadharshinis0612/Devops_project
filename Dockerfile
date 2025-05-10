FROM node:18

# Set the working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the entire src folder
COPY . .

# Set the command to run the server.js (Express app)
CMD ["node", "src/js/server.js"]
