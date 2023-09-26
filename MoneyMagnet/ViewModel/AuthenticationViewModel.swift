//
//  AuthenticationViewModel.swift
//  MoneyMagnet
//
//  Created by Mudara on 2023-09-24.
//

import Foundation
import Combine
import SwiftUI

class AuthenticationViewModel: ObservableObject {
    
    @Published var isToggledLog: Bool = false
    @Published var isSuccess: Bool = false
    @Published var regUsername: String = ""
    @Published var regEmail: String = ""
    @Published var regPassword: String = ""
    @Published var logEmail: String = ""
    @Published var logPassword: String = ""
    @Published var isError: Bool = false
    var cancellables = Set<AnyCancellable>()
    
    func validateReg() -> Bool {
        if self.regUsername.isEmpty ?? true {
            return false
        }
        
        if self.regEmail.isEmpty ?? true {
            return false
        }
        
        if self.regPassword.isEmpty ?? true {
            return false
        }
        
        let emailRegex = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        if !emailPredicate.evaluate(with: self.regEmail) {
            return false
        }
        
        return true
    }
    
    func createUser() {
        if validateReg() {
            let bodyParams = [
                "username": regUsername,
                "email": regEmail,
                "password": regPassword
            ]
            NetworkManager.shared.request("user/register", method: .POST, body: bodyParams, response: UserModel.self)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print("Error: \(error)")
                    }
                }, receiveValue: { response in
                    print(response.status)
                    print(response.data?.username ?? "")
                })
                .store(in: &cancellables)
        } else {
            self.isError = true
        }
    }
}
