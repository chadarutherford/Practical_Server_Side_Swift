//
//  UserSessionAuthenticator.swift
//  
//
//  Created by Rutherford, Chad on 3/30/22.
//

import Fluent
import Vapor

struct UserSessionAuthenticator: AsyncSessionAuthenticator {
    typealias User = AuthenticatedUser
    
    func authenticate(sessionID: UUID, for request: Request) async throws {
        guard
            let user = try await UserAccountModel.find(sessionID, on: request.db)
        else { return }
        request.auth.login(AuthenticatedUser(id: user.id!, email: user.email))
    }
}
