import Vapor
import Fluent
import FluentSQLiteDriver

// configures your application
public func configure(_ app: Application) throws {
    /// Use the Public directory to serve public files
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    /// extend paths to always contain a trailing slash
    app.middleware.use(ExtendPathMiddleware())
    
    /// Sretup Fluent with SQLite Database under the Resources directory
    let dbPath = app.directory.resourcesDirectory + "db.sqlite"
    app.databases.use(.sqlite(.file(dbPath)), as: .sqlite)

    /// Setup module routes
    let routers: [RouteCollection] = [
        WebRouter(),
        BlogRouter()
    ]
    
    /// Boot Routes
    for router in routers {
        try router.boot(routes: app.routes)
    }
}
