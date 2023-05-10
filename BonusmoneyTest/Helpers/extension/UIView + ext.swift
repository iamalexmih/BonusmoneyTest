//
//  UIView + ext.swift
//  BonusmoneyTest
//
//  Created by Алексей Попроцкий on 10.05.2023.
//

import UIKit

extension UIView {
    func addSubviewAndTamic(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}


