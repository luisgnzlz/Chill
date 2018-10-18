//
//  cameraItemsView.swift
//  Chill
//
//  Created by Luis Gonzalez on 6/28/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit

class cameraItemsView: UIView {
    
    let cameraButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
}
