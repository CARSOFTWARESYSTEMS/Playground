//
//  UserModel.swift
//  MyAppPlayground
//
//  Created by CAR Software Systems on 15/11/24.
//

import Foundation
import SwiftData

@Model
final class UserModel : Identifiable {
     
    var username: String
    var password: String
    
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    init() {
        self.username = ""
        self.password = ""
    }
    
    
}

