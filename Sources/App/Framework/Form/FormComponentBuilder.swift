//
//  FormComponentBuilder.swift
//  
//
//  Created by Rutherford, Chad on 4/3/22.
//

import Foundation

@resultBuilder
public enum FormComponentBuilder {
    public static func buildBlock(_ components: FormComponent...) -> [FormComponent] {
        components
    }
}
