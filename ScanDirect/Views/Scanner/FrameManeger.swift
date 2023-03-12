//
//  FrameManeger.swift
//  ScanDirect
//
//  Created by Wayne Anthony Ross Jr. on 3/9/23.
//

import Foundation
import AVFoundation

class FrameManager: NSObject, ObservableObject {
    
    static let shared = FrameManager()
    
    @Published var current: CVPixelBuffer?
    
    let videoOutputQueue = DispatchQueue (
    label: "com.raywenderlich.VideoOutputQ",
    qos: .userInitiated,
    attributes: [],
    autoreleaseFrequency: .workItem)
    
    private override init() {
        super.init()
        
        CameraManager.shared.set(self, queue: videoOutputQueue)
    }
}

extension FrameManager: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(
        _ output: AVCaptureOutput,
        didOutput sampleBuffer:
    CMSampleBuffer,
        from connection:
        AVCaptureConnection ) {
            if let buffer = sampleBuffer.imageBuffer {
                DispatchQueue.main.async {
                    self.current = buffer
                }
            }
        }
}
