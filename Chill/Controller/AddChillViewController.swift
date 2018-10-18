//
//  AddChillViewController.swift
//  Chill
//
//  Created by Luis Gonzalez on 6/22/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit

let addView = addChillView()
let layout = UICollectionViewFlowLayout()
var viewController = ViewController(collectionViewLayout: layout)

class AddChillViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    func setUpView() {
        view.addSubview(addView)
        addView.translatesAutoresizingMaskIntoConstraints = false
        
        navigationItem.title = "Add Chill"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButton))
        submitButton.addTarget(self, action: #selector(addChillMem), for: .touchUpInside)
        
        addView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        addView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        addView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        addView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    @objc func backButton() {
        addTextField.text = ""
        dismiss(animated: true, completion: nil)
    }
   
    /*
    @objc func addChillMem() {
        viewController.hi(input: addTextField.text!)
        addTextField.text = ""
        viewController.collectionView?.reloadData()
        dismiss(animated: true, completion: nil)
        print(info.init().testCount)
    }
    */
}
