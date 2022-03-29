//
//  WebRouter.swift
//  
//
//  Created by Rutherford, Chad on 3/29/22.
//

import Vapor

struct WebRouter: RouteCollection {
    let frontendController = WebFrontendController()
    
    func boot(routes: RoutesBuilder) throws {
        routes.get(use: frontendController.homeView)
    }
}
