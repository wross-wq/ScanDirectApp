//
//  PhoneNavigationView.swift
//  ScanDirect
//
//  Created by Wayne Anthony Ross Jr. on 2/23/23.
//

import Foundation
import SwiftUI


struct PhoneNavigationView: View {
    @EnvironmentObject var store: Store

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LogoutButtonView()
                }
            }

        }
    }
}

struct PhoneNavigatioNView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNavigationView()
    }
}
