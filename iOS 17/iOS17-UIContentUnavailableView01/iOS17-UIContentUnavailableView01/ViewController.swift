//
//  ViewController.swift
//  iOS17-UIContentUnavailableView01
//
//  Created by 杨帆 on 2023/8/6.
//

import UIKit

class ViewController: UIViewController {
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "abc")
        return tableView
    }()
    // UIContentUnavailableView
    lazy var unavailableView: UIContentUnavailableView = {
        // UIContentUnavailableConfiguration
        var config = UIContentUnavailableConfiguration.empty()
        config.text = "暂无数据"
        config.textProperties.color = .red
        config.secondaryText = "正在加载数据..."
        config.image = UIImage(systemName: "exclamationmark.triangle")
        config.imageProperties.tintColor = .red
        config.imageToTextPadding = 10.0
        config.textToSecondaryTextPadding = 5.0
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.title = "加载数据"
        config.button = buttonConfig
        config.buttonProperties.primaryAction = UIAction(title: "") { _ in
            self.loadData()
        }
        config.buttonToSecondaryButtonPadding = 0
        var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
        backgroundConfig.backgroundColor = .systemGray6
        config.background = backgroundConfig
        // 根据UIContentUnavailableConfiguration创建UIContentUnavailableView
        let unavailableView = UIContentUnavailableView(configuration: config)
        unavailableView.frame = UIScreen.main.bounds
        return unavailableView
    }()
    var content: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        if content.isEmpty {
            view.addSubview(unavailableView)
        }
    }

    func loadData() {
        content = ["iPhone 12 mini", "iPhone 12", "iPhone 12 Pro", "iPhone 12 Pro Max",
                   "iPhone 13 mini", "iPhone 13", "iPhone 13 Pro", "iPhone 13 Pro Max",
                   "iPhone 14", "iPhone 14 Plus", "iPhone 14 Pro", "iPhone 14 Pro Max"]
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.tableView.reloadData()
            self.unavailableView.removeFromSuperview()
        }
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "abc", for: indexPath)
        cell.textLabel?.text = content[indexPath.row]
        cell.imageView?.image = UIImage(systemName: "iphone")
        return cell
    }
}


