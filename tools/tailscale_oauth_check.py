# check .env file
import os
import requests
from dotenv import load_dotenv
load_dotenv()

def get_oauth_credentials():
    client_id = os.getenv("clientId")
    client_secret = os.getenv("clientSecret")

    if not client_id or not client_secret:
        raise ValueError("OAuth credentials are not set in environment variables.")

    return client_id, client_secret

def tailscale_oauth_check():
    client_id, client_secret = get_oauth_credentials()
    print(f"Client ID: {client_id}")
    print(f"Client Secret: {client_secret}")
    # Here you would add the logic to check OAuth credentials with Tailscale
    # For example, making an API call to Tailscale with these credentials
    response = requests.post(
        "https://api.tailscale.com/api/v2/oauth/token",
        auth=(client_id, client_secret),
        json={"grant_type": "client_credentials"}
    )
    if response.status_code == 200:
        print("OAuth credentials are valid.")
        print(f"Response: {response.json()}")
    else:
        print("OAuth credentials are invalid.")
        print(f"Response: {response.status_code} - {response.text}")
# tailscale_oauth_check()
# Trying to create a key with OAuth credentials with another link
#Post \"https://api.tailscale.com/api/v2/tailnet/-/keys\" \
def check_2():
    client_id, client_secret = get_oauth_credentials()
    response = requests.post(
        "https://api.tailscale.com/api/v2/tailnet/-/keys",
        auth=(client_id, client_secret),
        json={"capabilities": ["devices:write"]}
    )
    if response.status_code == 200:
        print("Successfully created a key with OAuth credentials.")
        print(f"Response: {response.json()}")
    else:
        print("Failed to create a key with OAuth credentials.")
        print(f"Response: {response.status_code} - {response.text}")
# check_2()