//
//  PhoneLoginView.swift
//  ScanDirect
//
//  Created by Wayne Anthony Ross Jr. on 2/23/23.
//
import SwiftUI
import Foundation
import UIKit
import FBAuthentication

struct PhoneLoginView: View {
    @EnvironmentObject var userInfo: UserInfo
    @State var user: UserViewModel = UserViewModel()
    @Binding var showSheet: Bool
    @State private var showAlert = false
    var primaryColor: UIColor
    var secondaryColor: UIColor

    
    var body: some View {
        ZStack {
            Color("GGCDarkGreen")
                .edgesIgnoringSafeArea(.vertical)
            
            VStack {
                Text("ScanDirect")
                    .bold()
                    .foregroundColor(ggctheme.textColor)
                    .font(.largeTitle)
                    .padding([.bottom], 100)
                    .padding([.top], 10)
                
                VStack {
                    Image("GGCLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200, alignment: .center)
                        .padding([.bottom], 200)
                    
                    TextField("GGC ID",
                              text: self.$user.ggcId, prompt: Text("ggc ID").foregroundColor(.black))
                        .background(Color(.systemGray6))
                        .keyboardType(.numberPad)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 3)
                    }
                    SecureField("Password", text: $user.password, prompt: Text("password").foregroundColor(.black))
                        .background(Color(.systemGray6))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 3)
                    }
                    
                    Button {
                        /*FBAuth.authenticate(withEmail: self.user.ggcId,
                                            password: self.user.password) { (result) in
                            switch result {
                            case .failure(let error):
                                self.authError = error
                                self.showAlert = true
                            case .success:
                                print("Signed in")
                            }
                        }*/
                    }label: {
                        Text("Login")
                            .padding(.vertical, 15)
                            .frame(width: 200)
                            .background(Color(primaryColor))
                            .cornerRadius(8)
                            .foregroundColor(.white)
                            .opacity(user.isLogInComplete ? 1 : 0.75)
                    }.disabled(!user.isLogInComplete)
                }
                .padding(.vertical, 24)
                .padding(.horizontal)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color("CardBackground"))
                )
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

struct PhoneLoginView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneLoginView(showSheet: .constant(false),
                       primaryColor: .systemGray,
                       secondaryColor: .systemGray)
    }
}
