//
//  UserCredentialsAuthenticator.swift
//  
//
//  Created by Rutherford, Chad on 3/30/22.
//

import Fluent
import Vapor

struct UserCredentialsAuthenticator: AsyncCredentialsAuthenticator {
    struct Credentials: Content {
        let email: String
        let password: String
    }
    
    func authenticate(credentials: Credentials, for request: Request) async throws {
        guard
            let user = try await UserAccountModel
                .query(on: request.db)
                .filter(\.$email == credentials.email)
                .first()
        else { return }
        
        do {
            guard
                try Bcrypt.verify(credentials.password, created: user.password)
            else { return }
            
            request.auth.login(AuthenticatedUser(id: user.id!, email: user.email))
        } catch {
            /// Do NOTHING.......
        }
    }
}
