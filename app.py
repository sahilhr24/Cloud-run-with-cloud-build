import requests
from flask import Flask, send_from_directory

app = Flask(__name__)

# Serve the frontend HTML file
@app.route('/')
def index():
    return send_from_directory('.', 'index.html')

# Fetch data from the GKE service
@app.route('/fetch')
def fetch_gke_data():
    try:
        # Private GKE service URL
        gke_url = 'https://aws.amazon.com/'  # Replace with your actual GKE IP
        response = requests.get(gke_url)
        return response.text
    except Exception as e:
        return f"Error: {str(e)}", 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
