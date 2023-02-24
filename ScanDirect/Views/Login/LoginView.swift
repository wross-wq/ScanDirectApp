//
//  LoginView.swift
//  ScanDirect
//
//  Created by Wayne Anthony Ross Jr. on 2/23/23.
//

import SwiftUI
import FBAuthentication

struct MyLoginView: View {
    @EnvironmentObject var userInfo: UserInfo
    @State private var showSheet = false
    var primaryColor: UIColor
    var secondaryColor: UIColor
    
    var body: some View {
        VStack {
            if Device.isIPad || Device.isMac {
                TabletLoginView()
            } else {
                PhoneLoginView(showSheet: .constant(false),
                               primaryColor: .systemGreen,
                               secondaryColor: .systemGray)
            }
        }
        VStack {
        PhoneLoginView(showSheet: $showSheet,
                                primaryColor: primaryColor,
                                secondaryColor: secondaryColor)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        MyLoginView(primaryColor: .systemGray, secondaryColor: .systemGray)
    }
}
