//
//  PersonSearchView.swift
//  ScanDirect
//
//  Created by Wayne Anthony Ross Jr. on 2/24/23.
//

import SwiftUI
import UIKit
import Firebase


public struct PersonSearchView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var user: UserViewModel = UserViewModel()
    @State var name: ContentViewModel = ContentViewModel()
    @State private var isSideBarOpened = false
    var primaryColor: UIColor
    var secondaryColor: UIColor
    
public var body: some View {
        
        
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
        
    CardView {
            
        HStack {
            
            if /* let image = checkIn.profilePicture */ false {
                //                    image
                //                        .resizable()
                //                        .scaledToFit()
                //                        .frame(width: 75, height: 75)
                //                        .clipShape(RoundedRectangle(cornerRadius: 16))
            } else {
                Image("profileIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            
            VStack(alignment: .leading, spacing: 4) {
                /*Text($userInfo.name)
                 .bold()
                 .frame(maxWidth: .infinity, alignment: .leading)
                 
                 IdentityTagView(person.ggcId, person.displayName)
                 .setColor(color: Color("TagColor"))*/
            }
            }
            }
        Text(user.fullname)
                .bold()
                .foregroundColor(.black)
                .padding([.bottom], 100)
                .padding([.top], 100)
        }
    }
}

struct PersonSearchView_Previews: PreviewProvider {
    static var previews: some View {
        PersonSearchView(primaryColor: .systemGray6,
                         secondaryColor: .systemGray6)
    }
}
