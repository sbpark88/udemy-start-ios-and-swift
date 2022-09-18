import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {

    // swiftlint:disable line_length
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=3f413e250242a4ca401bf02c302006cc&lang=kr&units=metric"
    var weatherData: WeatherData?
    var weatherCondition: String?

    var delegate: WeatherManagerDelegate?

    func fetchWeather(_ cityName: String) {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        performRequest(with: urlString)
    }

    // I can use the parameter types to both CLLocationDegrees and Double, becuase of 'typealias CLLocationDegrees = Double'.
    func fetchWeather(latitude: CLLocationDegrees, longitude: Double) {
        let urlString = "\(weatherUrl)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }

    private func performRequest(with urlString: String) {
        // 1. Create a URL
        guard let url = URL(string: urlString) else { return }

        // 2. Create a URLSession
        let session = URLSession(configuration: .default)

        // 3. Give the session a task
        // anonymous function
//        let task: URLSessionDataTask = session.dataTask(with: url, completionHandler: handle(data:response:error:))
        let task: URLSessionDataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                print(error)
                return
            }

            guard let safeData = data else { return }
            guard let weather = parseJson(safeData) else { return }
            delegate?.didUpdateWeather(self, weather: weather)
        }

        // 4. Start the task
        task.resume()
    }

    private func parseJson(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData: WeatherData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name

            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }

}
