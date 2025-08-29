# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a NestJS TypeScript application demonstrating GitHub Container Registry integration. It's a standard NestJS starter project with Docker containerization capabilities and GitHub Actions workflow support.

## Package Manager

This project uses **pnpm** as the package manager. All commands in the README use pnpm, and the package-lock.json suggests npm was used initially but pnpm is the preferred choice.

## Development Commands

### Setup
```bash
pnpm install
```

### Development Server
```bash
pnpm run start        # basic start
pnpm run start:dev    # watch mode (recommended for development)
pnpm run start:debug  # debug mode with watch
```

### Build and Production
```bash
pnpm run build       # compile TypeScript to dist/
pnpm run start:prod  # run production build
```

### Testing
```bash
pnpm run test        # run unit tests
pnpm run test:watch  # run tests in watch mode
pnpm run test:e2e    # run end-to-end tests
pnpm run test:cov    # run tests with coverage report
pnpm run test:debug  # run tests in debug mode
```

### Code Quality
```bash
pnpm run lint        # run ESLint with auto-fix
pnpm run format      # format code with Prettier
```

## Docker Configuration

The project includes two Docker configurations:

1. **Dockerfile.registry** - Multi-stage build using GitHub Container Registry base image (`ghcr.io/nadzmiidzham/ghcr-demo:latest`)
2. **Dockerfile** - Simple single-stage build using Node.js Alpine image

### Docker Compose
```bash
docker-compose up    # runs the app on port 3000
```

## Architecture

### Standard NestJS Structure
- **src/main.ts** - Application entry point, bootstraps NestJS app on port 3000 (configurable via PORT env var)
- **src/app.module.ts** - Root application module
- **src/app.controller.ts** - Root controller with single GET endpoint
- **src/app.service.ts** - Root service with basic "Hello World" functionality

### Test Structure
- **src/** - Unit tests (.spec.ts files) co-located with source files
- **test/** - E2E tests with separate Jest configuration (jest-e2e.json)

### Configuration Files
- **nest-cli.json** - NestJS CLI configuration
- **tsconfig.json** / **tsconfig.build.json** - TypeScript configurations
- **eslint.config.mjs** - ESLint configuration (modern flat config format)

## Container Registry Integration

The project demonstrates GitHub Container Registry usage with:
- Multi-stage Docker builds
- Base image from GHCR (`ghcr.io/nadzmiidzham/ghcr-demo:latest`)
- GitHub Actions workflow support (workflows in .github/ directory)

## Key Dependencies

- **@nestjs/core** - NestJS framework core
- **@nestjs/platform-express** - Express.js platform adapter
- **reflect-metadata** - Required for NestJS decorators
- **rxjs** - Reactive extensions for async operations

## Test Configuration

Jest is configured with:
- TypeScript support via ts-jest
- Test files matching `*.spec.ts` pattern
- Coverage collection from all TypeScript files
- Separate E2E configuration in test/jest-e2e.json