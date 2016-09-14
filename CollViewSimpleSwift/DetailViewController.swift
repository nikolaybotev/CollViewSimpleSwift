//
//  DetailViewController.swift
//  CollViewSimpleSwift
//
//  Created by Nikolay Botev on 3/31/16.
//  Copyright © 2016 Chuckmoji. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var imageData: ImageData!

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var navItem: UINavigationItem!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        imageView.image = imageData.image
        navItem.title = imageData.label
        
    }

}
