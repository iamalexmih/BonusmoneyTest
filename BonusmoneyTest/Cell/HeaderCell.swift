//
//  HeaderCell.swift
//  BonusmoneyTest
//
//  Created by Алексей Попроцкий on 10.05.2023.
//

import UIKit


class HeaderCell: UITableViewHeaderFooterView {
    
    static let headerCellId = "HeaderCell"
    let title = UILabel()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    
    func configure() {
        contentView.addSubview(title)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .systemFont(ofSize: Const.fontSizeLarge, weight: .bold)
        title.textColor = UIColor(named: Const.colorBlue)
        title.text = "Управление картами"
        
        title.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        title.heightAnchor.constraint(equalToConstant: 20).isActive = true
        title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
