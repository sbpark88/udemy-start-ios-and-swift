import Foundation

struct WeatherManager {

    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=3f413e250242a4ca401bf02c302006cc&lang=kr&units=metric"

    func fetchWeather(cityName: String) {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        print(urlString)
    }

    func performRequest(urlString: String) {
        // 1. Create a URL
        guard let url = URL(string: urlString) else { return }

        // 2. Create a URLSession
        let session = URLSession(configuration: .default)

        // 3. Give the session a task
        let task: URLSessionDataTask = session.dataTask(with: urlString, completionHandler: <#T##@escaping (Data?, URLResponse?, Error?) -> Void##@escaping (Foundation.Data?, Foundation.URLResponse?, Swift.Error?) -> Swift.Void#>)

        // 4. Start the task
        task.resume()

        func handle(data: Data?, response: URLResponse?, error: Error?) {

        }

    }
}
