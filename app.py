import requests
from flask import Flask

app = Flask(__name__)

def fetch_data_from_gke():
    # Private GKE service URL (internal IP or DNS if resolved inside the VPC)
    gke_url = 'http://192.168.2.240:80'  # Example private IP of GKE service
    
    # Make a request to the private GKE service
    response = requests.get(gke_url)
    
    # Process and return the response data
    return response.text

@app.route('/')
def handle_request():
    # Fetch data from the GKE service
    data = fetch_data_from_gke()
    
    # Return the data to the user
    return data
