//
//  AbstractFormField.swift
//  
//
//  Created by Rutherford, Chad on 4/3/22.
//

import Vapor

open class AbstractFormField<Input: Decodable, Output: TemplateRepresentable> {
    public var key: String
    public var input: Input
    public var output: Output
    public var error: String?
    
    public init(key: String, input: Input, output: Output, error: String? = nil) {
        self.key = key
        self.input = input
        self.output = output
        self.error = error
    }
    
    open func config(_ block: (AbstractFormField<Input, Output>) -> Void) -> Self {
        block(self)
        return self
    }
}
