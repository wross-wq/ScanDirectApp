//
//  CameraManager.swift
//  ScanDirect
//
//  Created by Wayne Anthony Ross Jr. on 3/9/23.
//

import Foundation
import AVFoundation

class CameraManager: ObservableObject {
    
    func set(
        _ delegate:
        AVCaptureVideoDataOutputSampleBufferDelegate, queue: DispatchQueue) {
            sessionQueue.async {
                self.videoOutput.setSampleBufferDelegate(delegate, queue: queue)
            }
        }
    
    private func checkPermissions() {
        
        switch
        AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
            
            sessionQueue.suspend()
            
            AVCaptureDevice.requestAccess(for: .video) {
                authorized in
                
                if !authorized { self.status = .unauthorized }
                self.sessionQueue.resume()
            }
            
        case .restricted:
            status = .unauthorized
        case .denied:
            status = .unauthorized
        case .authorized:
            break
            
        @unknown default:
            status = .unauthorized
        }
    }
    
    private func configureCaptureSession() {
        guard status == .unconfigured
        else {
            return
        }
        session.beginConfiguration()
        do {
            session.commitConfiguration()
        }
        
        let device = AVCaptureDevice.default(.builtInWideAngleCamera,
                                             for: .video,
                                             position: .front)
        guard let camera = device else {
            
            set(error: .cameraUnavailable)
            status = .failed
            return
        }
        
        do {
            
            let cameraInput = try AVCaptureDeviceInput(device: camera)
            
            if session.canAddInput(cameraInput) {
                session.addInput(cameraInput)
            } else {
                set(error: .cannotAddInput)
                status = .failed
                return
            }
        } catch {
            set(error: .createCaptureInput(error))
            status = .failed
            return
        }
        
        if session.canAddOutput(videoOutput) {
            session.addOutput(videoOutput)
            
            videoOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey
                                         as String: kCVPixelFormatType_32BGRA]
            
            let videoConnection = videoOutput.connection(with: .video)
            
            videoConnection?.videoOrientation = .portrait
        } else {
            
            set(error: .cannotAddOutput)
            status = .failed
            return
        }
        
        status = .configured
    }
    
    @Published var error: CameraError?
    
    let session = AVCaptureSession()
    
    private let sessionQueue = DispatchQueue(label: "com.raywenderlich.SessionQ")
    private let videoOutput = AVCaptureVideoDataOutput()
    private var status = Status.unconfigured
    
    private func set(error: CameraError?) {
        DispatchQueue.main.async {
            self.error = error
        }
    }
    
    enum Status {
        case unconfigured
        case configured
        case unauthorized
        case failed
    }
    
    static let shared = CameraManager()
    
    private init() {
        configure()
    }
    
    private func configure() {
        checkPermissions()
                  sessionQueue.async {
            self.configureCaptureSession()
            self.session.startRunning()
        }
    }
}


