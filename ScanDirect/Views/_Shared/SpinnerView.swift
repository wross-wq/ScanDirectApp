//
//  SpinnerView.swift
//  ScanDirect
//
//  Created by Wayne Anthony Ross Jr. on 2/24/23.
//

import SwiftUI
import ActivityIndicatorView

struct SpinnerView: View {
    var size: Double = 50
    
    let gradient2: [Color] = [
        Color("GGCDarkGreen").opacity(0.25),
        Color("GGCDarkYellow").opacity(0.5),
        Color("GGCDarkBlue")
    ]
    
    
    var body: some View {
        ActivityIndicatorView(isVisible: .constant(true), type: .gradient(gradient2, .round))
            .frame(width: size, height: size)
    }
}

struct SpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        SpinnerView()
    }
}
