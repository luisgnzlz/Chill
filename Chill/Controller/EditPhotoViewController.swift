//
//  EditPhotoViewController.swift
//  Chill
//
//  Created by Luis Gonzalez on 6/28/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit
import CoreImage

let layout = UICollectionViewFlowLayout()
var viewController = ViewController(collectionViewLayout: layout)
let cameraVarCont = CameraViewController()
let sharedInstance = SSCache()
let scrollView = EditImageScrollView()

class EditPhotoViewController: UIViewController, UINavigationControllerDelegate {
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScroll()
        editPhotoController.delegate = self
        view.backgroundColor = .white
        
        navigationItem.title = "Edit Image"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor(red: 0.343, green: 0.333, blue: 0.239, alpha: 1.00)]
        navigationController?.navigationBar.tintColor = UIColor.gray
        navigationController?.navigationBar.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: #selector(SavePic))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelEdit))
        editPhotoViewC.delegate = self
    }
    
    func setupScroll() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
 
    @objc func SavePic() {
        cameraVarCont.cancelCamera()
        
        if info.init().discriptionNumber == 0 {
            sharedInstance.savePicture(image: EditImageView.image!, key: "\(0)")
        } else {
            sharedInstance.savePicture(image: EditImageView.image!, key: "\(info.init().discriptionNumber!)")
        }
        scrollView.saveDiscription()
        viewController.refreshTheData()
        editPhotoViewC.delegate = nil
        cameraContr.dismiss(animated: true, completion: nil)
        cameraContr.compeltedSave()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func cancelEdit() {
        scrollView.restartEditView()
        dismiss(animated: true, completion: nil)
    }

}
