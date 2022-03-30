//
//  UserMigrations.swift
//  
//
//  Created by Rutherford, Chad on 3/30/22.
//

import Fluent
import Vapor

enum UserMigrations {
    struct v1: AsyncMigration {
        func prepare(on database: Database) async throws {
            try await database.schema(UserAccountModel.schema)
                .id()
                .field(UserAccountModel.FieldKeys.v1.email, .string, .required)
                .field(UserAccountModel.FieldKeys.v1.password, .string, .required)
                .unique(on: UserAccountModel.FieldKeys.v1.email)
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(UserAccountModel.schema).delete()
        }
    }
    
    struct seed: AsyncMigration {
        func prepare(on database: Database) async throws {
            let email = "root@localhost.com"
            let password = "Sw!ftD3v$!982"
            let user = UserAccountModel(email: email, password: try Bcrypt.hash(password))
            try await user.create(on: database)
        }
        
        func revert(on database: Database) async throws {
            try await UserAccountModel.query(on: database).delete()
        }
    }
}
