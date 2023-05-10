//
//  TopView.swift
//  BonusmoneyTest
//
//  Created by Алексей Попроцкий on 10.05.2023.
//

import UIKit


final class TopView: UIView {
    
    private let title = UILabel()
    private let imageCard = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureView() {
        addSubviewAndTamic(title)
        addSubviewAndTamic(imageCard)
        
        configureTitle()
        configureImageCard()
    }
    
    
    private func configureTitle() {
        title.setText(title: "Bonus Money", size: .l, color: .black)
        
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    
    private func configureImageCard() {
        imageCard.image = UIImage(named: Const.imageCard)
        imageCard.contentMode = .scaleAspectFit
        imageCard.layer.cornerRadius = 20
        imageCard.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            imageCard.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageCard.heightAnchor.constraint(equalToConstant: 40),
            imageCard.widthAnchor.constraint(equalToConstant: 40),
        ])
    }
}
