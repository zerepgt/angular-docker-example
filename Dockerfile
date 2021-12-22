# Create image based on the official Node 16 image from dockerhub
FROM node:16

# Create a directory where our app will be placed
RUN mkdir -p /app

# Change directory so that our commands run inside this new directory
WORKDIR /app

# Copy dependency definitions
COPY package*.json /app/

# Install dependencies
RUN npm install

# Get all the code needed to run the app
COPY . /app/

RUN npm run build --prod

# Expose the port the app runs in
EXPOSE 4200

# Serve the app
CMD ["npm", "start"]