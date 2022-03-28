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

    // register routes
    app.routes.get("hello") { req -> Response in
        req.templates.renderHtml(MyTemplate(title: "Hello, Vapor4 - from PSSS!"))
    }
    
    try routes(app)
}
