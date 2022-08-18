import Foundation

struct WeatherManager {

    // swiftlint:disable line_length
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=3f413e250242a4ca401bf02c302006cc&lang=kr&units=metric"
    var weatherData: WeatherData?
    var weatherCondition: String?

    mutating func fetchWeather(cityName: String) {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        print(urlString)
        performRequest(urlString: urlString)
    }

    private mutating func performRequest(urlString: String) {
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
            weatherData = parseJson(weatherData: safeData)
            weatherCondition = getConditionName(weatherId: weatherData!.weather[0].id)
        }

        // 4. Start the task
        task.resume()

        /*func handle(data: Data?, response: URLResponse?, error: Error?) {
            if let error = error {
                print(error)
                return
            }

            guard let safeData = data else { return }
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString as Any)
        }*/
    }

    private func parseJson(weatherData: Data) -> WeatherData? {
        let decoder = JSONDecoder()

        do {
            let decodedData: WeatherData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            return decodedData
        } catch {
            print("Cannot change from JSON to Swift object.")
            return nil
        }
    }

    private func getConditionName(weatherId: Int) -> String {
        switch weatherId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }

    /*func getWeatherData() -> WeatherData? {
        weatherData
    }

    func getWeatherCondition() -> String? {
        weatherCondition
    }*/

}
