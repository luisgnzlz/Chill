//
//  addChillView.swift
//  Chill
//
//  Created by Luis Gonzalez on 6/22/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit

let addTextField: UITextField = {
    let textField = UITextField()
    textField.font = UIFont.boldSystemFont(ofSize: 20)
    textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
    textField.leftViewMode = UITextField.ViewMode.always
    textField.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    textField.keyboardType = .alphabet
    textField.placeholder = "Enter a discription (Optional)"
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
}()

let submitButton: UIButton = {
    let button = UIButton()
    button.setTitle("Enter", for: .normal)
    button.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
    button.setTitleColor(.white, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
}()

class addChillView: UIView {
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = .white
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        addSubview(addTextField)
        addSubview(submitButton)
        
        submitButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        submitButton.topAnchor.constraint(equalTo: addTextField.bottomAnchor, constant: 50).isActive = true
        submitButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        addTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        addTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        addTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 1/3).isActive = true
        addTextField.heightAnchor.constraint(equalToConstant: addTextField.frame.height + 50).isActive = true
    }
    
}
