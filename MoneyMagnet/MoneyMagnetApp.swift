//
//  MoneyMagnetApp.swift
//  MoneyMagnet
//
//  Created by Mudara on 2023-09-23.
//

import SwiftUI

@main
struct MoneyMagnetApp: App {
    var body: some Scene {
        WindowGroup {
            if UserDefaultsManager.shared.getBool(forKey: UserDefaultsManager.IS_LOGGEDIN) {
                LockScreenView(isSetPassword: false)
            } else {
                if UserDefaultsManager.shared.getBool(forKey: UserDefaultsManager.IS_DONE_ONBOARD) {
                    AuthenticationView()
                } else {
                    OnboardingView()
                }
            }
        }
    }
}
