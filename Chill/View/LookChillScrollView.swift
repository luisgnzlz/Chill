//
//  LookChillScrollView.swift
//  Chill
//
//  Created by Luis Gonzalez on 7/29/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit

let addChill = LookChillView()
let deletePhoto = deleteChillButton()
let downloadBtn = downloadButton()
let mapV = mapView()
let chillControl = UINavigationController(rootViewController: LookChillViewController())



class LookChillScrollView: UIScrollView {
    override init(frame: CGRect) {
        super .init(frame: frame)
        self.reloadInputViews()
        contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1500)
        setUpLookView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpLookView(){
        addSubview(addChill)
        addSubview(deletePhoto)
        addSubview(downloadBtn)
        addSubview(mapV)
        addChill.translatesAutoresizingMaskIntoConstraints = false
        deletePhoto.translatesAutoresizingMaskIntoConstraints = false
        downloadBtn.translatesAutoresizingMaskIntoConstraints = false
        mapV.translatesAutoresizingMaskIntoConstraints = false
        
        if chillLabel.text == "No Chll Memories To Show Yet" {
            scrollRectToVisible(CGRect(x: 0, y: 0, width: screenwidth, height: screenheight - navBarHeight), animated: true)
            deletePhoto.isHidden = true
            downloadBtn.isHidden = true
            mapV.isHidden = true
        } else {
            scrollRectToVisible(CGRect(x: 0, y: 0, width: screenwidth, height: 0), animated: true)
        }
        
        addChill.topAnchor.constraint(equalTo: topAnchor).isActive = true
        addChill.safeAreaLayoutGuide.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
        addChill.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
        addChill.heightAnchor.constraint(equalToConstant: screenheight - navBarHeight).isActive = true
        
        deletePhoto.topAnchor.constraint(equalTo: addChill.bottomAnchor, constant: 1500 - screenheight).isActive = true
        deletePhoto.safeAreaLayoutGuide.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 25).isActive = true
        deletePhoto.heightAnchor.constraint(equalToConstant: 50).isActive = true
        deletePhoto.rightAnchor.constraint(equalTo: centerXAnchor, constant: 2).isActive = true
        
        downloadBtn.topAnchor.constraint(equalTo: addChill.bottomAnchor, constant: 1500 - screenheight).isActive = true
        downloadBtn.leftAnchor.constraint(equalTo: deletePhoto.rightAnchor, constant: 2).isActive = true
        downloadBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        downloadBtn.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -25).isActive = true
        
        mapV.topAnchor.constraint(equalTo: addChill.bottomAnchor, constant: 1000 - screenheight).isActive = true
        mapV.safeAreaLayoutGuide.leftAnchor.constraint(equalTo: leftAnchor, constant: 2).isActive = true
        mapV.heightAnchor.constraint(equalToConstant: 400).isActive = true
        mapV.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -2).isActive = true
        
    }
    
    func cancelTheLook() {
        self.scrollRectToVisible(CGRect(x: 0, y: 0, width: screenwidth, height: 0), animated: true)
        lat = 0
        long = 0
        viewController.collectionView?.reloadData()
    }


}

