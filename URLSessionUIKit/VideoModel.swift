//
//  VideoModel.swift
//  URLSessionSwiftUI
//
//  Created by Tomato on 2021/09/16.
//

import Foundation

struct VideoModel: Decodable {
	let videos: [Video]
}

struct Video: Decodable {
	let id: Int
	let name: String
	let thumbnail: String
	let description: String
	let video_link: String
}
