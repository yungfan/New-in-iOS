//
//  Model.swift
//  iOS17-SwiftData
//
//  Created by 杨帆 on 2023/6/19.
//

import Foundation
// 1
import SwiftData

// 2
@Model
class User: CustomStringConvertible {
    var id: UUID
    var name: String
    var company: Company

    init(name: String, company: Company) {
        id = UUID()
        self.name = name
        self.company = company
    }

    var description: String {
        return "\(name)——\(company.name)——\(company.address)"
    }
}

@Model
class Company {
    @Attribute(.unique)
    var id: String
    var name: String
    var address: String

    init(id: String, name: String, address: String) {
        self.id = id
        self.name = name
        self.address = address
    }
}
