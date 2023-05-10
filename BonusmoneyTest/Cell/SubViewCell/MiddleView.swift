//
//  MiddleView.swift
//  BonusmoneyTest
//
//  Created by Алексей Попроцкий on 10.05.2023.
//

import UIKit


final class MiddleView: UIView {
    
    private let pointStackView = HorizontalStackView(distribution: .fill,
                                                     alignment: .bottom,
                                                     spacing: Const.paddingS)
    private let point = UILabel()
    private let pointTitle = UILabel()
    
    private let cashbackStackView = VerticalStackView()
    private let cashback = UILabel()
    private let cashbackTitle = UILabel()
    
    private let levelStackView = VerticalStackView()
    private let level = UILabel()
    private let levelTitle = UILabel()
    
    private let spacerView = UIView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureView() {
        addSubviewAndTamic(pointStackView)
        addSubviewAndTamic(cashbackStackView)
        addSubviewAndTamic(levelStackView)
        configurePointView()
        configureCashbackView()
        configureLevelView()
        setConstraints()
    }
    
    
    private func configurePointView() {
        pointStackView.addArrangedSubview(point)
        pointStackView.addArrangedSubview(pointTitle)
        pointStackView.addArrangedSubview(spacerView)
        
        point.setText(title: "200", size: .l, color: .black)
        pointTitle.setText(title: "баллов", size: .m, color: .darkGray)
    }
    
    
    private func configureCashbackView() {
        cashbackStackView.addArrangedSubview(cashbackTitle)
        cashbackStackView.addArrangedSubview(cashback)
        
        cashback.setText(title: "1 %", size: .m, color: .black)
        cashbackTitle.setText(title: "Кешбэк", size: .s, color: .darkGray)
    }
    
    
    private func configureLevelView() {
        levelStackView.addArrangedSubview(levelTitle)
        levelStackView.addArrangedSubview(level)
        
        level.setText(title: "Базовый уровень тест", size: .m, color: .black)
        levelTitle.setText(title: "Уровень", size: .s, color: .darkGray)
    }
    
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            pointStackView.topAnchor.constraint(equalTo: topAnchor),
            pointStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            pointStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            pointStackView.heightAnchor.constraint(equalToConstant: 20),
            
            cashbackStackView.topAnchor.constraint(equalTo: pointStackView.bottomAnchor, constant: Const.paddingM),
            cashbackStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            levelStackView.topAnchor.constraint(equalTo: pointStackView.bottomAnchor, constant: Const.paddingM),
            levelStackView.leadingAnchor.constraint(equalTo: cashbackStackView.trailingAnchor, constant: Const.paddingL)
        ])
    }
}
