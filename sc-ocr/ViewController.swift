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
    
    private lazy var excludeLayer: CAShapeLayer = {
        return CAShapeLayer()
    }()
    
    @IBOutlet private weak var cameraView: UIView!
    @IBOutlet private weak var interestRegion: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swiftOCRInstance = SwiftOCR()
        
        let img = UIImage(named: "melli-example")!
        
        swiftOCRInstance.recognize(img) { recognizedString in
            print(recognizedString)
        }
        
    }
    
    
}

// MARK: Methods

extension ViewController {
    private func fillOpaqueAroundAreaOfInterest(parentView: UIView, areaOfInterest: UIView) {
        let parentViewBounds = parentView.bounds
        let areaOfInterestFrame = areaOfInterest.frame
        
        let path = UIBezierPath(rect: parentViewBounds)
        let areaOfInterestPath = UIBezierPath(rect: areaOfInterestFrame)
        path.append(areaOfInterestPath)
        path.usesEvenOddFillRule = true
        
        excludeLayer.path = path.cgPath
        parentView.layer.addSublayer(excludeLayer)
    }
}

// MARK: - Life Cycle

extension ViewController {
}
