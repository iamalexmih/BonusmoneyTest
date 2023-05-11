//
//  ViewController.swift
//  MoneyTest
//
//  Created by Алексей Попроцкий on 08.05.2023.
//

import UIKit


class ViewController: ParentViewController {
    
    var viewModel: ViewModelProtocol!
    private let tableView = UITableView()
    private lazy var footerView = FooterView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewConfig()
        
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
                footerView.showLoaderIndicate()
            case .dataLoaded:
                footerView.hideLoaderIndicate()
                self.tableView.reloadData()
            case .error(let error):
                self.showErrorAlert(error)
            }
        }
    }
    
    
    override func restart(action: UIAlertAction) {
        loadCompany(offset: viewModel.offset)
    }
}



// MARK: - TableView

extension ViewController {
    private func tableViewConfig() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CompanyCell.self, forCellReuseIdentifier: CompanyCell.cellId)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(named: Const.backgroundColor)
        tableView.separatorStyle = .none
        tableView.tableFooterView = footerView
        
        view.addSubviewAndTamic(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}



// MARK: - TableView Delegate and DataSource

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.listCompanies.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CompanyCell.cellId, for: indexPath) as! CompanyCell
        let idCompany = viewModel.listCompanies[indexPath.row].company.companyId
        cell.saveIdCompany(idCompany)
        cell.alertsDelegate = self
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 255
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if viewModel.isLoadMoreData(indexPath) {
            viewModel.offsetPlusOne()
            loadCompany(offset: viewModel.offset)
        }
    }
}



// MARK: - Alert Protocol

extension ViewController: AlertProtocol {
    func presentAlert(title: String, _ idCompany: String) {
        let action = UIAlertAction(title: Const.Alert.actionTitle,
                                   style: .default)
        let alertLogOut = UIAlertController(title: title,
                                            message: Const.Alert.idCompany + idCompany,
                                            preferredStyle: .alert)
        alertLogOut.addAction(action)
        present(alertLogOut, animated: true)
    } 
}
