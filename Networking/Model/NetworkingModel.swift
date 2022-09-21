//
//  Model.swift
//  Networking
//
//  Created by ek-mac-02 on 20/09/2022.
//

import Foundation
//MARK: News
struct News: Codable{
    var articles: [Article]
}
// MARK: Source
struct Source: Codable {
    var id: String?
    var name: String
}
// MARK: Article
struct Article: Codable {
    var source: Source?
    var author: String
    var title: String
    var description: String
    var publishedAt: String
    var content: String

    enum CodingKeys: String, CodingKey {
       
        case source
        case author
        case title
        case description
        case publishedAt
        case content
    
    }
    
    init(from decoder: Decoder) throws {
        let container  =  try decoder.container(keyedBy: CodingKeys.self)
        source = try container.decodeIfPresent(Source.self, forKey: .source) ?? nil
        author = try container.decodeIfPresent(String.self, forKey: .author) ?? ""
        title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        publishedAt = try container.decodeIfPresent(String.self, forKey: .publishedAt) ?? ""
        content = try container.decodeIfPresent(String.self, forKey: .content) ?? ""

}
}

