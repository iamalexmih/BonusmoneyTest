//
//  ViewController.swift
//  MoneyTest
//
//  Created by Алексей Попроцкий on 08.05.2023.
//

import UIKit

class ViewController: UIViewController {

    let networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        
        networkService.request(offset: 0) { data, error in
            if let error = error {
                print("Error received request data: ", error.localizedDescription)
            }
            print(data)
        }
        
    }


}

