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
    private let topView = UIView()
    private let middleView = UIView()
    
    private let title = UILabel()
    private let imageCard = UIImageView()
    
    private let dividerTop = UIView()
    
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
    
    private let dividerBottom = UIView()
   
    private let buttonsStackView = HorizontalStackView(distribution: .equalSpacing,
                                                       alignment: .center,
                                                       spacing: Const.paddingL)
    private let viewsButton = UIButton(type: .system)
    private let trashButton = UIButton(type: .system)
    private let moreButton = UIButton(type: .system)
    
    private let spacerView = UIView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        selectionStyle = .none
        addSubView()
        
        configureCardView()
        
        configureTopView()
        configureMiddleView()
        configureBottomView()
    }
    
    
    private func addSubView() {
        contentView.addSubviewAndTamic(cardView)
        
        cardView.addSubviewAndTamic(topView)
        topView.addSubviewAndTamic(title)
        topView.addSubviewAndTamic(imageCard)
        cardView.addSubviewAndTamic(dividerTop)
        
        cardView.addSubviewAndTamic(middleView)
        middleView.addSubviewAndTamic(pointStackView)
        middleView.addSubviewAndTamic(cashbackStackView)
        middleView.addSubviewAndTamic(levelStackView)
        
        cardView.addSubviewAndTamic(dividerBottom)
        cardView.addSubviewAndTamic(buttonsStackView)
    }
    
    
    private func configureCardView() {
        cardView.backgroundColor = UIColor(named: Const.cardBackgroundColor)
        cardView.layer.cornerRadius = 30
        
        NSLayoutConstraint.activate([
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.paddingM),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Const.paddingM),
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Const.paddingM),
            cardView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.92)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



// MARK: - configure Top View

extension CompanyCell {
    
    private func configureTopView() {
        setConstraintsTopStackView()
        configureTitle()
        configureImageCard()
        addTopDivider()
    }
    
    
    private func setConstraintsTopStackView() {
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: Const.paddingM),
            topView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: Const.paddingM),
            topView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -Const.paddingM),
            topView.heightAnchor.constraint(equalToConstant: 40),
            topView.bottomAnchor.constraint(equalTo: dividerTop.topAnchor, constant: -Const.paddingS)
        ])
    }
    
    
    private func configureTitle() {
        title.font = .systemFont(ofSize: Const.fontSizeL)
        title.textColor = UIColor(named: Const.colorBlack)
        title.text = "Bonus Money"
        
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            title.centerYAnchor.constraint(equalTo: topView.centerYAnchor)
        ])
    }
    
    
    private func configureImageCard() {
        imageCard.image = UIImage(named: Const.imageCard)
        imageCard.contentMode = .scaleAspectFit
        imageCard.layer.cornerRadius = 20
        imageCard.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            imageCard.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            imageCard.heightAnchor.constraint(equalToConstant: 40),
            imageCard.widthAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    
    private func addTopDivider() {
        dividerTop.backgroundColor = UIColor(named: Const.backgroundColor)
        
        NSLayoutConstraint.activate([
            dividerTop.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: Const.paddingM),
            dividerTop.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -Const.paddingM),
            dividerTop.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}



// MARK: - configure Middle View

extension CompanyCell {
    
    private func configureMiddleView() {
        setConstraintsMiddleStackView()
        configurePointView()
        configureCashbackView()
        configureLevelView()
    }
    
    
    private func setConstraintsMiddleStackView() {
        NSLayoutConstraint.activate([
            middleView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: Const.paddingM),
            middleView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -Const.paddingM),
            middleView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: Const.paddingM),
            middleView.bottomAnchor.constraint(equalTo: dividerTop.topAnchor, constant: -Const.paddingS)
        ])
    }
    
    
    private func configurePointView() {
        pointStackView.addArrangedSubview(point)
        pointStackView.addArrangedSubview(pointTitle)
        pointStackView.addArrangedSubview(spacerView)
        
        point.text = "200"
        point.font = .systemFont(ofSize: Const.fontSizeL)
        point.textColor = UIColor(named: Const.colorBlack)
        
        pointTitle.text = "баллов"
        pointTitle.font = .systemFont(ofSize: Const.fontSizeM)
        pointTitle.textColor = UIColor(named: Const.colorDarkGrey)
        
        NSLayoutConstraint.activate([
            pointStackView.leadingAnchor.constraint(equalTo: middleView.leadingAnchor),
            pointStackView.trailingAnchor.constraint(equalTo: middleView.trailingAnchor),
            pointStackView.topAnchor.constraint(equalTo: dividerTop.bottomAnchor, constant: Const.paddingM),
            pointStackView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    
    private func configureCashbackView() {
        cashbackStackView.addArrangedSubview(cashbackTitle)
        cashbackStackView.addArrangedSubview(cashback)
        
        cashback.text = "1 %"
        cashback.font = .systemFont(ofSize: Const.fontSizeM)
        cashback.textColor = UIColor(named: Const.colorBlack)
        
        cashbackTitle.text = "Кешбэк"
        cashbackTitle.font = .systemFont(ofSize: Const.fontSizeS)
        cashbackTitle.textColor = UIColor(named: Const.colorDarkGrey)
        
        NSLayoutConstraint.activate([
            cashbackStackView.topAnchor.constraint(equalTo: pointStackView.bottomAnchor,
                                                   constant: Const.paddingM),
            cashbackStackView.leadingAnchor.constraint(equalTo: middleView.leadingAnchor),
            cashbackStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    private func configureLevelView() {
        levelStackView.addArrangedSubview(levelTitle)
        levelStackView.addArrangedSubview(level)
        
        level.text = "Базовый уровень тест"
        level.font = .systemFont(ofSize: Const.fontSizeM)
        level.textColor = UIColor(named: Const.colorBlack)
        
        levelTitle.text = "Уровень"
        levelTitle.font = .systemFont(ofSize: Const.fontSizeS)
        levelTitle.textColor = UIColor(named: Const.colorDarkGrey)
        
        NSLayoutConstraint.activate([
            levelStackView.topAnchor.constraint(equalTo: pointStackView.bottomAnchor,
                                                constant: Const.paddingM),
            
            levelStackView.leadingAnchor.constraint(equalTo: cashbackStackView.trailingAnchor,
                                                    constant: Const.paddingL),
            
            levelStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}



// MARK: - configure Buttons View

extension CompanyCell {

    private func configureBottomView() {
        addBottomDivider()
        configureButtons()
        setConstraintsBottomView()
    }
    
    
    private func addBottomDivider() {
        dividerBottom.backgroundColor = UIColor(named: Const.backgroundColor)
        
        NSLayoutConstraint.activate([
            dividerBottom.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: Const.paddingM),
            dividerBottom.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -Const.paddingM),
            dividerBottom.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    
    private func configureButtons() {
        buttonsStackView.addArrangedSubview(viewsButton)
        buttonsStackView.addArrangedSubview(trashButton)
        buttonsStackView.addArrangedSubview(moreButton)
        
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
            
            buttonsStackView.topAnchor.constraint(equalTo: dividerBottom.bottomAnchor,
                                                  constant: Const.paddingS),
            
            buttonsStackView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor,
                                                      constant: Const.paddingM * 2),
            
            buttonsStackView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,
                                                       constant: -Const.paddingM),
            
            buttonsStackView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor,
                                                     constant: -Const.paddingM)
        ])
    }
}
