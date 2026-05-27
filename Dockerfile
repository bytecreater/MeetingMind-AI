# Use official Python runtime as a parent image
FROM python:3.10-slim

# Install ffmpeg for audio processing
RUN apt-get update && \
    apt-get install -y ffmpeg build-essential && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . .

# Expose the port that Streamlit and Render use
EXPOSE 8501

# Command to run the Streamlit app
# We use 0.0.0.0 so Render can route external traffic to it
CMD sh -c "streamlit run app.py --server.port=${PORT:-8501} --server.address=0.0.0.0"