import Foundation

// A type that can decode itself from an external representation.
// typealias Codable = Decodable & Encodable
struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]


    struct Main: Codable {
        let temp: Double
    }
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}


//{
//    "coord": {
//    "lon": 126.9778,
//    "lat": 37.5683
//},
//    "weather": [
//    {
//        "id": 800,
//        "main": "Clear",
//        "description": "맑음",
//        "icon": "01n"
//    }
//],
//    "base": "stations",
//    "main": {
//    "temp": 23.66,
//    "feels_like": 24.14,
//    "temp_min": 23.66,
//    "temp_max": 23.69,
//    "pressure": 1006,
//    "humidity": 79,
//    "sea_level": 1006,
//    "grnd_level": 999
//},
//    "visibility": 10000,
//    "wind": {
//    "speed": 0.76,
//    "deg": 187,
//    "gust": 0.84
//},
//    "clouds": {
//    "all": 5
//},
//    "dt": 1660658461,
//    "sys": {
//    "type": 1,
//    "id": 5509,
//    "country": "KR",
//    "sunrise": 1660596506,
//    "sunset": 1660645488
//},
//    "timezone": 32400,
//    "id": 1835848,
//    "name": "Seoul",
//    "cod": 200
//}