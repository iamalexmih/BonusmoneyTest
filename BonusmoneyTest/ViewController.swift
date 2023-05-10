//
//  ViewController.swift
//  MoneyTest
//
//  Created by Алексей Попроцкий on 08.05.2023.
//

import UIKit


class ViewController: UIViewController {

    let listData = Bundle.main.decode([Company].self, from: "mocData.json")
    let networkService = NetworkService()
    
    let tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        
//        networkService.request(offset: 0) { data, error in
//            if let error = error {
//                print("Error received request data: ", error.localizedDescription)
//            }
//            print(data)
//        }
        print(listData.count)
    }
    
    private func tableViewConfig() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HeaderCell.self,
                           forHeaderFooterViewReuseIdentifier: HeaderCell.headerCellId)
    }
}


// MARK: - TableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    
}
