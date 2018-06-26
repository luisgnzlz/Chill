//
//  ViewController.swift
//  Chill
//
//  Created by Luis Gonzalez on 6/3/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit



class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "My Chill List"
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(addNewCell))
    
        collectionView?.backgroundColor = .white
        collectionView?.register(customCell.self, forCellWithReuseIdentifier: "ImageCell")
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return info.init().testCount
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let chillControl = UINavigationController(rootViewController: LookChillViewController())
        let count = info.init().testCount - 1
        picture.image = UIImage(named: "cool")
        chillLabel.text = info.init().chillArray[count - indexPath.row]
        present(chillControl, animated: true, completion: nil)
        print(indexPath.row)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let Customecell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! customCell
        let count = info.init().testCount - 1
        Customecell.label.text = "\(info.init().chillArray[count - indexPath.row]!)"
        Customecell.image.image = UIImage(named: "sac")
        return Customecell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 50
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
    
    @objc func addNewCell() {
        let addChillControl = UINavigationController(rootViewController: AddChillViewController())
        //arraydiscription[arraydiscription.count] = "this is the thing"
        //collectionView?.reloadData()
        present(addChillControl, animated: true, completion: nil)
    }
    
    func hi() {
        //collectionView?.reloadData()
        print("hi there")
    }

}

