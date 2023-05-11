//
//  ViewModel.swift
//  BonusmoneyTest
//
//  Created by Алексей Попроцкий on 11.05.2023.
//

import Foundation


protocol ViewModelProtocol {
    var listCompanies: [Company] { get }
    var offset: Int { get }
    var eventHandler: ((_ event: Event) -> Void)? { get set }
    
    init(networkService: NetworkServiceProtocol)
    func fetchCompany(_ offset: Int)
    func isLoadMoreData(_ indexPath: IndexPath) -> Bool
    func offsetPlusOne()
}


class ViewModel: ViewModelProtocol {
    var listCompanies: [Company] = []
    private var newCompanies: [Company] = []
    var offset: Int = 0
    var networkService: NetworkServiceProtocol
    var eventHandler: ((_ event: Event) -> Void)?
    
    required init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    
    func fetchCompany(_ offset: Int) {
        eventHandler?(.startLoading)
        networkService.request(offset: offset) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                print("listCompany: ", data)
                self.newCompanies = data
                self.listCompanies.append(contentsOf: data)
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
    
    
    func offsetPlusOne() {
        offset = offset + 1
    }
    
    
    func isLoadMoreData(_ indexPath: IndexPath) -> Bool {
        !newCompanies.isEmpty && indexPath.row == listCompanies.count - 1
    }
}
