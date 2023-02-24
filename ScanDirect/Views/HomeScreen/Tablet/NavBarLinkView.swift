//
//  NavBarLinkView.swift
//  ScanDirect
//
//  Created by Wayne Anthony Ross Jr. on 2/24/23.
//

import SwiftUI

struct NavbarLinkView: View {
    @Binding var isActive: Bool
    let text: String
    let accent: Color
    
    var body: some View {
        HStack {
            Text(text)
                .foregroundColor(isActive ? .white : Color("TextColor"))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(isActive ? accent : Color.clear)
        )
        .contentShape(Rectangle())
    }
}

struct NavbarLinkView_Previews: PreviewProvider {
    static var previews: some View {
        NavbarLinkView(isActive: .constant(true), text: "Search?", accent: .green)
    }
}
