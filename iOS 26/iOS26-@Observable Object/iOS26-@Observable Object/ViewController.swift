//
//  ViewController.swift
//  iOS26-@Observable Object
//
//  Created by 杨帆 on 2025/6/30.
//

import UIKit

// MARK: - PhoneModel
@Observable class PhoneModel {
    var name: String
    var osName: String

    init(name: String, osName: String) {
        self.name = name
        self.osName = osName
    }

    static func getPhone() -> [PhoneModel] {
        let phoneNames = ["iPhone 16", "iPhone 16 Plus", "iPhone 16 Pro", "iPhone 16 Pro Max"]
        let osNames = ["iOS 18", "iOS 18", "iOS 18", "iOS 18"]
        var phoneModels = [PhoneModel]()
        for i in 0 ..< phoneNames.count {
            let phoneModel = PhoneModel(name: phoneNames[i], osName: osNames[i])
            phoneModels.append(phoneModel)
        }
        return phoneModels
    }
}

// MARK: - UITableViewCell
class CustomTableViewCell: UITableViewCell {
    lazy var phoneLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: UIScreen.main.bounds.midX - 180, y: 200, width: 360, height: 100))
        label.textColor = .white
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.textAlignment = .center
        return label
    }()

    lazy var osLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: UIScreen.main.bounds.midX - 75, y: 400, width: 150, height: 50))
        label.textColor = .white
        label.font = .systemFont(ofSize: 25)
        label.textAlignment = .center
        return label
    }()

    var phoneModel: PhoneModel?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(phoneLabel)
        contentView.addSubview(osLabel)
        contentView.backgroundColor = .black
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        // UI更新
        phoneLabel.text = phoneModel?.name
        osLabel.text = phoneModel?.osName
    }
}

// MARK: - UIViewController
class ViewController: UIViewController {
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        tableView.dataSource = self
        tableView.rowHeight = UIScreen.main.bounds.height
        tableView.isPagingEnabled = true
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "custom")
        return tableView
    }()

    let phoneModels = PhoneModel.getPhone()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let phoneModel = self.phoneModels[0]
            phoneModel.name = "iPhone 17"
            phoneModel.osName = "iOS 26"
        }
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phoneModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "custom", for: indexPath) as! CustomTableViewCell
        cell.phoneModel = phoneModels[indexPath.row]
        return cell
    }
}

