# Use Python 3.6 or later as a base image
FROM python:3.11.3

# Copy contents into image
WORKDIR /app
COPY . .
 
# Install pip dependencies from requirements
RUN pip install -r requirements.txt

# Set environment variables
env LBG_PYTHON_PORT=5000

# Expose the correct port
EXPOSE 5000

# Create an entrypoint
ENTRYPOINT ["python3", "lbg.py"]
