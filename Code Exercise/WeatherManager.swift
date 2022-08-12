import Foundation

struct WeatherManager {

    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=3f413e250242a4ca401bf02c302006cc&lang=kr&units=metric"

    func fetchWeather(cityName: String) {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        print(urlString)
    }
}
