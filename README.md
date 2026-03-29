# 3ds.hacks.guide - Dockerized

A complete guide to 3DS (and 2DS) custom firmware, from stock to boot9strap.

**Live Site:** https://3ds.hacks.guide/

## Table of Contents

- [Quick Start](#quick-start)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Docker Usage](#docker-usage)
- [Development](#development)
- [GitHub Container Registry](#github-container-registry)
- [Data Directory](#data-directory)
- [Configuration](#configuration)
- [CI/CD Workflows](#cicd-workflows)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)

---

## Quick Start

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/Guide_3DS_docker_with_files.git --recurse-submodules
cd Guide_3DS_docker_with_files

# Run with Docker Compose
docker compose up -d

# Access the site
open http://localhost:8080
```

---

## Prerequisites

- **Docker** >= 24.0
- **Docker Compose** >= 2.20
- **Git** (for cloning with submodules)

For local development without Docker:
- **Node.js** >= 22 (LTS)
- **npm** >= 10

---

## Installation

### 1. Clone the Repository

```bash
git clone https://github.com/YOUR_USERNAME/Guide_3DS_docker_with_files.git --recurse-submodules
cd Guide_3DS_docker_with_files
```

> **Note:** The `--recurse-submodules` flag is required to fetch the VitePress theme.

### 2. Build the Docker Image

```bash
docker build -t guide-3ds .
```

### 3. Run the Container

```bash
docker run -d \
  --name guide-3ds \
  -p 8080:80 \
  -v ./data:/usr/share/nginx/html/data \
  guide-3ds
```

---

## Docker Usage

### Using Docker Compose (Recommended)

```bash
# Start the production container
docker compose up -d

# View logs
docker compose logs -f

# Stop the container
docker compose down

# Restart
docker compose restart
```

### Using npm Scripts

```bash
npm run docker:build    # Build the image
npm run docker:run      # Run the container
npm run docker:up       # Start with docker-compose
npm run docker:down     # Stop containers
npm run docker:logs     # View logs
npm run docker:restart  # Restart containers
```

### Environment Variables

Create a `.env` file to customize ports:

```env
PORT=8080
DEV_PORT=5173
```

---

## Development

### Local Development (without Docker)

```bash
# Install dependencies
npm ci

# Start dev server with hot-reload
npm run docs:dev

# Build for production
npm run docs:build

# Preview production build
npm run docs:preview
```

The dev server runs at http://127.0.0.1:5173/

### Docker Development Mode

```bash
# Run with hot-reload (mounts source files)
docker compose --profile dev up guide-3ds-dev
```

This mounts your local `docs/` and `data/` directories into the container for live editing.

---

## GitHub Container Registry

### Pull the Pre-built Image

```bash
docker pull ghcr.io/YOUR_USERNAME/guide-3ds:latest
docker run -d -p 8080:80 ghcr.io/YOUR_USERNAME/guide-3ds:latest
```

### Available Tags

| Tag | Description |
|-----|-------------|
| `latest` | Latest build from master branch |
| `v1.0.0` | Semantic version release |
| `sha-abc1234` | Specific commit build |

### Authentication (for private repos)

```bash
echo $GITHUB_TOKEN | docker login ghcr.io -u USERNAME --password-stdin
```

---

## Data Directory

The `data/` directory provides persistent storage mounted as a Docker volume:

```
data/
├── backups/   # Site backups and exports
├── cache/     # Build cache and temporary files
└── logs/      # Application logs
```

### Volume Mount

```bash
docker run -v ./data:/usr/share/nginx/html/data guide-3ds
```

See [`data/README.md`](data/README.md) for details.

---

## Configuration

### Dockerfile

- **Base Image:** `node:22-alpine` (builder) / `nginx:1.27-alpine` (production)
- **Multi-stage build** for minimal image size
- **Health checks** enabled
- **Gzip compression** configured
- **Security headers** enabled

### nginx.conf

| Setting | Value |
|---------|-------|
| Listen Port | 80 |
| Gzip | Enabled (level 6) |
| Static Asset Cache | 1 year |
| Security Headers | X-Frame-Options, X-Content-Type-Options, X-XSS-Protection |

---

## CI/CD Workflows

### Docker Publish (`docker-publish.yml`)

Automatically builds and pushes to GitHub Container Registry on:
- Push to `master` branch
- Version tags (`v*`)
- Pull requests (build only, no push)

**Features:**
- Multi-platform builds (amd64, arm64)
- GitHub Actions cache optimization
- Artifact attestation for security
- Automatic tagging (latest, semver, sha)

### Existing Workflows

| Workflow | Trigger | Purpose |
|----------|---------|---------|
| `publish.yml` | Push to master | Deploy to GitHub Pages |
| `test.yml` | Pull requests | Test site build |
| `crowdin-commit.yml` | Schedule (1st, 15th) | Import translations |
| `crowdin-upload.yml` | Push to master | Upload source to Crowdin |

---

## Project Structure

```
Guide_3DS_docker_with_files/
├── .github/
│   ├── workflows/
│   │   ├── docker-publish.yml  # GHCR publish workflow
│   │   ├── publish.yml         # GitHub Pages deploy
│   │   ├── test.yml            # PR build test
│   │   ├── crowdin-commit.yml  # Translation import
│   │   └── crowdin-upload.yml  # Translation upload
│   └── dependabot.yml
├── data/                       # Persistent data (Docker volume)
│   ├── backups/
│   ├── cache/
│   └── logs/
├── docs/
│   ├── .vitepress/
│   │   ├── config.mjs          # VitePress configuration
│   │   ├── i18n/               # Internationalization
│   │   └── theme/              # Custom theme (submodule)
│   ├── _files/                 # File assets
│   ├── _include/               # Shared markdown includes
│   └── *.md                    # Guide pages
├── Dockerfile                  # Production multi-stage build
├── Dockerfile.dev              # Development container
├── docker-compose.yml          # Orchestration
├── nginx.conf                  # Nginx configuration
├── .dockerignore               # Docker build exclusions
├── package.json                # Node.js dependencies
├── crowdin.yaml                # Crowdin translation config
└── README.md                   # This file
```

---

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/my-feature`)
3. Make your changes
4. Test with Docker (`docker compose up`)
5. Commit your changes (`git commit -m 'Add my feature'`)
6. Push to the branch (`git push origin feature/my-feature`)
7. Open a Pull Request

### Testing Changes

```bash
# Build and test locally
docker compose up -d
curl http://localhost:8080

# Or use dev mode for hot-reload
docker compose --profile dev up guide-3ds-dev
```

---

## License

Copyright (C) 2024 Nintendo Homebrew

MIT License - See [LICENSE](LICENSE) for details.
