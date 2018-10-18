//
//  deleteChillButton.swift
//  Chill
//
//  Created by Luis Gonzalez on 7/24/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit

class deleteChillButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitle("Delete", for: .normal)
        setTitleColor(.white, for: .normal)
        backgroundColor = .gray
        layer.cornerRadius = 5
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
