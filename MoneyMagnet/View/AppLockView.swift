//
//  AppLockView.swift
//  MoneyMagnet
//
//  Created by Mudara on 2023-09-24.
//

import Foundation
import SwiftUI

struct LockScreenView: View {
    @Binding var isSetPassword: Bool
    @ObservedObject var appLockVM: AppLockViewModel
    
    init(isSetPassword: Bool) {
        _isSetPassword = Binding.constant(isSetPassword)
        appLockVM = AppLockViewModel(isSetPassword: isSetPassword)
    }
    
    var body: some View {
        NavigationStack{
            VStack {
                Text(appLockVM.pinTitle)
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 24, weight: .regular))
                    .foregroundColor(Color.white)
                Spacer(minLength: 0)
                HStack(spacing: 20) {
                    ForEach(0..<4) { index in
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(index < appLockVM.enteredPIN.count ? Color("SecondaryColor") : .gray)
                    }
                }
                .offset(x: appLockVM.error ? 30 : 0)
                Spacer(minLength: 0)
                CustomKeyboardView(enteredPIN:  $appLockVM.enteredPIN, appLocaVM: appLockVM)
            }
            .padding(.vertical, 20)
            .background(Color("ThemeColor"))
            NavigationLink(destination: MainTabView().navigationBarBackButtonHidden(true), isActive: $appLockVM.jumpToMain) {}
        }
    }
}

struct CustomKeyboardView: View {
    @Binding var enteredPIN: String
    @ObservedObject var appLocaVM: AppLockViewModel

    let rows = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        ["", "0", "⌫"]
    ]
    var body: some View {
        VStack(spacing: 15) {
            ForEach(rows, id: \.self) { row in
                HStack(spacing: 30) {
                    ForEach(row, id: \.self) { digit in
                        Button(action: {
                            if digit == "⌫" {
                                if !enteredPIN.isEmpty {
                                    enteredPIN.removeLast()
                                }
                            } else if enteredPIN.count < 4 {
                                enteredPIN += digit
                                if enteredPIN.count == 4 {
                                    appLocaVM.verifyPIN()
                                }
                            }
                        }) {
                            Text(digit)
                                .font(.largeTitle)
                                .frame(width: digit == "⌫" ? 80 : 80, height: 80)
                                .background(digit == "" ? Color.clear : Color("SecondaryColor"))
                                .foregroundColor(.white)
                                .cornerRadius(40)
                                .disabled(digit == "")
                        }
                    }
                }
            }
        }
    }
}

struct LockScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LockScreenView(isSetPassword: true)
    }
}
