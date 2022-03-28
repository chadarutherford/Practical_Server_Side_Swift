//
//  Request+Templates.swift
//  
//
//  Created by Rutherford, Chad on 3/28/22.
//

import Vapor

public extension Request {
    var templates: TemplateRenderer { .init(self) }
}
