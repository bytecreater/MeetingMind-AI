FROM python:3.9

# Add this line to install ffmpeg for your audio/video processing!
RUN apt-get update && apt-get install -y ffmpeg 

WORKDIR /code
COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
COPY . .
CMD ["streamlit", "run", "app.py", "--server.port=7860", "--server.address=0.0.0.0"]