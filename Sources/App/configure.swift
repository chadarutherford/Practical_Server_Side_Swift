import Vapor
import Fluent
import FluentSQLiteDriver

// configures your application
public func configure(_ app: Application) throws {
    /// Use the Public directory to serve public files
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    /// extend paths to always contain a trailing slash
    app.middleware.use(ExtendPathMiddleware())
    
    /// Setup Sessions
    app.sessions.use(.fluent)
    app.migrations.add(SessionRecord.migration)
    app.middleware.use(app.sessions.middleware)
    
    /// Sretup Fluent with SQLite Database under the Resources directory
    let dbPath = app.directory.resourcesDirectory + "db.sqlite"
    app.databases.use(.sqlite(.file(dbPath)), as: .sqlite)

    /// Setup modules
    let modules: [ModuleInterface] = [
        WebModule(),
        UserModule(),
        BlogModule()
    ]
    
    /// Boot Routes
    for module in modules {
        try module.boot(app)
    }
    
    /// Use automatic database migration
    try app.autoMigrate().wait()
}
