//
//  FormFieldValidator+Validations.swift
//  
//
//  Created by Rutherford, Chad on 4/3/22.
//

import Vapor

public extension FormFieldValidator where Input == String {
    static func required(_ field: AbstractFormField<Input, Output>, _ message: String? = nil) -> FormFieldValidator<Input, Output> {
        .init(field, message ?? "\(field.key.capitalized) is required") { _, field in !field.input.isEmpty }
    }
    
    static func min(_ field: AbstractFormField<Input, Output>, length: Int, message: String? = nil) -> FormFieldValidator<Input, Output> {
        let msg = message ?? "\(field.key.capitalized) is too short (min: \(length) characters)"
        return .init(field, msg) { _, field in field.input.count >= length }
    }
    
    static func max(_ field: AbstractFormField<Input, Output>, length: Int, message: String? = nil) -> FormFieldValidator<Input, Output> {
        let msg = message ?? "\(field.key.capitalized) is too short (min: \(length) characters)"
        return .init(field, msg) { _, field in field.input.count <= length }
    }
    
    static func alphanumberic(_ field: AbstractFormField<Input, Output>, message: String? = nil) -> FormFieldValidator<Input, Output> {
        let msg = message ?? "\(field.key.capitalized) should only be alphanumeric characters"
        return .init(field, msg) { _, field in !Validator.characterSet(.alphanumerics).validate(field.input).isFailure }
    }
    
    static func email(_ field: AbstractFormField<Input, Output>, message: String? = nil) -> FormFieldValidator<Input, Output> {
        let msg = message ?? "\(field.key.capitalized) should be a valid email address"
        return .init(field, msg) { _, field in !Validator.email.validate(field.input).isFailure }
    }
}
