//
//  TabletHomeScreen.swift
//  ScanDirect
//
//  Created by Wayne Anthony Ross Jr. on 2/24/23.
//

import SwiftUI

struct TabletHomeScreen: View {
    @ObservedObject var store: Store
    
    var currentYear: String {
        let year = Calendar.current.component(.yearForWeekOfYear, from: Date())
        return "\(year)"
    }
    
    var body: some View {
        ZStack {
            Color("CardBackground2")
                .edgesIgnoringSafeArea(.vertical)
            
            VStack {
                Spacer()
                
                VStack {
                    Image("AppIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    
                    ggctheme.gradient
                        .mask(
                            Text(currentYear)
                                .font(.system(size: 48))
                                .bold()
                        )
                        .frame(height: 50)
                    
                    Text("ScanDirect")
                        .bold()
                        .foregroundColor(ggctheme.textColor)
                }
                .padding(.vertical, 24)
                .padding(.horizontal)
                .frame(width: UIScreen.main.bounds.width / 2)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color("CardBackground"))
                )
                
                Spacer()
            }
            
            if Device.isIPad && (Device.isPortraitDown || Device.isPortraitUp) {
                HStack {
                    
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 5, height: 200)
                        .foregroundColor(ggctheme.textColor.opacity(0.1))
                        .padding(.leading)
                    
                    Spacer()
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct TabletHomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        TabletHomeScreen(store: Store())
    }
}
