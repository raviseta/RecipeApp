//
//  AppEnvironment.swift
//  ReceipeApp
//
//  Created by Ravi Seta on 24/01/25.
//

import Foundation

enum Environment {
    case production
}

class AppEnvironment {
    static let shared = AppEnvironment()
    var environmentType: Environment = .production
}
