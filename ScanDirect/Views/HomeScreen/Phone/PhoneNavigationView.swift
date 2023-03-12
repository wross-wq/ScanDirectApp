//
//  PhoneNavigationView.swift
//  ScanDirect
//
//  Created by Wayne Anthony Ross Jr. on 2/23/23.
//

import Foundation
import SwiftUI
import Firebase

struct PhoneNavigationView: View {
    
    @EnvironmentObject var store: Store
    @State var user: UserViewModel = UserViewModel()
    @Binding var showSheet: Bool
    @State private var isSideBarOpened = false
    @State private var showAlert = false
    var primaryColor: UIColor
    var secondaryColor: UIColor
    @StateObject private var model = ContentViewModel()
    @State private var GoToPersonSearchView = false
    @State private var GoToFrameView = false


    var body: some View {
        ZStack {
            NavigationView {
            
            Color("GGCDarkGreen")
                .edgesIgnoringSafeArea(.vertical)

                .toolbar {
                    Button {
                        isSideBarOpened.toggle()
                        
                    } label: {
                        Label("Toggle SideBar",
                              systemImage: "line.3.horizontal.circle")
                    }
                }
                .listStyle(.inset)
        }
        SideBarView(isSidebarVisible: $isSideBarOpened, primaryColor: .systemGray,
                        secondaryColor: .systemGray)
            
            VStack {
                
                Image("GGCLogo")
                .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200, alignment: .center)
                    .padding([.bottom], 150)
                    .padding([.top], 100)
                
                Button {
                    
                    GoToFrameView.toggle()
                    
                } label: {
                    Text("Scan ID")
                        .font(.system(size: 33))
                        .padding(.vertical, 25)
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
                .padding(.horizontal)
                //.hidden()
                Spacer()
                
                TextField("GGC ID or Student name",
                          text: self.$user.ggcId, prompt: Text("GGC ID/Name").foregroundColor(.black))
                .font(.system(size: 33))
                .frame(width: 200)
                .padding([.bottom], 30)
                .background(Color(.systemGray6))
                .keyboardType(.default)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black, lineWidth: 3)
                }
                
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
                .padding([.bottom], 50)
                }
            }
        }
    }

struct PhoneNavigatioNView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNavigationView(showSheet: .constant(false),
                            primaryColor: .systemGray6,
                            secondaryColor: .systemGray6)
    }
}
