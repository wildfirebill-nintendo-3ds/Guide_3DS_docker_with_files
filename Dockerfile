# Stage 1: Build
FROM node:24-alpine AS builder

WORKDIR /app

# Copy package files
COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci

# Copy source files
COPY docs/ ./docs/
COPY crowdin.yaml ./
COPY clean_translations.py ./
COPY rss.py ./

# Build the site
RUN npm run docs:build

# Stage 2: Production (nginx)
FROM nginx:1.27-alpine AS production

# Install curl for healthchecks
RUN apk add --no-cache curl

# Copy custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy built site from builder
COPY --from=builder /app/docs/.vitepress/dist /usr/share/nginx/html

# Create data directory structure
RUN mkdir -p /usr/share/nginx/html/data/{backups,cache,logs}

# Expose port
EXPOSE 80

# Healthcheck
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
