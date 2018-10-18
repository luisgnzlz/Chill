//
//  discriptionTextView.swift
//  Chill
//
//  Created by Luis Gonzalez on 7/10/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit

class discriptionTextView: UITextField {
    override init(frame: CGRect) {
        super .init(frame: frame)

        textColor = .black
        textAlignment = .center
        keyboardAppearance = UIKeyboardAppearance.dark
        placeholder = "Add A Discription"
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
