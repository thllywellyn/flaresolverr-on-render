FROM python:3.11-slim

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    xvfb \
    chromium \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Selenium and undetected-chromedriver
RUN pip install --upgrade pip selenium undetected-chromedriver

# Copy FlareSolverr source code
COPY . /app

# Move FlareSolverr files to root only if /app/src/ exists
RUN if [ -d "/app/src" ]; then mv /app/src/* /app/; fi

# Set working directory
WORKDIR /app

# Command to run FlareSolverr
CMD ["python", "flaresolverr.py"]
