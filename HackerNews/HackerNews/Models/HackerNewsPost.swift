//
//  HackerNewsPost.swift
//  HackerNews
//
//  Created by 박새별 on 2023/03/19.
//

import Foundation

struct HackerNewsPost: Decodable {
    let hits: [Post]
}

// 1. Computed
struct Post: Decodable, Identifiable {

    let objectID: String
    var id: String { objectID }
    let points: Int
    let title: String
    let url: String?

}

// 2. CodingKey
//struct Post: Decodable, Identifiable {
//
//    let id: String
//    let points: Int
//    let title: String
//    let url: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id = "objectID"
//        case points
//        case title
//        case url
//    }
//
//}
