from flask import Flask, jsonify
import requests
from datetime import datetime

app = Flask(__name__)

@app.route('/api/hello')
def hello():
    # Get hostname
    hostname = "server1"  # Placeholder, replace with actual hostname retrieval logic
    
    # Get current datetime
    current_time = datetime.now().strftime("%y%m%d%H%M")
    
    # Get version
    version = "1.0"  # Placeholder, replace with actual version retrieval logic
    
    # Get weather data for Dhaka using a free weather API
    weather_data = get_weather_data("Dhaka")
    
    return jsonify({
        "hostname": hostname,
        "datetime": current_time,
        "version": version,
        "weather": {
            "dhaka": weather_data
        }
    })

def get_weather_data(city):
    # Make a request to a weather API (example: OpenWeatherMap)
    api_key = "your_api_key"  # Replace with your API key
    url = f"http://api.openweathermap.org/data/2.5/weather?q={city}&appid={api_key}&units=metric"
    response = requests.get(url)
    data = response.json()

    # Extract temperature and temperature unit
    temperature = str(data["main"]["temp"])
    temp_unit = "C"

    return {
        "temperature": temperature,
        "temp_unit": temp_unit
    }

if __name__ == '__main__':
    app.run(debug=True)
