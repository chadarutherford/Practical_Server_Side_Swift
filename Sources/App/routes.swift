import Vapor

func routes(_ app: Application) throws {
    app.get { req -> Response in
        req.templates.renderHtml(WebIndexTemplate(.init(title: "Home", message: "Hi there, welcome to my page!")))
    }
}
