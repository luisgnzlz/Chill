//
//  filterButtons.swift
//  Chill
//
//  Created by Luis Gonzalez on 7/30/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit

class filterButtons: UIButton {
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        layer.cornerRadius = 6
        clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
