//
//  BottomView.swift
//  BonusmoneyTest
//
//  Created by Алексей Попроцкий on 10.05.2023.
//

import UIKit


final class BottomView: UIView {
    
    private let buttonsStackView = HorizontalStackView(distribution: .equalSpacing,
                                                       alignment: .center,
                                                       spacing: Const.paddingL)
    let viewsButton = UIButton(type: .system)
    let trashButton = UIButton(type: .system)
    let moreButton = UIButton(type: .system)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureView() {
        addSubviewAndTamic(buttonsStackView)
        buttonsStackView.addArrangedSubview(viewsButton)
        buttonsStackView.addArrangedSubview(trashButton)
        buttonsStackView.addArrangedSubview(moreButton)
        
        configureButtons()
        setConstraintsBottomView()
    }
    
    
    private func configureButtons() {
        viewsButton.setImage(UIImage(named: Const.imageEye), for: .normal)
        viewsButton.tintColor = UIColor(named: Const.mainColor)
        
        trashButton.setImage(UIImage(named: Const.imageTrash), for: .normal)
        trashButton.tintColor = UIColor(named: Const.accentColor)
        
        moreButton.setTitle("Подробнее", for: .normal)
        moreButton.titleLabel?.font = .systemFont(ofSize: Const.fontSizeM)
        moreButton.backgroundColor = UIColor(named: Const.backgroundColor)
        moreButton.tintColor = UIColor(named: Const.mainColor)
        moreButton.layer.cornerRadius = 12
    }
    
    
    private func setConstraintsBottomView() {
        NSLayoutConstraint.activate([
            viewsButton.heightAnchor.constraint(equalToConstant: 22),
            viewsButton.widthAnchor.constraint(equalToConstant: 22),
            
            trashButton.heightAnchor.constraint(equalToConstant: 22),
            trashButton.widthAnchor.constraint(equalToConstant: 22),
            
            moreButton.heightAnchor.constraint(equalToConstant: 44),
            moreButton.widthAnchor.constraint(equalToConstant: 150),
            
            buttonsStackView.topAnchor.constraint(equalTo: topAnchor),
            buttonsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttonsStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
