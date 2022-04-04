//
//  HiddenFieldTemplate.swift
//  
//
//  Created by Rutherford, Chad on 4/3/22.
//

import SwiftHtml
import Vapor

public struct HiddenFieldTemplate: TemplateRepresentable {
    var context: HiddenFieldContext
    
    public init(_ context: HiddenFieldContext) {
        self.context = context
    }
    
    @TagBuilder
    public func render(_ req: Request) -> Tag {
        Input()
            .type(.hidden)
            .name(context.key)
            .value(context.value)
    }
}
