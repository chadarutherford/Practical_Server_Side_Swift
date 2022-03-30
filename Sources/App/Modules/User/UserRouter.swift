//
//  UserRouter.swift
//  
//
//  Created by Rutherford, Chad on 3/30/22.
//

import Vapor

struct UserRouter: RouteCollection {
    let frontendController = UserFrontendController()
    
    func boot(routes: RoutesBuilder) throws {
        routes.get("sign-in", use: frontendController.signInView)
        routes
            .grouped(UserCredentialsAuthenticator())
            .post("sign-in", use: frontendController.signInAction)
    }
}
