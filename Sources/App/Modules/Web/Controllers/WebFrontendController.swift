//
//  WebFrontendController.swift
//  
//
//  Created by Rutherford, Chad on 3/29/22.
//

import Vapor

struct WebFrontendController {
    func homeView(req: Request) throws -> Response {
        req.templates.renderHtml(WebHomeTemplate(.init(title: "Home", message: "Hi there, welcome to my page!")))
    }
}
