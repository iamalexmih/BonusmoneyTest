//
//  ViewController.swift
//  MoneyTest
//
//  Created by Алексей Попроцкий on 08.05.2023.
//

import UIKit


class ViewController: ParentViewController {
    
    //    private let listData = Bundle.main.decode([Company].self, from: "mocData.json")
    var viewModel: ViewModel!
    private let tableView = UITableView()
    
    
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
        
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}



// MARK: - TableView Delegate and DataSource

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
