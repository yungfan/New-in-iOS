//
//  DataTools.swift
//  iOS17-SwiftData
//
//  Created by 杨帆 on 2023/6/19.
//

import Foundation
import SwiftData

// 3，4，5
class DataTools {
    static var shared = DataTools()
    var container: ModelContainer?
    var context: ModelContext?

    init() {
        do {
            container = try ModelContainer(for: User.self)
            if let container {
                context = ModelContext(container)
            }
        } catch {
            print(error)
        }
    }

    // MARK: 增加
    func insert(user: User) {
        context?.insert(user)
    }

    // MARK: 删除
    func delete(user: User) {
        context?.delete(user)
    }

    // MARK: 修改
    func update(user: User, newCompanyName: String, newCompanyAddress: String) {
        user.company.name = newCompanyName
        user.company.address = newCompanyAddress
    }

    // MARK: 查询
    func select(completionHandler: @escaping ([User]?, Error?) -> Void) {
        let descriptor = FetchDescriptor<User>(sortBy: [SortDescriptor<User>(\.name)])
        do {
            let data = try context?.fetch(descriptor)
            completionHandler(data, nil)
        } catch {
            completionHandler(nil, error)
        }
    }

    // 保存
    func save() {
        do {
            try context?.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
