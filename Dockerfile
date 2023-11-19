# Use an official Python runtime as a parent image
FROM python:3

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install necessary build tools, including pkg-config, libmariadb-dev-compat, and libmariadb-dev
RUN apt-get update && apt-get install -y \
    pkg-config \
    libmariadb-dev-compat \
    libmariadb-dev \
    gcc \
    # Add other dependencies if needed
    && rm -rf /var/lib/apt/lists/*

# Install any needed packages specified in requirements.txt
RUN pip3 install -r requirements.txt

# Make port 3000 available to the world outside this container
EXPOSE 3000

CMD ["python3", "manage.py", "runserver", "0.0.0.0:3000"]