//
//  ViewController.swift
//  MoneyTest
//
//  Created by Алексей Попроцкий on 08.05.2023.
//

import UIKit


class ViewController: UIViewController {

//    private let listData = Bundle.main.decode([Company].self, from: "mocData.json")
    var viewModel: ViewModel!
    
    private let tableView = UITableView()
    private let topView = UIView()
    private let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTitle()
        tableViewConfig()
        layoutTableView()
        
        observeEvent()
        loadCompany(offset: 0)
    }
    
    private func loadCompany(offset: Int) {
        viewModel.fetchCompany(offset)
    }
    
    private func observeEvent() {
        self.viewModel.eventHandler = { [weak self] event in
            guard let self = self else { return }
            switch event {
            case .startLoading:
//                self.startLoadingIndicator()
                print("startLoadingIndicator")
            case .dataLoaded:
//                self.stopLoadingIndicator()
                print("stopLoadingIndicator")
                self.tableView.reloadData()
            case .error(let error):
                self.showErrorAlert(error)
            }
        }
    }
    
    
    func showErrorAlert(_ error: ApiError?) {
        guard let error = error else { return }
        let message = "\(error.description). \(Const.Alert.restart)"
        let action = UIAlertAction(title: Const.Alert.actionTitle,
                                   style: .default)
        let alertLogOut = UIAlertController(title: Const.Alert.messageTitle,
                                            message: message,
                                            preferredStyle: .alert)
        alertLogOut.addAction(action)
        present(alertLogOut, animated: true)
    }
    
    
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
    
    private func tableViewConfig() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CompanyCell.self, forCellReuseIdentifier: CompanyCell.cellId)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(named: Const.backgroundColor)
        tableView.separatorStyle = .none
    }
    
    
    private func layoutTableView() {
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}


// MARK: - TableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.listCompany.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CompanyCell.cellId, for: indexPath) as! CompanyCell
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 255
    }
}
