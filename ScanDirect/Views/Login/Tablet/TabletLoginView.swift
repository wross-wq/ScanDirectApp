//
//  TabletLoginView.swift
//  ScanDirect
//
//  Created by Wayne Anthony Ross Jr. on 2/23/23.
//

import Foundation
import UIKit
import SwiftUI
import FBAuthentication

struct TabletLoginView: View {
    @EnvironmentObject var userInfo: UserInfo
    @State var switchLogo = false
    
    var body: some View {
        ZStack {
            Color("GGCDarkGreen")
                .edgesIgnoringSafeArea(.vertical)
            
            VStack {
                Spacer()
                
                VStack {
                    Image("AppIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    
                    Text("ScanDirect")
                        .bold()
                        .foregroundColor(ggctheme.textColor)
                    
                    Button("Login") {
                        //self.loginStore.userSubjects.hasClickedLogin.send()
                    }
                    .foregroundColor(ggctheme.accent1)
                }
                .padding(.vertical, 24)
                .padding(.horizontal)
                .frame(width: UIScreen.main.bounds.width / 2)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color("CardBackground"))
                )
                
                Spacer()
                
                if !switchLogo {
                    Image("AppIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .onTapGesture(count: 2) {
                            withAnimation {
                                switchLogo.toggle()
                            }
                        }
                } else {
                    Image("AppIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                }
            }
        }
    }
}

struct TabletLoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabletLoginView()
                .preferredColorScheme(.dark)
                .previewDevice("iPad Pro (11-inch) (3rd generation)")
                .previewInterfaceOrientation(.landscapeRight)
            TabletLoginView()
                .preferredColorScheme(.light)
                .previewDevice("iPad Pro (11-inch) (3rd generation)")
                .previewInterfaceOrientation(.landscapeRight)
            

        }
    }
}
