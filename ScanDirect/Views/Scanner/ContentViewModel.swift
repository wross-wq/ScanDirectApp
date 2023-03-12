//
//  ContentViewModel.swift
//  ScanDirect
//
//  Created by Wayne Anthony Ross Jr. on 3/9/23.
//

import Foundation
import SwiftUI
import Firebase
import CoreImage
import Vision
import VisionKit
import UIKit

class ContentViewModel: ObservableObject {
  @Published var error: Error?
  @Published var frame: CGImage?
  @State private var GoToPersonSearchView = false
  @State var user: UserViewModel = UserViewModel()

  private let context = CIContext()

  private let cameraManager = CameraManager.shared
  private let frameManager = FrameManager.shared
  private var imageText = " "
  var StudentName = " "
  var StudentPassword = " "

  init() {
    setupSubscriptions()
  }

  func setupSubscriptions() {
    // swiftlint:disable:next array_init
    cameraManager.$error
      .receive(on: RunLoop.main)
      .map { $0 }
      .assign(to: &$error)

    frameManager.$current
      .receive(on: RunLoop.main)
      .compactMap { [self] buffer in
        guard let image = CGImage.create(from: buffer) else {
          return nil
        }

        let ciImage = CIImage(cgImage: image)
          
        let uiImage = UIImage(cgImage: image)
          
        recognizeText(image: uiImage)
          
        if(imageText == user.fullname){
               StudentName = imageText
                PersonSearchView(primaryColor: .systemGray6,
                                 secondaryColor: .systemGray6)
          }
          
        return self.context.createCGImage(ciImage, from: ciImage.extent)
      }
      
      .assign(to: &$frame)
  }
    
    private func recognizeText(image: UIImage?) {
        guard let cgImage = image?.cgImage else { return }
        
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        
        let request = VNDetectTextRectanglesRequest { [weak self] request, error in
            guard let observations = request.results as? [VNRecognizedTextObservation],
                  error == nil else {
                return
            }
            
            let text = observations.compactMap({
                $0.topCandidates(1).first?.string
            }).joined(separator: " ")
            
            DispatchQueue.main.async {
                self?.imageText = text
            }
        }
        
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
    }
}
