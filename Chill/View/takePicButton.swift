//
//  takePicButton.swift
//  Chill
//
//  Created by Luis Gonzalez on 6/28/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit

class takePicButton: UIButton {
    override init(frame: CGRect) {
        super .init(frame: frame)

            backgroundColor = .white
            layer.cornerRadius = 25
            clipsToBounds = true
            translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
