//
//  FlickrResponse.swift
//  FlickrImageSearch
//
//  Created by Sandeep Mekala on 6/26/24.
//

import Foundation

struct FlickrResponse: Codable {
    let items: [FlickrImage]
}

struct FlickrImage: Codable, Identifiable {
    let id = UUID()
    let title: String
    let link: String
    let media: Media
    let date_taken: String
    let description: String
    let published: String
    let author: String
    let author_id: String
    let tags: String

    struct Media: Codable {
        let m: String
    }
}
