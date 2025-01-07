
# Using the multi-stage build pattern to create a smaller image 1.0GB > 739.3MB
# Use the official Node.js 23.5.0 Alpine image as the base image for the build stage
FROM node:23.5.0-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy the rest of the application code to the working directory
COPY  . .

# Build the application
RUN npm run build

# Use the official Node.js 18 Alpine image as the base image for the runtime stage
FROM node:23.5.0-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the built application from the builder stage
COPY --from=builder /app ./

# Add a non-root user with a specific UID and set it as the current user
RUN adduser -D -u 1001 nextjs
USER nextjs

# Expose port 3000 for the application
EXPOSE 3000

# Define the command to run the application
CMD ["npm", "start"]
