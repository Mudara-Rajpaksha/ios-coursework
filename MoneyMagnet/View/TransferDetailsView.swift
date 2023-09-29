//
//  TransferDetailsView.swift
//  MoneyMagnet
//
//  Created by CodeLabs on 2023-09-30.
//

import SwiftUI
import Kingfisher

struct TransferDetailsView: View {
    var body: some View {
        VStack {
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10) {
                Text("$120")
                    .font(.system(size: 42, weight: .bold))
                    .foregroundColor(.white)
                Text("Buy some grocery")
                    .foregroundColor(.white)
                Text("Saturday 4 June 2021 04:20")
                    .foregroundColor(.white)
                HStack {
                    VStack(alignment: .leading){
                        HStack(alignment: .center){
                            Text("Type :")
                                .foregroundColor(.gray)
                            Text("Expence")
                                .font(.system(size: 18, weight: .bold))
                        }
                        HStack(alignment: .center){
                            Text("Category :")
                                .foregroundColor(.gray)
                            Text("Shopping")
                                .font(.system(size: 18, weight: .bold))
                        }
                    }
                    Spacer()
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal)
            }
            .padding(.vertical)
            .background(.red)
            .cornerRadius(20)
            .padding([.top, .horizontal])
            Line()
              .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
              .frame(height: 1)
              .padding()
            VStack(spacing: 10, content: {
                VStack {
                    HStack {
                        Text("Description")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding(.horizontal, 10)
                    Text("Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.")
                        .padding(.top, 5)
                }
                VStack {
                    HStack {
                        Text("Attachment")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding(.horizontal, 10)
                    KFImage(URL(string: "https://picsum.photos/300"))
                        .resizable()
                        .placeholder {
                            ProgressView()
                                .frame(width: UIScreen.main.bounds.width - 20, height: 200)
                        }
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width - 20, height: 200)
                        .cornerRadius(10)
                        .clipped()
                }
                .padding(.top)
            })
            Spacer()
        }
        .navigationBarTitle("Expence Transaction", displayMode: .inline)
    }
}

#Preview {
    TransferDetailsView()
}


struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

