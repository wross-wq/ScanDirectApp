//
//  FrameView.swift
//  ScanDirect
//
//  Created by Wayne Anthony Ross Jr. on 3/9/23.
//

import SwiftUI
import Firebase

struct FrameView: View {
    
    @State private var isCloseButtonPressed = false

    var image: CGImage?
    private let label = Text("Camera feed")
    
    var body: some View {
        
        
        if let image = image {
            
            GeometryReader { geometry in
                
                Image(image, scale: 1.0,
                      orientation: .upMirrored, label: label)
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width,
                       height: geometry.size.height,
                       alignment: .center)
                .clipped()
                .toolbar {
                    Button {
                        isCloseButtonPressed.toggle()
                    } label: {
                        Label("Close Scanner",
                              systemImage: "multiply.circle.fill")
                        .foregroundStyle(.blue, .gray)
                    }.fullScreenCover(isPresented: $isCloseButtonPressed){
                        PhoneNavigationView(showSheet: .constant(false),
                                            primaryColor: .systemBlue,
                                            secondaryColor: .systemBlue)
                    }.padding(.vertical, 24)
                        .padding(.horizontal)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color("GGCDarkBlue"))
                        )
                        .padding(.trailing, 50)
                        .padding(.top, 10)
                }
            }
        } else {
            Color.black
        }
    }
}

struct FrameView_Previews: PreviewProvider {
    static var previews: some View {
        FrameView()
    }
}
