//
//  NetworkError.swift
//  ReminderApp
//
//  Created by Nikita Evdokimov on 12.03.2022.
//

import Foundation

enum NetworkError: Error {
    case failInternetError
    case noInternetConnection
}
