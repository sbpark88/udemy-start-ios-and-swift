import Foundation

struct WeatherModel {

    // Stored property
    let conditionId: Int
    let cityName: String
    let temperature: Double

    // # Computed property
    // 1. It must be with 'var'.
    // 2. It must be provided 'data type'.
    var conditionName: String {
        switch conditionId {
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

    var temperatureString: String {
        String(format: "%.2f", temperature)
    }

}
