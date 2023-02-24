//
//  ggcTheme.swift
//  ScanDirect
//
//  Created by Wayne Anthony Ross Jr. on 2/23/23.
//

import Foundation
import SwiftUI

class ggctheme {
    static var lightBackground = Color("LightBackground")
    
    static var accent1 = Color("GGCDarkBlue")
    static var accent2 = Color("GGCDarkYellow")
    static var accent3 = Color("GGCDarkGreen")

    static var textColor = Color("TextColor")
    
//    static let gradient =     let gradient: [Color] = [
//        Color("CommencementDarkRed"),
//        Color("CommencementDarkPurple"),
//        Color("CommencementDarkBlue")
//    ]
    static let gradient = LinearGradient(
        gradient: Gradient(colors: [accent3, accent2, accent1]),
        startPoint: UnitPoint(x: 0.22, y: 0.5),
        endPoint: UnitPoint(x: 1.01, y: 0.5)
    )
    
    static let skeletonGradient = Gradient(colors: [Color("SkeletonMain"), Color("SkeletonAccent"), Color("SkeletonMain")])
}
