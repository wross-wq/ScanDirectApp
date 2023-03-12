//
//  CardView.swift
//  ScanDirect
//
//  Created by Wayne Anthony Ross Jr. on 2/24/23.
//

import SwiftUI

struct CardView<Content: View>: View {
    var content: () -> Content
    
    var body: some View {
        VStack {
            content()
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color("CardBackground"))
        )
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CardView {
                Text("Hello World")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
    }
}
