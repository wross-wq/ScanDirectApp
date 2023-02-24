//
//  App.swift
//  ScanDirect
//
//  Created by Wayne Anthony Ross Jr. on 2/23/23.
//

import Foundation

struct Application {
    static var version: String {
        guard let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else {
            return ""
        }

        return appVersion
    }
    
    static var build: String {
        guard let appVersion = Bundle.main.infoDictionary?["CFBundleVersion"] as? String else {
            return ""
        }

        return appVersion
    }
}
