//
//  cancelButton.swift
//  Chill
//
//  Created by Luis Gonzalez on 6/28/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit

class cancelButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitle("X", for: .normal)
        setTitleColor(.black, for: .normal)
        backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
        layer.cornerRadius = 50
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
