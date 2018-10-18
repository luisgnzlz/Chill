//
//  profileSettings.swift
//  IronMan
//
//  Created by Luis Gonzalez on 8/24/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit

class profileSettings: NSObject, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    let blackview = UIView()
    let cellId = "cellId"
    
    let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let CView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    CView.backgroundColor = .white
    return CView
    }()
    
    func handleSettings() {
        
        if let window = UIApplication.shared.keyWindow {
            
            blackview.backgroundColor = UIColor(white: 0, alpha: 0.5)
            blackview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            window.addSubview(blackview)
            blackview.frame = window.frame
            blackview.alpha = 0
            window.addSubview(collectionView)
            
            let height: CGFloat = 200
            let y = window.frame.height - height
            
            collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackview.alpha = 1
                self.collectionView.frame = CGRect(x: 0, y: y, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
            }, completion: nil)
            
        }
    }

@objc func handleDismiss() {
    print("starts")
    UIView.animate(withDuration: 0.5) {
        self.blackview.alpha = 0
        
        if let window = UIApplication.shared.keyWindow {
            self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
        }
        print("ends")
    }
}
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 55
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ProfilecustomCell
        cell.label.text = "\(indexPath.row)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 100)
    }
    
    override init() {
        super.init()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(ProfilecustomCell.self, forCellWithReuseIdentifier: cellId)
    }
}
