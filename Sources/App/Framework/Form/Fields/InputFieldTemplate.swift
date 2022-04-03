//
//  InputFieldTemplate.swift
//  
//
//  Created by Rutherford, Chad on 4/1/22.
//

import SwiftHtml
import Vapor

public struct InputFieldTemplate: TemplateRepresentable {
    public var context: InputFieldContext
    
    public init(_ context: InputFieldContext) {
        self.context = context
    }
    
    @TagBuilder
    public func render(_ req: Request) -> Tag {
        LabelTemplate(context.label).render(req)
        
        Input()
            .type(context.type)
            .key(context.key)
            .placeholder(context.placeholder)
            .value(context.value)
            .class("field")
        
        if let error = context.error {
            Span(error)
                .class("error")
        }
    }
}
