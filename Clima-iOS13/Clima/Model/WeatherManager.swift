import Foundation

struct WeatherManager {

    // swiftlint:disable line_length
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=3f413e250242a4ca401bf02c302006cc&lang=kr&units=metric"

    func fetchWeather(cityName: String) {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        print(urlString)
        performRequest(urlString: urlString)
    }

    func performRequest(urlString: String) {
        // 1. Create a URL
        guard let url = URL(string: urlString) else { return }

        // 2. Create a URLSession
        let session = URLSession(configuration: .default)

        // 3. Give the session a task
        // anonymous function
//        let task: URLSessionDataTask = session.dataTask(with: url, completionHandler: handle(data:response:error:))
        let task: URLSessionDataTask = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }

            guard let safeData = data else { return }
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString as Any)
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

}
