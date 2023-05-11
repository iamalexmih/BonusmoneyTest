//
//  ParentViewController.swift
//  BonusmoneyTest
//
//  Created by Алексей Попроцкий on 11.05.2023.
//

import UIKit

class ParentViewController: UIViewController {
    let topView = UIView()
    let titleLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTitle()
    }
    
    
    func showErrorAlert(_ error: ApiError?) {
        guard let error = error else { return }
        let message = "\(error.description). \(Const.Alert.restart)"
        let action = UIAlertAction(title: Const.Alert.actionTitle,
                                   style: .default,
                                   handler: restart)
        let alertLogOut = UIAlertController(title: Const.Alert.messageTitle,
                                            message: message,
                                            preferredStyle: .alert)
        alertLogOut.addAction(action)
        present(alertLogOut, animated: true)
    }
    
    @objc func restart(action: UIAlertAction) { }
    
    
    private func configTitle() {
        view.addSubviewAndTamic(topView)
        topView.addSubviewAndTamic(titleLabel)
        topView.backgroundColor = UIColor(named: Const.cardBackgroundColor)
        
        titleLabel.setText(title: "Управление картами", size: .l, color: .main)
        titleLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: Const.fontSizeM * 2.5),
            titleLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            
            topView.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Const.fontSizeM)
        ])
    }
}
