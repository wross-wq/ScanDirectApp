//
//  PersonSearchView.swift
//  ScanDirect
//
//  Created by Wayne Anthony Ross Jr. on 2/24/23.
//

import SwiftUI
import FBAuthentication

public struct PersonSearchView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var userInfo: UserInfo
    @State private var fullname = ""
    var primaryColor: UIColor
    public init(primaryColor: UIColor = .systemGray6) {
    self.primaryColor = primaryColor
    }
    
    public var body: some View {
        ZStack {
            
            Color("GGCDarkGreen")
                .edgesIgnoringSafeArea(.vertical)
            
            VStack {
                Text(userInfo.user.name)
                    .font(.title)
            }
            .padding(.top, 40)
            .padding(.horizontal, 10)
        }.onAppear {
            fullname = userInfo.user.name
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(UserInfo())
    }
}
