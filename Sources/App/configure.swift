import Vapor
import SwiftHtml

struct MyTemplate: TemplateRepresentable {
    let title: String
    
    func render(_ req: Request) -> Tag {
        Html {
            Head {
                Title(title)
            }
            Body {
                H1(title)
            }
        }
    }
}

// configures your application
public func configure(_ app: Application) throws {
    // Use the Public directory to serve public files
     app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
//    /// extend paths to always contain a trailing slash
//    app.middleware.use(ExtendPathMiddleware())

    // Setup module routes
    let routers: [RouteCollection] = [
        WebRouter(),
        BlogRouter()
    ]
    
    for router in routers {
        try router.boot(routes: app.routes)
    }
}
