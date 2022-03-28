//
//  TemplateRepresentable.swift
//  
//
//  Created by Rutherford, Chad on 3/28/22.
//

import Vapor
import SwiftSgml

public protocol TemplateRepresentable {
    @TagBuilder
    func render(_ req: Request) -> Tag
}
