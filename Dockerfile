FROM alpine:3 AS builder

# Install build-time dependencies (compilers, headers, dev tools)
RUN apk add --no-cache \
    python3-dev \
    py3-pip \
    qt5-qtbase-dev \
    qt5-qtsvg-dev \
    py3-pyside6 \
    cups-dev \
    libxml2-dev \
    libxslt-dev \
    build-base

# Install Inkcut into a specific directory (e.g., /opt/inkcut) or global
# Using a virtual environment is recommended for easier copying
RUN python3 -m venv /opt/inkcut-env
ENV PATH="/opt/inkcut-env/bin:$PATH"
RUN pip install --no-cache-dir inkcut

# Start a fresh stage for the final image
FROM alpine:3

# Install ONLY runtime dependencies (no compilers or -dev packages)
RUN apk add --no-cache \
    python3 \
    qt5-qtbase \
    qt5-qtsvg \
    py3-pyside6 \
    cups-libs \
    libxml2 \
    libxslt

# Copy the virtual environment from the builder stage
COPY --from=builder /opt/inkcut-env /opt/inkcut-env

# Set the path to use the copied environment
ENV PATH="/opt/inkcut-env/bin:$PATH"

# Set the entrypoint
ENTRYPOINT ["inkcut"]
