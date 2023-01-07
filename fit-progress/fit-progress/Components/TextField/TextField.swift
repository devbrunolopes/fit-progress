//
//  TextField.swift
//  fit-progress
//
//  Created by Bruno Lopes on 07/01/23.
//

import UIKit

class TextField: UITextField {
    
    init(placeholderText: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        autocorrectionType = .no
        backgroundColor = .white
        borderStyle = .roundedRect
        layer.cornerRadius = 7
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1.0
        textColor = .darkGray
        placeholder = placeholderText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
