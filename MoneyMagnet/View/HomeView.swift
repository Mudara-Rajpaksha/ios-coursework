//
//  HomeView.swift
//  MoneyMagnet
//
//  Created by Mudara on 2023-09-25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var homeVM: HomeViewModel
    var body: some View {
        VStack(spacing: 10){
            VStack{
                HStack{
                    ZStack(alignment: .center) {
                        Image("ic_profile")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color("SecondaryColor"), lineWidth: 2)
                            )
                    }
                    Spacer(minLength: 0)
                    Button(action: {
                        withAnimation{
//                            homeVM.showReportSelect.toggle()
                        }
                    }, label: {
                        HStack{
                            Image(systemName: "chevron.down")
                                .foregroundColor(.black)
                            Text("Month")
                                .foregroundColor(.black)
                        }
                    })
                    Spacer(minLength: 0)
                    Button(action: {
                        withAnimation{
                            homeVM.showReportSelect.toggle()
                        }
                    }, label: {
                        Image("ic_add")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35, height: 35)
                    })
                }
                VStack{
                    Text("Account Balance")
                        .foregroundColor(.gray)
                    Text("$94000")
                        .font(.system(size: 48, weight: .semibold))
                }
                HStack{
                    HStack(alignment: .center){
                        Image("ic_income")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding(.trailing, 5)
                        VStack(spacing: 5){
                            Text("Income")
                                .foregroundColor(.white)
                                .foregroundColor(.gray)
                            Text("$10000")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                        }
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 20)
                    .background(.green)
                    .cornerRadius(10)
                    Spacer(minLength: 0)
                    HStack(alignment: .center){
                        Image("ic_expense")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding(.trailing, 5)
                        VStack(spacing: 5){
                            Text("Expense")
                                .foregroundColor(.white)
                                .foregroundColor(.gray)
                            Text("$47000")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                        }
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 20)
                    .background(.red)
                    .cornerRadius(10)
                }
            }
            .padding(.bottom, 10)
            .padding(.horizontal, 25)
            VStack(alignment: .leading){
                HStack{
                    ForEach(0..<homeVM.filterTypes.count, id: \.self){ index in
                        HStack{
                            Text(homeVM.filterTypes[index])
                                .foregroundColor(Color("SecondaryColor"))
                                .padding(.vertical, 8)
                                .padding(.horizontal, 20)
                                .background(
                                    Capsule()
                                        .fill(homeVM.filterTime == index ? Color("SecondaryColor").opacity(0.5) : .clear).opacity(0.2)
                                )
                                .onTapGesture(){
                                    withAnimation {
                                        homeVM.filterTime = index
                                    }
                                }
                            if (homeVM.filterTypes.count - 1 != index) {
                                Spacer(minLength: 0)
                            }
                        }
                    }
                }
                .background(
                    Capsule()
                        .fill(Color("SecondaryColor").opacity(0.3)).opacity(0.2)
                )
                Text("Recent Transactions")
                    .font(.system(size: 18, weight: .bold))
                    .padding(.top)
                VStack{
                    HStack{
                        Image("ic_cart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35)
                            .padding(10)
                            .background(.yellow.opacity(0.3))
                            .cornerRadius(10)
                        VStack(spacing: 8){
                            HStack{
                                Text("Shopping")
                                    .font(.system(size: 18, weight: .semibold))
                                Spacer()
                                Text("- $120")
                                    .foregroundColor(.red)
                                    .font(.system(size: 18, weight: .semibold))
                            }
                            HStack{
                                Text("Buy some groceras")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                                    .lineLimit(1)
                                    .truncationMode(.tail)
                                Spacer()
                                Text("01-08-2023")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 11))
                            }
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background(.gray.opacity(0.1))
                    .cornerRadius(10)
                    HStack{
                        Image("ic_salary")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35)
                            .padding(10)
                            .background(.green.opacity(0.3))
                            .cornerRadius(10)
                        VStack(spacing: 8){
                            HStack{
                                Text("Salary")
                                    .font(.system(size: 18, weight: .semibold))
                                Spacer()
                                Text("+ $560")
                                    .foregroundColor(.green)
                                    .font(.system(size: 18, weight: .semibold))
                            }
                            HStack{
                                Text("Salary of August")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                                    .lineLimit(1)
                                    .truncationMode(.tail)
                                Spacer()
                                Text("01-08-2023")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 11))
                            }
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background(.gray.opacity(0.1))
                    .cornerRadius(10)
                }
                Spacer()
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 25)
            .background(.white)
            .cornerRadius(topLeft: 20, topRight: 20, bottomLeft: 0, bottomRight: 0)
            .edgesIgnoringSafeArea(.bottom)
        }
        .background(Color(.yellow).opacity(0.2))
        NavigationLink(destination: ReportTransferView(desc: "", reportType: $homeVM.reportType)
            .navigationBarTitle("", displayMode: .inline), isActive: $homeVM.jumpToReport) {}
    }
}
