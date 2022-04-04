//
//  File+ByteBuffer.swift
//  
//
//  Created by Rutherford, Chad on 4/3/22.
//

import Vapor

public extension File {
    var byteBuffer: ByteBuffer { data }
}
