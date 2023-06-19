//
//  ViewController.swift
//  iOS17-SwiftData
//
//  Created by 杨帆 on 2023/6/19.
//

import UIKit

class ViewController: UIViewController {
    var dataTools = DataTools.shared
    var users = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func insertData(_ sender: Any) {
        let user1 = User(name: "张三", company: Company(id: "1", name: "百度", address: "中国北京"))
        let user2 = User(name: "李四", company: Company(id: "2", name: "阿里巴巴", address: "浙江杭州"))
        let user3 = User(name: "王五", company: Company(id: "3", name: "腾讯", address: "广东深圳"))
        dataTools.insert(user: user1)
        dataTools.insert(user: user2)
        dataTools.insert(user: user3)
    }

    @IBAction func deleteData(_ sender: Any) {
        if let user = users.last {
            dataTools.delete(user: user)
        }
    }

    @IBAction func updateData(_ sender: Any) {
        if let user = users.first {
            dataTools.update(user: user, newCompanyName: "美团", newCompanyAddress: "中国北京")
        }
    }

    @IBAction func selectData(_ sender: Any) {
        dataTools.select { data, error in
            if let error {
                print(error)
            }
            if let data {
                self.users = data
                print(self.users)
            }
        }
    }
}
