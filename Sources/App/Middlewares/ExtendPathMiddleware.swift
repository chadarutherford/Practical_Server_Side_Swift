//
//  ExtendPathMiddleware.swift
//  
//
//  Created by Rutherford, Chad on 3/30/22.
//

import Vapor

struct ExtendPathMiddleware: AsyncMiddleware {
    func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        if !request.url.path.hasSuffix("/") && !request.url.path.contains(".") {
            return request.redirect(to: request.url.path + "/", type: .permanent)
        }
        return try await next.respond(to: request)
    }
}
