//
//  addChillView.swift
//  Chill
//
//  Created by Luis Gonzalez on 6/21/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit

let chillLabel: UILabel = {
    let label = UILabel()
    label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
    label.lineBreakMode = NSLineBreakMode.byWordWrapping
    label.numberOfLines = 3
    label.font = UIFont.boldSystemFont(ofSize: 20)
    label.textAlignment = .center
    label.backgroundColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0.6)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
}()

let picture: UIImageView = {
    let picView = UIImageView()
    picView.contentMode = UIView.ContentMode.scaleAspectFill
    picView.translatesAutoresizingMaskIntoConstraints = false
    return picView
}()

class LookChillView: UIView {
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
            addSubview(picture)
            addSubview(chillLabel)
        
            picture.safeAreaLayoutGuide.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
            picture.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            picture.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
            picture.safeAreaLayoutGuide.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
        
            chillLabel.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
            chillLabel.safeAreaLayoutGuide.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
            chillLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
            chillLabel.safeAreaLayoutGuide.topAnchor.constraint(equalTo: picture.bottomAnchor).isActive = true
        
        }
    
    
}
