//
//  CompanyCell.swift
//  BonusmoneyTest
//
//  Created by Алексей Попроцкий on 10.05.2023.
//

import UIKit


class CompanyCell: UITableViewCell {
    
    static let cellId = "CompanyCell"
    
    private let cardView = UIView()
    private let topView = TopView()
    private let dividerTop = DividerView()
    private let middleView = MiddleView()
    private let dividerBottom = DividerView()
    private let bottomView = BottomView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubView()
        configureContainerView()
        setConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension CompanyCell {
    private func addSubView() {
        contentView.addSubviewAndTamic(cardView)
        cardView.addSubviewAndTamic(topView)
        cardView.addSubviewAndTamic(dividerTop)
        cardView.addSubviewAndTamic(middleView)
        cardView.addSubviewAndTamic(dividerBottom)
        cardView.addSubviewAndTamic(bottomView)
    }
    
    
    private func configureContainerView() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        selectionStyle = .none
        cardView.backgroundColor = UIColor(named: Const.cardBackgroundColor)
        cardView.layer.cornerRadius = 30
    }
}



// MARK: - Set Constraints

extension CompanyCell {
    
    private func setConstraints() {
        setConstraintsCardView()
        setConstraintsTopView()
        addTopDivider()
        setConstraintsMiddleView()
        addBottomDivider()
        setConstraintsBottomView()
    }
    
    
    private func setConstraintsCardView() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Const.paddingM),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.paddingM),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Const.paddingM),
            cardView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.92)
        ])
    }
    
    
    private func setConstraintsTopView() {
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: Const.paddingM),
            topView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: Const.paddingM),
            topView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -Const.paddingM),
            topView.heightAnchor.constraint(equalToConstant: 40),
            topView.bottomAnchor.constraint(equalTo: dividerTop.topAnchor, constant: -Const.paddingS)
        ])
    }
    
    
    private func addTopDivider() {
        NSLayoutConstraint.activate([
            dividerTop.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: Const.paddingM),
            dividerTop.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -Const.paddingM),
            dividerTop.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    
    private func setConstraintsMiddleView() {
        NSLayoutConstraint.activate([
            middleView.topAnchor.constraint(equalTo: dividerTop.bottomAnchor, constant: Const.paddingM),
            middleView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: Const.paddingM),
            middleView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -Const.paddingM)
        ])
    }
    
    
    private func addBottomDivider() {
        NSLayoutConstraint.activate([
            dividerBottom.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: Const.paddingM),
            dividerBottom.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -Const.paddingM),
            dividerBottom.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    
    private func setConstraintsBottomView() {
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: dividerBottom.bottomAnchor, constant: Const.paddingS),
            bottomView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: Const.paddingM * 2),
            bottomView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -Const.paddingM),
            bottomView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -Const.paddingM)
        ])
    }
}
