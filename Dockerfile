# Use official Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY streamlit_app.py .

# Optional: Embed data into Docker image (secure but less flexible)
# COPY data/data.xlsx ./data.xlsx
COPY data/iom_logo.svg /app/data/iom_logo.svg

# Expose port
EXPOSE 8501

# Start the Streamlit app
CMD ["streamlit", "run", "streamlit_app.py", "--server.address", "0.0.0.0"]
