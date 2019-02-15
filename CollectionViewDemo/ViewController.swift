//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by IMCS2 on 2/15/19.
//  Copyright © 2019 IMCS2. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    var imageData : [UIImage] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! DataCollectionViewCell
        
        cell.imageView.image = imageData[indexPath.item % imageData.count]
        
        return cell
    }
//    
//    func infinateLoop(scrollView: UIScrollView) {
//        var index = Int((scrollView.contentOffset.x)/(scrollView.frame.width))
//        guard currentIndex != index else {
//            return
//        }
//        currentIndex = index
//        if index <= 0 {
//            index = imageData.count - 1
//            scrollView.setContentOffset(CGPoint(x: (scrollView.frame.width+60) * CGFloat(imageData.count), y: 0), animated: false)
//        } else if index >= imageData.count + 1 {
//            index = 0
//            scrollView.setContentOffset(CGPoint(x: (scrollView.frame.width), y: 0), animated: false)
//        } else {
//            index -= 1
//        }
//        pageController.currentPage = index
//    }
//    
  
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("you selcted \(indexPath.item)")
        mainImageView.image = imageData[indexPath.item]
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        print("highlights")
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.dataSource = self
        //image array
        imageData = [#imageLiteral(resourceName: "image6"),#imageLiteral(resourceName: "image7"),#imageLiteral(resourceName: "image5"),#imageLiteral(resourceName: "image8"),#imageLiteral(resourceName: "image4"),#imageLiteral(resourceName: "image2"),#imageLiteral(resourceName: "image1"),#imageLiteral(resourceName: "image10"),#imageLiteral(resourceName: "image9"),#imageLiteral(resourceName: "image3")]
        //initial image is first image
        mainImageView.image = imageData[0]
    }


}

