//
//  ViewController.swift
//  sc-ocr
//
//  Created by NP2 on 2/6/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import UIKit
import SwiftOCR
import AVFoundation

final class ViewController: UIViewController {
    
    private var session: AVCaptureSession?
    private var stillImageOutput: AVCapturePhotoOutput?
    private var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    
    @IBOutlet private weak var photoPreviewImageView: UIImageView!

    
    
}

// MARK: Methods

extension ViewController {
    @IBAction private func didTapOnTakePhotoButton(_ sender: UIButton) {
        
    }
    
    private func cameraSetup() {
        session = AVCaptureSession()
        session!.sessionPreset = AVCaptureSession.Preset.photo
        let backCamera = AVCaptureDevice.default(for: AVMediaType.video)
        var error: NSError?
        var input: AVCaptureDeviceInput!
        do {
            input = try AVCaptureDeviceInput(device: backCamera!)
        } catch let error1 as NSError {
            error = error1
            input = nil
            print(error!.localizedDescription)
        }
        if error == nil && session!.canAddInput(input) {
            session!.addInput(input)
            stillImageOutput = AVCapturePhotoOutput()
            
            if session!.canAddOutput(stillImageOutput!) {
                session!.addOutput(stillImageOutput!)
                videoPreviewLayer = AVCaptureVideoPreviewLayer(session: session!)
                videoPreviewLayer!.videoGravity = AVLayerVideoGravity.resizeAspect
                videoPreviewLayer!.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
                self.view.layer.addSublayer(videoPreviewLayer!)
                session!.startRunning()
            }
        }
    }
}

// MARK: - Life Cycle

extension ViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        videoPreviewLayer!.frame = self.view.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swiftOCRInstance = SwiftOCR()
        
        let img = UIImage(named: "melli-example")!
        
        swiftOCRInstance.recognize(img) { recognizedString in
            print(recognizedString)
        }
           
   }
}
