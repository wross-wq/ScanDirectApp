//
//  Device.swift
//  ScanDirect
//
//  Created by Wayne Anthony Ross Jr. on 2/23/23.
//

import Foundation
import UIKit

class Device {
    static var idiom: UIUserInterfaceIdiom {
        UIDevice.current.userInterfaceIdiom
    }
    
    static var isIPad: Bool {
        idiom == .pad
    }
    
    static var isIPhone: Bool {
        idiom == .phone
    }
    
    static var isMac: Bool {
        idiom == .mac
    }
    
    static var isPortrait: Bool {
        UIDevice.current.orientation == .portrait || UIDevice.current.orientation == .portraitUpsideDown
    }
    
    static var isPortraitUp: Bool {
        UIDevice.current.orientation == .portrait
    }
    
    static var isPortraitDown: Bool {
        UIDevice.current.orientation == .portrait || UIDevice.current.orientation == .portraitUpsideDown
    }
    
    static var isLandscape: Bool {
        UIDevice.current.orientation == .landscapeRight || UIDevice.current.orientation == .landscapeLeft
    }
    
    static var isLandscapeRight: Bool {
        UIDevice.current.orientation == .landscapeRight
    }
    
    static var isLandscapeLeft: Bool {
        UIDevice.current.orientation == .landscapeLeft
    }
}
