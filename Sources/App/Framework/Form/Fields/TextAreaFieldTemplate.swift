//
//  TextAreaFieldTemplate.swift
//  
//
//  Created by Rutherford, Chad on 4/3/22.
//

import SwiftHtml
import Vapor

public struct TextAreaFieldTemplate: TemplateRepresentable {
    public var context: TextAreaFieldContext
    
    public init(_ context: TextAreaFieldContext) {
        self.context = context
    }
    
    @TagBuilder
    public func render(_ req: Request) -> Tag {
        LabelTemplate(context.label).render(req)
        
        Textarea(context.value)
            .placeholder(context.placeholder)
            .name(context.key)
        
        if let error = context.error {
            Span(error)
                .class("error")
        }
    }
}
