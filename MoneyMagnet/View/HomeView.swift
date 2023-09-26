//
//  HomeView.swift
//  MoneyMagnet
//
//  Created by Mudara on 2023-09-25.
//

import SwiftUI

struct HomeView: View {
    @State var jumpToMain: Bool = false
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
                Text("HomeView").onTapGesture {
                    self.jumpToMain.toggle()
                }
                Spacer()
            }
            Spacer()
            NavigationLink(destination: TransfersView()
                .navigationBarTitle("TransfersView", displayMode: .inline), isActive: $jumpToMain) {}
        }
        .background(.green)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
