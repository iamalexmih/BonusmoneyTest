//
//  ViewModel.swift
//  BonusmoneyTest
//
//  Created by Алексей Попроцкий on 11.05.2023.
//

import Foundation


protocol ViewModelProtocol {
    
}


class ViewModel {
    var listCompany: [Company] = []
    var offset: Int = 1
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
            case .success(let listCompany):
                print(listCompany)
                self.listCompany.append(contentsOf: listCompany)
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
    
    
//    func isLoadMoreData(_ indexPath: IndexPath) -> Bool {
//        currentPages <= totalPages && indexPath.row == listLaunches.count - 1
//    }
}
