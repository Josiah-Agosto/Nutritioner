//
//  CameraController.swift
//  Nutritioner
//
//  Created by Josiah Agosto on 12/3/20.
//

import UIKit
import AVFoundation

class CameraController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    // MARK: - References / Properties
    private let captureSession = AVCaptureSession()
    private lazy var previewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)
    private let videoDataOutput = AVCaptureVideoDataOutput()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setCameraInput()
        showCameraFeed()
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        videoDataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "camera_frame_processing_queue"))
        captureSession.startRunning()
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        videoDataOutput.setSampleBufferDelegate(nil, queue: nil)
        captureSession.stopRunning()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        previewLayer.frame = view.bounds
    }
    
    // MARK: - Methods
    // Creates a camera input from user device.
    public func setCameraInput() {
        guard let device = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInDualCamera, .builtInDualWideCamera, .builtInTelephotoCamera, .builtInTripleCamera, .builtInTrueDepthCamera, .builtInUltraWideCamera, .builtInWideAngleCamera], mediaType: .video, position: .back).devices.first else { fatalError("No back camera found!") }
        do {
            let cameraInput = try AVCaptureDeviceInput(device: device)
            self.captureSession.addInput(cameraInput)
        } catch let error {
            fatalError("Error, \(error.localizedDescription)")
        }
    }
    
    
    public func setCameraOutput() {
        videoDataOutput.videoSettings = [(kCVPixelBufferPixelFormatTypeKey as NSString) : NSNumber(value: kCVPixelFormatType_32BGRA)] as [String : Any]
        videoDataOutput.alwaysDiscardsLateVideoFrames = true
        captureSession.addOutput(videoDataOutput)
        guard let connection = videoDataOutput.connection(with: AVMediaType.video),
        connection.isVideoOrientationSupported else { return }
        connection.videoOrientation = .portrait
    }
    
    
    public func showCameraFeed() {
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
    }
    
    // MARK: - AVCaptureVideoDataOutputSampleBufferDelegate
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
//        guard let frame = CMSampleBufferGetImageBuffer(sampleBuffer) else { debugPrint("Unable to get image from sample buffer!"); return }
        
    }
}
