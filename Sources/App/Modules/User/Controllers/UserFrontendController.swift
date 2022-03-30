//
//  UserFrontendController.swift
//  
//
//  Created by Rutherford, Chad on 3/30/22.
//

import Vapor

struct UserFrontendController {
    func signInView(_ req: Request) async throws -> Response {
        let template = UserLoginTemplate(.init(
            icon: "⬇️",
            title: "Sign In",
            message: "Please log in with your existing account"))
        return req.templates.renderHtml(template)
    }
    
    func signInAction(_ req: Request) async throws -> Response {
        // @TODO: - handle sign in action
        return try await signInView(req)
    }
}
