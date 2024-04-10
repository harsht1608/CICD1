# Use an official Node.js runtime as a parent image
FROM node:lts-alpine AS builder
# Set the working directory in the container
WORKDIR /
COPY package*.json ./
RUN npm install
COPY . .
# ... Copying files, installing dependencies ...
# Expose the port your app is running on (e.g., 3000)
FROM node:lts-alpine
WORKDIR /
COPY --from=builder /node_modules /node_modules
COPY . .
EXPOSE 3000
# Define the command to run your Node.js application
CMD [ "node", "index.js" ]


