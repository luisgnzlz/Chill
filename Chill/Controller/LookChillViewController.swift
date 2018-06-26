//
//  AddChillViewController.swift
//  Chill
//
//  Created by Luis Gonzalez on 6/21/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit
import AVFoundation

let addChill = LookChillView()

class LookChillViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.hidesBarsOnSwipe = true
        navigationController?.hidesBarsOnTap = true
        setupController()
    }

    func setupController() {
        view.addSubview(addChill)
        addChill.translatesAutoresizingMaskIntoConstraints = false
        
        navigationItem.title = "Calm Thing"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButton))
        
        addChill.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        addChill.safeAreaLayoutGuide.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        addChill.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        addChill.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    
    @objc func backButton() {
        dismiss(animated: true, completion: nil)
    }
    
}
