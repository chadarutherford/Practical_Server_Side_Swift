//
//  UserFrontendController.swift
//  
//
//  Created by Rutherford, Chad on 3/30/22.
//

import Vapor

struct UserFrontendController {
    
    private struct Input: Decodable {
        let email: String?
        let password: String?
    }
    
    private func renderSignInView(_ req: Request, _ input: Input? = nil, _ error: String? = nil) -> Response {
        let template = UserLoginTemplate(.init(
            icon: "⬇️",
            title: "Sign In",
            message: "Please log in with your existing account",
            email: input?.email,
            password: input?.password,
            error: error
        ))
        return req.templates.renderHtml(template)
    }
    
    func signInView(_ req: Request) async throws -> Response {
        renderSignInView(req)
    }
    
    func signInAction(_ req: Request) async throws -> Response {
        /// The user is authenticated, we can store the user data inside the session too
        if let user = req.auth.get(AuthenticatedUser.self) {
            req.session.authenticate(user)
            return req.redirect(to: "/")
        }
        
        /// If the user credentials were wrong we render the form again with an error message
        let input = try req.content.decode(Input.self)
        return renderSignInView(req, input, "Invalid email or password.")
    }
    
    func signOut(req: Request) throws -> Response {
        req.auth.logout(AuthenticatedUser.self)
        req.session.unauthenticate(AuthenticatedUser.self)
        return req.redirect(to: "/")
    }
}
