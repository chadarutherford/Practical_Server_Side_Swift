//
//  WebLinkContext.swift
//  
//
//  Created by Rutherford, Chad on 3/29/22.
//

import Foundation

public struct WebLinkContext {
    public let label: String
    public let url: String
    
    public init(label: String, url: String) {
        self.label = label
        self.url = url
    }
}
