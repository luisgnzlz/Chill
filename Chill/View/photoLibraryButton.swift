//
//  photoLibraryButton.swift
//  Chill
//
//  Created by Luis Gonzalez on 7/24/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit

class photoLibraryButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitle("Photo Library", for: .normal)
        setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.6), for: .normal)
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        titleLabel?.numberOfLines = 2
        layer.cornerRadius = 5
        titleLabel?.textAlignment = .center
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
