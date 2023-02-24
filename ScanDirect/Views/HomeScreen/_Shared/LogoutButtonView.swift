//
//  LogoutButtonView.swift
//  ScanDirect
//
//  Created by Wayne Anthony Ross Jr. on 2/23/23.
//

import SwiftUI
import FBAuthentication

struct LogoutButtonView: View {
    @EnvironmentObject var userInfo: UserInfo
    @State var showAlert = false
    
    var body: some View {
        Button {
            showAlert.toggle()
        } label: {
            /*HStack {
                FontAwesomeView(icon: .dooropen, style: .solid, size: 17)
                    .foregroundColor(.red)
                
                Text("Logout")
                    .bodyText()
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .contentShape(Rectangle())*/
        }
        .buttonStyle(.plain)
        .padding(.horizontal)
        .alert("Are you sure?", isPresented: $showAlert, actions: {
            Button("Logout", role: .destructive) {
                //self.userInfo.userSubjects.hasClickedLogout.send()

            }
            Button("Cancel", role: .cancel) { }
        }, message: {
            Text("Are you sure you want to logout?")
        })
    }
}

struct LogoutButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LogoutButtonView()
    }
}
