# Use Python as a base image
FROM python:3.11.3

# Copy contents into image
WORKDIR /app
COPY . .
 
# Install pip dependencies from requirements
RUN pip install -r requirements.txt

# Set environment variables
env PORT=${PORT}

# Expose the correct port
EXPOSE ${PORT}

# Create an entrypoint
ENTRYPOINT ["python", "lbg.py"]
