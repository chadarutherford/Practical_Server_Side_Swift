//
//  AbstractForm.swift
//  
//
//  Created by Rutherford, Chad on 4/3/22.
//

import Vapor

open class AbstractForm {
    open var action: FormAction
    open var fields: [Any]
    open var error: String?
    open var submit: String?
    
    public init(action: FormAction = .init(), fields: [Any] = [], error: String? = nil, submit: String? = nil) {
        self.action = action
        self.fields = fields
        self.error = error
        self.submit = submit
    }
}
