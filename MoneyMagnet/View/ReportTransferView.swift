//
//  ReportTransferView.swift
//  MoneyMagnet
//
//  Created by CodeLabs on 2023-09-30.
//

import SwiftUI
import PopupView

struct ReportTransferView: View {
    @State var desc: String = ""
    @State var amount: String = ""
    @State var showCategories: Bool = false
    @Binding var reportType: Bool
    @ObservedObject var reportCatrgoryVM = ReportCategoryViewModel()
    @State var isPickerPresented: Bool = false
    @State private var selectedImage: UIImage? = nil
    
    var body: some View {
        VStack(alignment: .leading){
            Spacer()
            VStack(alignment: .leading){
                Text("How much?")
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
                HStack(content: {
                    Text("$")
                        .font(.system(size: 60, weight: .bold))
                        .foregroundColor(.white)
                    TextField("00", text: $amount)
                        .font(.system(size: 60, weight: .bold))
                        .foregroundColor(.white)
                        .keyboardType(.numberPad)
                })
            }
            .padding(.horizontal, 25)
            Spacer()
            VStack(alignment: .leading, spacing: 15){
                HStack{
                    Text(reportType ? reportCatrgoryVM.expenseCategories[reportCatrgoryVM.selectedIndex] : reportCatrgoryVM.incomeCategories[reportCatrgoryVM.selectedIndex])
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding(.vertical)
                .padding(.horizontal, 20)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.gray, lineWidth: 1)
                )
                .background(.white)
                .onTapGesture {
                    self.showCategories.toggle()
                }
                HStack{
                    TextField("Description", text: $desc)
                    Spacer()
                }
                .padding(.vertical)
                .padding(.horizontal, 20)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.gray, lineWidth: 1)
                )
                if selectedImage != nil {
                    Image(uiImage: selectedImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                        .overlay(
                            Button(action: {
                                selectedImage = nil
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                                    .padding(2)
                            }
                            .background(Color.red)
                            .clipShape(Circle())
                            .padding(2)
                            .offset(x: 10, y: -10), alignment: .topTrailing)
                } else {
                    Button(action: {
                        self.isPickerPresented.toggle()
                    }, label: {
                        HStack{
                            Spacer()
                            Image(systemName: "paperclip")
                                .foregroundColor(.gray)
                            Text("Add Attachment")
                                .foregroundColor(.gray)
                            Spacer()
                        }
                        .padding(.vertical)
                        .padding(.horizontal, 20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .strokeBorder(.gray.opacity(0.3), style: StrokeStyle(lineWidth: 1, dash: [10]))
                        )
                    })
                }
                Button(action: {
                }, label: {
                    Spacer()
                    Text("Submit")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color.white)
                    Spacer()
                })
                .padding(.all)
                .background(reportType ? .red : .green)
                .cornerRadius(10)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 50)
            .background(.white)
            .cornerRadius(topLeft: 25, topRight: 25, bottomLeft: 25, bottomRight: 25)
            .padding(.horizontal,10)
        }
        .background(reportType ? .red : .green)
        .navigationTitle(reportType ? "Expence" : "Income")
        .sheet(isPresented: $isPickerPresented) {
            ImagePickerUtils(selectedImage: $selectedImage)
        }
        NavigationLink(destination:
                        ReportCategoryView(reportType: $reportType)
                            .environmentObject(reportCatrgoryVM)
                            .navigationBarTitle(reportType ? "Expense Categories" : "Income Categories", displayMode: .inline), isActive: $showCategories) {}
    }
}

#Preview {
    ReportTransferView(desc: "", reportType: .constant(true))
}
