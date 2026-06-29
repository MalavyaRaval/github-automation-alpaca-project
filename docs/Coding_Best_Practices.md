# Coding Best Practices

This document outlines best practices for writing maintainable code, including linters, formatters, debuggers, and Docker.

## Linters and Formatters

### Python
- **Black**: Code formatter.
- **Flake8**: Linter.

Installation:
```bash
pip install black flake8
```

Usage:
```bash
# Format code
black .

# Lint code
flake8 .
```

### JavaScript
- **ESLint**: Linter.
- **Prettier**: Code formatter.

Installation:
```bash
npm install --global eslint prettier
```

### Shell Scripts
- **ShellCheck**: Linter.

Installation:
```bash
sudo apt-get install shellcheck -y
```

## Debuggers

### Python
- **Debugpy**: Debugger for VS Code.

Installation:
```bash
pip install debugpy
```

### Node.js
- **Node Inspect**: Debugger for VS Code.

Installation:
```bash
npm install --global node-inspect
```

## Docker

### Installation
```bash
sudo apt-get install docker.io -y
sudo systemctl enable docker
sudo systemctl start docker
```

### Example Dockerfile
```dockerfile
FROM python:3.10-slim

WORKDIR /app
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "scripts/github_api_example.py"]
```