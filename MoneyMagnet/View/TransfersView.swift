//
//  TransfersView.swift
//  MoneyMagnet
//
//  Created by Mudara on 2023-09-25.
//

import SwiftUI

struct TransfersView: View {
    @EnvironmentObject var transferVM: TransfersViewModel
    @State var showingCredits = true
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            HStack{
                HStack{
                    Image(systemName: "chevron.down")
                    Text("Expences")
                }
                .padding(10)
                .overlay(
                    Capsule(style: .continuous)
                        .stroke(.gray, lineWidth: 1)
                )
                Spacer()
                Button(action: {
                    withAnimation{
                        transferVM.showFilterTime.toggle()
                    }
                }, label: {
                        Image("ic_options")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35)
                            .padding(2)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.gray, lineWidth: 1)
                            )
                })
            }
            HStack{
                Text("See your financial report")
                Spacer()
                Image(systemName: "chevron.right")
            }
            .padding(15)
            .background(.yellow.opacity(0.3))
            .cornerRadius(10)
            Text("Today")
                .font(.system(size: 18, weight: .bold))
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
        .padding(.horizontal, 25)
    }
}

struct TransfersView_Previews: PreviewProvider {
    static var previews: some View {
        TransfersView()
    }
}

struct TransitionFilterView: View {
    @Binding var filter: Int
    @Binding var showFilterTime: Bool
    @State var filterTypes: [String]
    @State var selectedIndex = 0
    
    init(filter: Binding<Int>, showFilterTime: Binding<Bool>, filterTypes: [String]) {
            _filter = filter
            _showFilterTime = showFilterTime
            _filterTypes = State(initialValue: filterTypes)
            _selectedIndex = State(initialValue: filter.wrappedValue)
        }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Filter Transaction")
                    .font(.system(size: 18, weight: .semibold))
                Spacer()
                Button(action: {
                    withAnimation{
                        selectedIndex = 0
                    }
                }, label: {
                    Text("Reset")
                        .foregroundColor(.black)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(
                            Capsule()
                                .fill(Color("SecondaryColor")).opacity(0.5)
                        )
                })
            }
            Text("Filter By")
                .font(.system(size: 18, weight: .semibold))
            HStack{
                ForEach(0..<filterTypes.count, id: \.self){ index in
                    if selectedIndex == index {
                        Text(filterTypes[index])
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(
                                Capsule()
                                    .fill(Color("SecondaryColor")).opacity(0.5)
                            )
                            .onTapGesture(){
                                withAnimation {
                                    selectedIndex = index
                                }
                            }
                    } else {
                        Text(filterTypes[index])
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .overlay(
                                Capsule(style: .continuous)
                                    .stroke(.gray, lineWidth: 1)
                            )
                            .onTapGesture(){
                                withAnimation {
                                    selectedIndex = index
                                }
                            }
                    }
               }
            }
            Button(action: {
                filter = selectedIndex
                showFilterTime.toggle()
            }, label: {
                Spacer()
                Text("Apply")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(Color.white)
                Spacer()
            })
            .padding(.all)
            .background(Color("ThemeColor"))
            .cornerRadius(10)
            .padding(.top)
        }
        .padding([.horizontal, .bottom], 25)
        .padding(.top, 10)
    }
}
