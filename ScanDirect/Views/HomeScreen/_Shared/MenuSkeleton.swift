//
//  MenuSkeleton.swift
//  ScanDirect
//
//  Created by Wayne Anthony Ross Jr. on 2/23/23.
//

import SwiftUI

struct MenuSkeleton: View {
    var amount: Int
    
    var body: some View {
        ForEach(0..<amount) { _ in
            VStack {
                RoundedRectangle(cornerRadius: 16)
                    .frame(height: 32)
                
                RoundedRectangle(cornerRadius: 16)
                    .frame(height: 24)
                    .padding(.leading)
                RoundedRectangle(cornerRadius: 16)
                    .frame(height: 24)
                    .padding(.leading)
                RoundedRectangle(cornerRadius: 16)
                    .frame(height: 24)
                    .padding(.leading)
            }
        }
    }
}

struct MenuSkeleton_Previews: PreviewProvider {
    static var previews: some View {
        MenuSkeleton(amount: 3)
    }
}
