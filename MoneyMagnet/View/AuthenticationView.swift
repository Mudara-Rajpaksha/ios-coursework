//
//  AuthenticationView.swift
//  MoneyMagnet
//
//  Created by Mudara on 2023-09-24.
//

import SwiftUI
import CustomTextField
import PopupView

struct AuthenticationView: View {
    @ObservedObject var authVM = AuthenticationViewModel()
    var body: some View {
        NavigationStack{
            if authVM.isToggledLog {
                VStack(spacing: 25, content: {
                    EGTextField(text: $authVM.logEmail)
                        .setPlaceHolderText("Username")
                        .setTextFieldHeight(55)
                    EGTextField(text: $authVM.logPassword)
                        .setPlaceHolderText("Password")
                        .setSecureText(true)
                        .setTextFieldHeight(55)
                    Button(action: {
                        UserDefaultsManager.shared.setBool(true, forKey: UserDefaultsManager.IS_LOGGEDIN)
                    }, label: {
                        Spacer()
                        Text("Login")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(Color.white)
                        Spacer()
                    })
                    .padding(.all)
                    .background(Color("ThemeColor"))
                    .cornerRadius(10)
                    HStack(spacing: 5){
                        Spacer()
                        Text("Don’t have an account yet?")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(Color.black)
                        Button(action: {
                            withAnimation{
                                authVM.isToggledLog.toggle()
                            }
                        }, label: {
                            Text("Sign Up")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Color("ThemeColor"))
                                .underline()
                        })
                        Spacer()
                    }
                    Spacer()
                })
                .padding(.top, 20)
                .padding(.horizontal, 20)
                .navigationBarTitle("Login", displayMode: .large)
            } else {
                VStack(spacing: 25, content: {
                    EGTextField(text: $authVM.regUsername)
                        .setPlaceHolderText("Username")
                        .setTextFieldHeight(55)
                    EGTextField(text: $authVM.regEmail)
                        .setPlaceHolderText("Email")
                        .setTextFieldHeight(55)
                    EGTextField(text: $authVM.regPassword)
                        .setPlaceHolderText("Password")
                        .setSecureText(true)
                        .setTextFieldHeight(55)
                    Text("By signing up, you agree to our [Terms & Conditions](https://apple.com) and [Privacy Policy.](https://apple.com)")
                        .frame(maxWidth: .infinity)
                    Button(action: {
                        authVM.createUser()
                    }, label: {
                        Spacer()
                        Text("Sign Up")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(Color.white)
                        Spacer()
                    })
                    .padding(.all)
                    .background(Color("ThemeColor"))
                    .cornerRadius(10)
                    HStack(spacing: 5){
                        Spacer()
                        Text("Already have an account?")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(Color.black)
                        Button(action: {
                            withAnimation{
                                authVM.isToggledLog.toggle()
                            }
                        }, label: {
                            Text("Login")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Color("ThemeColor"))
                                .underline()
                        })
                        Spacer()
                    }
                    Spacer()
                })
                .padding(.top, 20)
                .padding(.horizontal, 20)
                .navigationBarTitle("Sign Up", displayMode: .large)
                .popup(isPresented: $authVM.isSuccess) {
                    VStack {
                        Image("ic_success")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        Text("You are set!")
                            .font(.title2)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 30)
                    .background(.white)
                    .cornerRadius(15)
                } customize: {
                    $0
                        .position(.center)
                        .animation(.spring())
                        .backgroundColor(.black.opacity(0.5))
                        .autohideIn(2)
                        .dismissCallback {
                        }
                }
                .popup(isPresented: $authVM.isError) {
                    HStack {
                        Spacer()
                        Image("ic_warn")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .padding(.trailing, 5)
                        Text("Please check with your credentials!")
                            .font(.system(size: 18, weight: .regular))
                        Spacer()
                    }
                    .padding(.vertical, 10)
                    .background(Color("WarnYellow"))
                    .cornerRadius(15)
                    .padding(.horizontal, 25)
                } customize: {
                    $0
                        .type(.floater())
                        .position(.bottom)
                        .animation(.spring())
                        .closeOnTapOutside(true)
                        .backgroundColor(.black.opacity(0.5))
                        .autohideIn(2)
                        .dismissCallback {
                        }
                }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView(authVM: AuthenticationViewModel())
    }
}
