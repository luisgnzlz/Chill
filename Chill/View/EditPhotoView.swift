//
//  EditPhotoView.swift
//  Chill
//
//  Created by Luis Gonzalez on 6/28/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit

class EditPhotoView: UIView {
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        setupEditView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupEditView() {
        addSubview(EditImageView)
  
        EditImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        EditImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        EditImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        EditImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
    }
    
}
