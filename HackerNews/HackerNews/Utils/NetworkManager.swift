//
//  NetworkManager.swift
//  HackerNews
//
//  Created by 박새별 on 2023/03/19.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                let decoder = JSONDecoder()
                //                guard let data else { return }
                //                do {
                //                    let results = try decoder.decode(HackerNewsPost.self, from: data)
                //                    DispatchQueue.main.async {
                //                        self.posts = results.hits
                //                    }
                //                } catch {
                //                    print(error)
                //                }
                if let safeData = data {
                    do {
                        let results = try decoder.decode(HackerNewsPost.self, from: safeData)
                        DispatchQueue.main.async {
                            self.posts = results.hits
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
    
}
