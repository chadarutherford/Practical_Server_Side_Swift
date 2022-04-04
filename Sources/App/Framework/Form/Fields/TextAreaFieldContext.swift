//
//  TextAreaFieldContext.swift
//  
//
//  Created by Rutherford, Chad on 4/3/22.
//

import Foundation

public struct TextAreaFieldContext {
    public let key: String
    public var label: LabelContext
    public var placeholder: String?
    public var value: String?
    public var error: String?
    
    public init(key: String, label: LabelContext? = nil ,placeholder: String? = nil, value: String? = nil, error: String? = nil) {
        self.key = key
        self.label = label ?? .init(key: key)
        self.placeholder = placeholder
        self.value = value
        self.error = error
    }
}
