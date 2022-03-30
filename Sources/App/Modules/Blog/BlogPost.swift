//
//  File.swift
//  
//
//  Created by Rutherford, Chad on 3/30/22.
//

import Foundation

struct BlogPost: Codable {
    let title: String
    let slug: String
    let image: String
    let excerpt: String
    let date: Date
    let category: String?
    let content: String
}
