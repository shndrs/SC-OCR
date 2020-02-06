//
//  PhotoViewController.swift
//  sc-ocr
//
//  Created by NP2 on 2/6/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import UIKit

final class PhotoViewController: UIViewController {

    public var takenPhoto: UIImage?
    
    @IBOutlet private weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let availableImage = takenPhoto {
            imageView.image = availableImage
        }
    }
    
    @IBAction func goBack(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
}
