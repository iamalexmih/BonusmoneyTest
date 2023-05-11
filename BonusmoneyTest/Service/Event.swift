//
//  Event.swift
//  BonusmoneyTest
//
//  Created by Алексей Попроцкий on 11.05.2023.
//

import Foundation


enum Event {
    case startLoading
    case dataLoaded
    case error(ApiError?)
}
