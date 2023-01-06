//
//  Viewcode.swift
//  fit-progress
//
//  Created by Bruno Lopes on 06/01/23.
//

import Foundation

protocol Viewcode {
    func setupViewcode()
    func addElements()
    func setupConstraints()
}

extension Viewcode {
    func setupViewcode() {
        addElements()
        setupConstraints()
    }
}
