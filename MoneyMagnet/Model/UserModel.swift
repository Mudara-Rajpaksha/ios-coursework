//
//  UserModel.swift
//  MoneyMagnet
//
//  Created by Mudara on 2023-09-25.
//

import Foundation

struct UserModel: Codable {
    let status: Bool
    let data: UserData?
    let message: String?
}

struct UserData: Codable {
    let userID, username, email, password: String
    let id: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case username, email, password
        case id = "_id"
        case v = "__v"
    }
}
