//
//  DividerView.swift
//  BonusmoneyTest
//
//  Created by Алексей Попроцкий on 10.05.2023.
//

import UIKit

final class DividerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: Const.backgroundColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
