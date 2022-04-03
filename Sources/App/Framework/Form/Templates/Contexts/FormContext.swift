//
//  FormContext.swift
//  
//
//  Created by Rutherford, Chad on 4/3/22.
//

import Foundation

public struct FormContext {
    public var action: FormAction
    public var fields: [TemplateRepresentable]
    public var error: String?
    public var submit: String?
}
