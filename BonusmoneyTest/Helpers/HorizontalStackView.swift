//
//  HorizontalStackView.swift
//  BonusmoneyTest
//
//  Created by Алексей Попроцкий on 10.05.2023.
//

import UIKit


class HorizontalStackView: UIStackView {
    
    init(distribution: UIStackView.Distribution,
         alignment: UIStackView.Alignment,
         spacing: CGFloat) {
        super.init(frame: .zero)
        
        axis = .horizontal
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

