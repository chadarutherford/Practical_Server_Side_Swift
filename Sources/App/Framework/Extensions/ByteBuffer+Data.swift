//
//  ByteBuffer+Data.swift
//  
//
//  Created by Rutherford, Chad on 4/3/22.
//

import Vapor

public extension ByteBuffer {
    var data: Data? { getData(at: 0, length: readableBytes) }
}
