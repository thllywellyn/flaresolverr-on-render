FROM python:3.11-slim

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    xvfb \
    chromium-browser \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Selenium and undetected-chromedriver
RUN pip install --upgrade pip selenium undetected-chromedriver

# Copy FlareSolverr source code
COPY . /app

# Set working directory
WORKDIR /app

# Command to run FlareSolverr
CMD ["python", "src/flaresolverr.py"]
