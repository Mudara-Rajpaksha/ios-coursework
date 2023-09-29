//
//  ReportCategoryView.swift
//  MoneyMagnet
//
//  Created by CodeLabs on 2023-09-30.
//

import SwiftUI

struct ReportCategoryView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var reportType: Bool
    @EnvironmentObject var reportCatrgoryVM: ReportCategoryViewModel
    
    var body: some View {
        VStack{
            if reportType {
                ForEach(0..<reportCatrgoryVM.expenseCategories.count, id: \.self){ index in
                    HStack{
                        Text(reportCatrgoryVM.expenseCategories[index])
                            .padding(.vertical, 10)
                        Spacer()
                        if reportCatrgoryVM.selectedIndex == index {
                            Image("ic_selected")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                    }
                    .background(.white)
                    .onTapGesture {
                        reportCatrgoryVM.selectedIndex = index
                        presentationMode.wrappedValue.dismiss()
                    }
                    Divider()
                }
            } else {
                ForEach(0..<reportCatrgoryVM.incomeCategories.count, id: \.self){ index in
                    HStack{
                        Text(reportCatrgoryVM.incomeCategories[index])
                            .padding(.vertical, 10)
                        Spacer()
                        if reportCatrgoryVM.selectedIndex == index {
                            Image("ic_selected")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                    }
                    .background(.white)
                    .onTapGesture {
                        reportCatrgoryVM.selectedIndex = index
                        presentationMode.wrappedValue.dismiss()
                    }
                    Divider()
                }
            }
            Spacer()
        }
        .padding(.horizontal, 25)
    }
}

#Preview {
    ReportCategoryView(reportType: .constant(false))
}
