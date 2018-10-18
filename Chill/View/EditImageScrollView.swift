//
//  EditImageScrollView.swift
//  Chill
//
//  Created by Luis Gonzalez on 7/10/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit
import CoreImage
import MapKit

var CIFilterNames = [
    "CIPhotoEffectChrome",
    "CIPhotoEffectFade",
    "CIPhotoEffectInstant",
    "CIPhotoEffectNoir",
    "CIPhotoEffectProcess",
    "CIPhotoEffectTonal",
    "CIPhotoEffectTransfer",
    "CISepiaTone"]


let manager = CLLocationManager()
let editPhotoController = UINavigationController(rootViewController: EditPhotoViewController())
let discriptionText = discriptionTextView()
let filters = filterButtons()
let screenwidth = UIScreen.main.bounds.width
let screenheight = UIScreen.main.bounds.height
let navBarHeight = UIApplication.shared.statusBarFrame.height +
    editPhotoController.navigationBar.frame.height

let EditImageView: UIImageView = {
    let imgView = UIImageView()
    imgView.contentMode = UIView.ContentMode.scaleAspectFill
    imgView.translatesAutoresizingMaskIntoConstraints = false
    return imgView
}()

let editButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
    button.setTitle("Edit Image", for: .normal)
    button.setTitleColor(.white, for: .normal)
    
    return button
}()


class EditImageScrollView: UIScrollView, CLLocationManagerDelegate {
    let sharedInstance = SSCache()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        contentSize = CGSize(width: UIScreen.main.bounds.width, height: 2000)
        setUpEditPhoto()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpEditPhoto() {
        addSubview(EditImageView)
    
        discriptionText.translatesAutoresizingMaskIntoConstraints = false
        EditImageView.translatesAutoresizingMaskIntoConstraints = false
        editButton.translatesAutoresizingMaskIntoConstraints = false
        

        
        EditImageView.widthAnchor.constraint(equalToConstant: screenwidth).isActive = true
        EditImageView.heightAnchor.constraint(equalToConstant: screenheight - navBarHeight).isActive = true
        EditImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        addSubview(editButton)
        editButton.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        editButton.bottomAnchor.constraint(equalTo: EditImageView.bottomAnchor).isActive = true
        editButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        editButton.addTarget(self, action: #selector(editPhotoOption), for: .touchUpInside)
        
        addSubview(discriptionText)
        discriptionText.topAnchor.constraint(equalTo: EditImageView.bottomAnchor, constant: 50).isActive = true
        discriptionText.widthAnchor.constraint(equalToConstant: screenwidth).isActive = true
        discriptionText.heightAnchor.constraint(equalToConstant: 100).isActive = true

        discriptionText.text = ""
    }
    
    @objc func filterButtonTapped() {
        
    }
    
    @objc func editPhotoOption() {
        editButton.isHidden = true
        scrollRectToVisible(CGRect(x: 0, y: screenheight - navBarHeight, width: screenwidth, height: screenheight), animated: true)
        
    }
    
    @objc func restartEditView() {
        scrollRectToVisible(CGRect(x: 0, y: 0, width: screenwidth, height: screenheight - navBarHeight), animated: true)
        discriptionText.text = ""
        takePic.backgroundColor = .white
        editButton.isHidden = false
    }
    
    func saveDiscription() {
        info.init(newDis: discriptionText.text!, lat: manager.location!.coordinate.latitude, long: manager.location!.coordinate.longitude)
        EditImageView.image = nil
        restartEditView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }

}
