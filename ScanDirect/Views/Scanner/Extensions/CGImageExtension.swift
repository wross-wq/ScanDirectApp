//
//  CGImageExtension.swift
//  ScanDirect
//
//  Created by Wayne Anthony Ross Jr. on 3/10/23.
//

import CoreGraphics
import VideoToolbox

extension CGImage {
  static func create(from cvPixelBuffer: CVPixelBuffer?) -> CGImage? {
    guard let pixelBuffer = cvPixelBuffer else {
      return nil
    }

    var image: CGImage?
    VTCreateCGImageFromCVPixelBuffer(
      pixelBuffer,
      options: nil,
      imageOut: &image)
    return image
  }
}
