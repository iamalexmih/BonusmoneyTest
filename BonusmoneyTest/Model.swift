//
//  Model.swift
//  BonusmoneyTest
//
//  Created by Алексей Попроцкий on 10.05.2023.
//

import Foundation


struct Company: Codable {
    let company: CompanyId
}



struct CompanyId: Codable {
    let companyId: String
}
