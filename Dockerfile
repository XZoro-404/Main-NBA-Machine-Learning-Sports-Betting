# Use an official Python runtime as the base image
FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Copy only the requirements file to leverage Docker caching
COPY requirements.txt /app/requirements.txt

# Install dependencies
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy the rest of the application files
COPY . ./

# Expose the application's port
EXPOSE 5000

# Set the working directory for Flask (if Flask files are in a subdirectory)
WORKDIR /app/Flask

ENTRYPOINT ["flask", "run", "--host=0.0.0.0", "--port=5000"]

# Run main.py to get data, then start the Flask server
#CMD ["sh", "-c", "python /app/main.py -xgb -odds=fanduel && cd Flask && flask run --host=0.0.0.0 --port=5000"]
