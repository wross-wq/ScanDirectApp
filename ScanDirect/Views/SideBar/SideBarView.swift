//
//  SideBarView.swift
//  ScanDirect
//
//  Created by Wayne Anthony Ross Jr. on 2/28/23.
//

import SwiftUI
import Firebase

extension Color {
    static let primary = Color("GGCDarkGreen")
        static let secondary = Color("GGCDarkGreen")
}

struct SideBarView: View {
    @Binding var isSidebarVisible: Bool
    @State private var showSheet = false
    @State var user: UserViewModel = UserViewModel()
    @StateObject private var model = ContentViewModel()
    var sideBarWidth = UIScreen.main.bounds.size.width * 0.7
    var bgColor: Color = Color(.white)
    var primaryColor: UIColor
    var secondaryColor: UIColor
    @State private var GoToFrameView = false
    @State private var GoToPersonSearchView = false
    @State private var GoToLoginView = false
    @State private var GoToPhoneNavigationView = false

        var body: some View {
            
            ZStack {
                GeometryReader { _ in
                    EmptyView()
                }
                .background(.black.opacity(0.6))
                .opacity(isSidebarVisible ? 1 : 0)
                .animation(.easeInOut.delay(0.2), value: isSidebarVisible)
                .onTapGesture {
                    isSidebarVisible.toggle()
                }
                content
            }
            .edgesIgnoringSafeArea(.all)
    }

    var content: some View {
        HStack(alignment: .top) {
            ZStack(alignment: .top) {
                bgColor
                MenuChevron
            }
            .frame(width: sideBarWidth)
            .offset(x: isSidebarVisible ? 0 : -sideBarWidth)
            .animation(.default, value: isSidebarVisible)
            
            Spacer()
            
        }
    }
    
    var MenuChevron: some View{
        ZStack {
            
            Image("GGCLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200, alignment: .center)
                .padding([.top], 10)
                .padding([.bottom], 300)

            Spacer()
            
            Button{
                GoToFrameView.toggle()
            } label: {
                Text("Scan ID")
                    .padding([.vertical], 15)
                    .frame(width: 200)
                    .background(Color(primaryColor))
                    .cornerRadius(8)
                    .foregroundColor(.black)
            }.fullScreenCover(isPresented: $GoToFrameView){
                FrameView(image: model.frame)
                    .edgesIgnoringSafeArea(.all)
                ErrorView(error: model.error)
                }
                .padding(.vertical, 24)
                .padding(.horizontal)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color("CardBackground"))
                )
                .padding([.top], 130)
                .padding([.bottom], 100)
            
            
            Spacer()
            
            TextField("GGC ID or Student name",
                      text: self.$user.ggcId, prompt: Text("GGC ID/Name").foregroundColor(.black))
            .font(.system(size: 30))
            .frame(width: 200)
            .padding([.bottom], 30)
            .background(Color(.systemGray6))
            .keyboardType(.default)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.black, lineWidth: 3)
            }
            .padding([.bottom], 50)
            .padding([.top], 280)

            
            Button{
                GoToPersonSearchView.toggle()
            } label: {
                Text("Search")
                    .font(.system(size: 20))
                    .padding(.vertical, 15)
                    .frame(width: 200)
                    .background(Color(primaryColor))
                    .cornerRadius(8)
                    .foregroundColor(.black)
            }.fullScreenCover(isPresented: $GoToPersonSearchView){
                PersonSearchView(primaryColor: .systemGray6,
                                 secondaryColor: .systemGray6)
            }
            .padding(.vertical, 24)
            .padding(.horizontal)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color("CardBackground"))
            )
            .padding(.horizontal)
            .padding([.top], 380)
            
            Spacer()
            
            Button{
                GoToPhoneNavigationView.toggle()
            } label: {
                Text("Home")
                    .padding([.vertical], 15)
                    .frame(width: 200)
                    .background(Color(primaryColor))
                    .cornerRadius(8)
                    .foregroundColor(.black)
            }.fullScreenCover(isPresented: $GoToPhoneNavigationView){
                PhoneNavigationView(showSheet: .constant(false),
                                    primaryColor: .systemGray,
                                    secondaryColor: .systemGray)
                }
                .padding(.vertical, 24)
                .padding(.horizontal)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color("CardBackground"))
                )
                .padding([.top], 650)
                .padding([.bottom], 100)
            
            Spacer()
            
            Button{
                GoToLoginView.toggle()
            } label: {
                Text("Logout")
                    .padding([.vertical], 15)
                    .frame(width: 200)
                    .background(Color(primaryColor))
                    .cornerRadius(8)
                    .foregroundColor(.black)
            }.fullScreenCover(isPresented: $GoToLoginView){
                PhoneLoginView(showSheet: .constant(false),
                               primaryColor: .systemGray,
                                    secondaryColor: .systemGray)
                }
                .padding(.vertical, 24)
                .padding(.horizontal)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color("CardBackground"))
                )
                .padding([.top], 730)
        }
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView(isSidebarVisible: .constant(false),
                    primaryColor: .systemGray,
                    secondaryColor: .systemGray)
    }
}
