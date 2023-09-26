//
//  MainTabView.swift
//  MoneyMagnet
//
//  Created by Mudara on 2023-09-25.
//

import SwiftUI
import PopupView

struct MainTabView: View {
    @State var selectedTab = "ic_home"
    @State var selectedImage = ""
    @State var showingCredits = false
    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .bottom, content: {
                switch selectedTab {
                case "ic_user":
                    ProfileView()
    //                    .environmentObject(PagesVM)
                        .ignoresSafeArea(.container, edges: .bottom)
                        .statusBar(hidden: false)
                case "ic_wallet":
                    TransfersView()
    //                    .environmentObject(PagesVM)
                        .ignoresSafeArea(.container, edges: .bottom)
                        .statusBar(hidden: false)
                default:
                    HomeView()
    //                    .environmentObject(AdvertisementsVM)
    //                    .environmentObject(CategoriesVM)
    //                    .environmentObject(PagesVM)
                        .ignoresSafeArea()
                        .statusBar(hidden: true)
                }
                CustomTabBar(selectedTab: $selectedTab, selectedImage: $selectedImage)
                    .shadow(color: .gray.opacity(0.2), radius: 2, x: 2, y: 2)
                    .shadow(color: .gray.opacity(0.2), radius: 2, x: -2, y: -2)
                    .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : 0)
            })
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .popup(isPresented: $showingCredits) {
                HStack{
                    Spacer()
                    Text("This app was brought to you by Hacking with Swift")
                    Spacer()
                }
                .frame(minHeight: 150)
                .background(.red)
            } customize: {
                $0
                    .type(.default)
                    .position(.bottom)
                    .animation(.spring())
                    .closeOnTapOutside(true)
                    .backgroundColor(.black.opacity(0.5))
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}


struct CustomTabBar: View {
    @Binding var selectedTab: String
    @Binding var selectedImage: String
    @State var tabPoints: [CGFloat] = []
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            TabBarButton(image: "ic_home", selectedTab: $selectedTab, selectedImage: $selectedImage, tabPoints: $tabPoints)
            TabBarButton(image: "ic_wallet", selectedTab: $selectedTab, selectedImage: $selectedImage, tabPoints: $tabPoints)
            TabBarButton(image: "ic_user", selectedTab: $selectedTab, selectedImage: $selectedImage, tabPoints: $tabPoints)
        }
        .padding()
        .background(.gray)
        .clipShape(CustomShape(tabPoint: getCurvepoints() - 17))
        .overlay(
            Circle()
                .fill(Color("ThemeColor").opacity(0.5))
                .frame(width: 10, height: 10)
                .offset(x: getCurvepoints() - 22)
            ,alignment:  .bottomLeading
        )
        .cornerRadius(20)
        .padding(.horizontal)
    }
    
    func getCurvepoints()->CGFloat {
        if tabPoints.isEmpty {
            return 10
        } else {
            switch selectedTab {
            case "ic_home":
                return tabPoints[0]
            case "ic_wallet":
                return tabPoints[1]
            case "ic_user":
                return tabPoints[2]
            default:
                return tabPoints[0]
            }
        }
    }
}

struct TabBarButton: View {
    var image : String
    @Binding var selectedTab: String
    @Binding var selectedImage: String
    @Binding var tabPoints: [CGFloat]
    
    var body: some View {
        GeometryReader { reader -> AnyView in
            let midX =  reader.frame(in: .global).midX
            
            DispatchQueue.main.async {
                if tabPoints.count <= 4 {
                    tabPoints.append(midX)
                }
            }
            return AnyView (
                Button(action: {
                    self.selectedImage = self.image
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.5)){
                        selectedTab = image
                    }
                }, label: {
                    Image("\(image)\(selectedTab == image ? "" : "_filled")")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(0.6)
                        .frame(height: selectedTab == image ? 45 : 30)
                        .offset(y: selectedTab == image ? -5 : 0)
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
        }
        .frame(height: 45)
    }
}

struct CustomShape: Shape{
    var tabPoint: CGFloat

    var animatableData: CGFloat{
        get {return tabPoint}
        set {tabPoint = newValue}
    }

    func path(in rect: CGRect) -> Path {
        return Path{path in
            path.move(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))

            let mid = tabPoint

            path.move(to: CGPoint(x: mid - 40, y: rect.height))

            let to = CGPoint(x: mid, y: rect.height - 20)
            let control1 = CGPoint(x: mid - 15, y: rect.height)
            let control2 = CGPoint(x: mid - 15, y: rect.height - 20)

            let to1 = CGPoint(x: mid + 40, y: rect.height)
            let control3 = CGPoint(x: mid + 15, y: rect.height - 20)
            let control4 = CGPoint(x: mid + 15, y: rect.height)

            path.addCurve(to: to, control1: control1, control2: control2)
            path.addCurve(to: to1, control1: control3, control2: control4)
        }
    }
}
