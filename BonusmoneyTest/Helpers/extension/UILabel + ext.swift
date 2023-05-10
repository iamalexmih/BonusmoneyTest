//
//  UILabel + ext.swift
//  BonusmoneyTest
//
//  Created by Алексей Попроцкий on 10.05.2023.
//

import UIKit

enum TextSize {
    case s
    case m
    case l
}

enum TextColor {
    case black
    case darkGray
    case main
}

extension UILabel {
    
    func setText(title: String, size: TextSize, color: TextColor) {
        text = title
        
        switch size {
        case .s:
            font = .systemFont(ofSize: Const.fontSizeS)
        case .m:
            font = .systemFont(ofSize: Const.fontSizeM)
        case .l:
            font = .systemFont(ofSize: Const.fontSizeL)
        }
        
        switch color {
        case .black:
            textColor = UIColor(named: Const.colorBlack)
        case .darkGray:
            textColor = UIColor(named: Const.colorDarkGrey)
        case .main:
            textColor = UIColor(named: Const.mainColor)
        }
    }
}


