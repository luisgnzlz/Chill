//
//  ViewController.swift
//  Chill
//
//  Created by Luis Gonzalez on 6/3/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit

var cameraContr = CameraViewController()
let settingsProfile = profileSettings()

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let sharedInstance = SSCache()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Chll"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor(red: 0.343, green: 0.333, blue: 0.239, alpha: 1.00)]
        navigationController?.navigationBar.tintColor = UIColor.gray
        navigationController?.navigationBar.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addNewCell))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "profile"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(coolTest))
    
        collectionView?.backgroundColor = .white
        collectionView?.register(customCell.self, forCellWithReuseIdentifier: "ImageCell")
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if info.init().discriptionNumber! == 0 {
            return 1
        } else {
            return info.init().discriptionNumber!
        }
    }
    
    @objc func coolTest() {
        settingsProfile.handleSettings()
    }

    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let chillControl = UINavigationController(rootViewController: LookChillViewController())
        let count = info.init().discriptionNumber! - 1
        deleteNumber = count - indexPath.row
        
        if info.init().discriptionNumber! == 0 {
            picture.image = UIImage(named: "white")
            chillLabel.text = "No Chll Memories To Show Yet"
        } else {
            picture.image = sharedInstance.getImage(Key: "\(count - indexPath.row)")
            chillLabel.text = info.init().discriptionString[count - indexPath.row]
            lat = info.init().ListlatitudeArray[count - indexPath.row]
            long = info.init().ListlongituteArray[count - indexPath.row]
        }
        present(chillControl, animated: true, completion: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let Customecell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! customCell
        viewController = self
        if info.init().discriptionNumber! == 0 {
            Customecell.label.text = "Press The + Button To Start Adding Chll Moments"
            Customecell.image.image = UIImage(named: "white")
        } else {
        let count = info.init().discriptionNumber! - 1
            Customecell.label.text = "\(info.init().discriptionString[count - indexPath.row])"
            if Customecell.label.text == "No Need For the Memory" {
            }
        Customecell.image.image = sharedInstance.getImage(Key: "\(count - indexPath.row)")
        }
        return Customecell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = UIApplication.shared.statusBarFrame.height +
            self.navigationController!.navigationBar.frame.height
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height - height)
    }
    
    @objc func addNewCell() {
        present(cameraContr, animated: true, completion: nil)
    }
    
    func refreshTheData() {
        collectionView?.reloadData()
        self.collectionView?.scrollToItem(at: IndexPath(row: 0, section: 0),
                                          at: .top,
                                          animated: true)
    }
    
    override var prefersStatusBarHidden: Bool {
        if navigationController?.isNavigationBarHidden == true {
            return true
        } else {
            return false
        }
    }
    
}

