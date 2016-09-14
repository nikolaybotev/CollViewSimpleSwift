//
//  Cell.swift
//  CollViewSimpleSwift
//
//  Created by Nikolay Botev on 3/31/16.
//  Copyright © 2016 Chuckmoji. All rights reserved.
//

import UIKit

struct ImageData {
    let image: UIImage
    let label: String
}

class Cell: UICollectionViewCell {

    class SelectedCellBackground: UIView {
        override func draw(_ rect: CGRect) {
            let aRef = UIGraphicsGetCurrentContext()
            aRef?.saveGState()
            let bezierPath = UIBezierPath(roundedRect: rect, cornerRadius:5.0)
            bezierPath.lineWidth = 5.0
            UIColor.black.setStroke()

            let fillColor = UIColor(red:0.529, green:0.808, blue:0.922, alpha:1) // color equivalent is #87ceeb
            fillColor.setFill()

            bezierPath.stroke()
            bezierPath.fill()
            aRef?.restoreGState()
        }
    }

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.selectedBackgroundView = SelectedCellBackground()
    }
}
