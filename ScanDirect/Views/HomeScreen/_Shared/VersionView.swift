//
//  VersionView.swift
//  ScanDirect
//
//  Created by Wayne Anthony Ross Jr. on 2/23/23.
//

import SwiftUI
import Firebase

struct VersionView: View {
    
    let environmentName: String = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        
        guard let value = dict["ENVIRONMENT_NAME"] as? String else {
            fatalError("ENVIRONMENT_NAME: Key not set in plist for this environment")
        }
        return value
    }()
    
    var body: some View {
        VStack {

        }
        .frame(maxWidth: .infinity, maxHeight: 0)
        .padding(.vertical)
        .background(Color.red)
    }
}

struct VersionView_Previews: PreviewProvider {
    static var previews: some View {
        VersionView()
    }
}

