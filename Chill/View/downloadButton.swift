//
//  downloadButton.swift
//  Chill
//
//  Created by Luis Gonzalez on 7/29/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit

class downloadButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitle("Download", for: .normal)
        setTitleColor(.gray, for: .normal)
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
        layer.cornerRadius = 5
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
