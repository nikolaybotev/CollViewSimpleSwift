//
//  ViewController.swift
//  CollViewSimpleSwift
//
//  Created by Nikolay Botev on 3/31/16.
//  Copyright © 2016 Chuckmoji. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {

    static let kCellId = "cellID"

    @objc
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return 32
    }

    func getImageData(_ indexPath: IndexPath, suffix: String = "") -> ImageData {
        let label = "{\((indexPath as NSIndexPath).row) ,\((indexPath as NSIndexPath).section)}"
        let imageToLoad = "\((indexPath as NSIndexPath).row)\(suffix)"
        let image = UIImage(named: imageToLoad)
        return ImageData(image: image!, label: label)
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: Cell =
            collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewController.kCellId,
                                                                  for: indexPath) as! Cell

        let imageData = getImageData(indexPath)
        cell.label.text = imageData.label
        cell.imageView!.image = imageData.image
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if (segue.identifier == "showDetail") {
            let indexPath = collectionView?.indexPathsForSelectedItems![0]
            let imageData = getImageData(indexPath!, suffix: "_full")

            let detailView = segue.destination as! DetailViewController
            detailView.imageData = imageData
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

