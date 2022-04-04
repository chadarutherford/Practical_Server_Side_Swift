//
//  AsyncValidatorBuilder.swift
//  
//
//  Created by Rutherford, Chad on 4/3/22.
//

import Foundation

@resultBuilder
public enum AsyncValidatorBuilder {
    public static func buildBlock(_ components: AsyncValidator...) -> [AsyncValidator] {
        components
    }
}
