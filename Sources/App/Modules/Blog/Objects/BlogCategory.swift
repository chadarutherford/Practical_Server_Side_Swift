//
//  File.swift
//  
//
//  Created by Rutherford, Chad on 3/30/22.
//

import Foundation

extension Blog {
    enum Category {
        
    }
}

extension Blog.Category {
    struct List: Codable {
        let id: UUID
        let title: String
    }
}
