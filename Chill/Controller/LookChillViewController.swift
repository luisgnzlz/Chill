//
//  AddChillViewController.swift
//  Chill
//
//  Created by Luis Gonzalez on 6/21/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit
import AVFoundation
import MapKit

var lookScrollView = LookChillScrollView()

class LookChillViewController: UIViewController, UINavigationControllerDelegate {

    let sharedInstance = SSCache()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chillControl.delegate = self
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor(red: 0.343, green: 0.333, blue: 0.239, alpha: 1.00)]
        navigationController?.navigationBar.tintColor = UIColor.gray
        navigationController?.navigationBar.backgroundColor = .white
        view.backgroundColor = .white
        navigationController?.hidesBarsOnSwipe = true
        navigationController?.hidesBarsOnTap = true
        setupController()
        
        
    }

    func setupController() {
        navigationItem.title = "Calm Thing"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButton))
        
        view.addSubview(lookScrollView)
        lookScrollView.translatesAutoresizingMaskIntoConstraints = false
        downloadBtn.addTarget(self, action: #selector(downloadedPic), for: .touchUpInside)
        deletePhoto.addTarget(self, action: #selector(deleteChillPhoto), for: .touchUpInside)
        
        lookScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        lookScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        lookScrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        lookScrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    @objc func backButton() {
        lookScrollView.cancelTheLook()
        dismiss(animated: true, completion: nil)
        lookScrollView.cancelTheLook()
    }
    
    override var prefersStatusBarHidden: Bool {
        if navigationController?.isNavigationBarHidden == true {
        return true
    } else {
        return false
    }
    }
    
    @objc func deleteChillPhoto() {
        let alert = UIAlertController(title: "Delete Chll Moment", message: "Would You Like To Delete This Moment?", preferredStyle: .actionSheet)
        let successAlert = UIAlertController(title: "Success", message: "Moment Has Been Deleted", preferredStyle: .alert)
        successAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { action in
            self.dismiss(animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            info.init(delete: deleteNumber)
            self.sharedInstance.savePicture(image: UIImage(named: "white")!, key: "\(deleteNumber)")
            viewController.refreshTheData()
            self.present(successAlert, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @objc func downloadedPic() {
        let alert = UIAlertController(title: "Download Image", message: "Would You Like To Download This Image To Your Photo Library?", preferredStyle: .actionSheet)
        let successAlert = UIAlertController(title: "Success", message: "Image Saved In Your Photo Library", preferredStyle: .alert)
        successAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
    
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            UIImageWriteToSavedPhotosAlbum(picture.image!, nil, nil, nil)
            self.present(successAlert, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
