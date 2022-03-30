//
//  BlogRouter.swift
//  
//
//  Created by Rutherford, Chad on 3/30/22.
//

import Vapor

struct BlogRouter: RouteCollection {
    let controller = BlogFrontendController()
    
    func boot(routes: RoutesBuilder) throws {
        routes.get("blog", use: controller.blogView)
    }
}
