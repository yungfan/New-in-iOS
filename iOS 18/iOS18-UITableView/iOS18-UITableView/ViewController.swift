//
//  ViewController.swift
//  iOS18-UITableView
//
//  Created by 杨帆 on 2024/9/27.
//

import UIKit

class ViewController: UIViewController {
    lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Plain", "Grouped"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentControlValueChanged), for: .valueChanged)
        return segmentedControl
    }()
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        tableView.dataSource = self
        return tableView
    }()
    let content = ["iPhone 4", "iPhone 4s", "iPhone 5", "iPhone 5s", "iPhone 6",
                   "iPhone 6 Plus", "iPhone 6s", "iPhone 6s Plus", "iPhone 7", "iPhone 7 Plus",
                   "iPhone 8", "iPhone 8 Plus", "iPhone X", "iPhone Xs", "iPhone XR",
                   "iPhone Xs Max", "iPhone 11", "iPhone 11 Pro", "iPhone 11 Pro Max",
                   "iPhone 12 mini", "iPhone 12", "iPhone 12 Pro", "iPhone 12 Pro Max",
                   "iPhone 13 mini", "iPhone 13", "iPhone 13 Pro", "iPhone 13 Pro Max",
                   "iPhone 14", "iPhone 14 Plus", "iPhone 14 Pro", "iPhone 14 Pro Max",
                   "iPhone 15", "iPhone 15 Plus", "iPhone 15 Pro", "iPhone 15 Pro Max",
                   "iPhone 16", "iPhone 16 Plus", "iPhone 16 Pro", "iPhone 16 Pro Max"]
    let detailContent = ["iPhone 4-iOS 4", "iPhone 4s-iOS 5", "iPhone 5-iOS 6", "iPhone 5s-iOS 7",
                         "iPhone 6-iOS 8", "iPhone 6 Plus-iOS 8", "iPhone 6s-iOS 9", "iPhone 6s Plus-iOS 9",
                         "iPhone 7-iOS 10", "iPhone 7 Plus-iOS 10", "iPhone 8-iOS 11", "iPhone 8 Plus-iOS 11",
                         "iPhone X-iOS 11", "iPhone Xs-iOS 12", "iPhone XR-iOS 12", "iPhone Xs Max-iOS 12",
                         "iPhone 11-iOS 13", "iPhone 11 Pro-iOS 13", "iPhone 11 Pro Max-iOS 13", "iPhone 12 mini-iOS 14",
                         "iPhone 12-iOS 14", "iPhone 12 Pro-iOS 14", "iPhone 12 Pro Max-iOS 14", "iPhone 13 mini-iOS 15",
                         "iPhone 13-iOS 15", "iPhone 13 Pro-iOS 15", "iPhone 13 Pro Max-iOS 15", "iPhone 14-iOS 16",
                         "iPhone 14 Plus-iOS 16", "iPhone 14 Pro-iOS 16", "iPhone 14 Pro Max-iOS 16",
                         "iPhone 15-iOS 17", "iPhone 15 Plus-iOS 17", "iPhone 15 Pro-iOS 17", "iPhone 15 Pro Max-iOS 17",
                         "iPhone 16-iOS 18", "iPhone 16 Plus-iOS 18", "iPhone 16 Pro-iOS 18", "iPhone 16 Pro Max-iOS 18"]

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.titleView = segmentedControl
        view.addSubview(tableView)
    }

    // MARK: UISegmentedControl的内容变化事件，选择了某个选项
    @objc func segmentControlValueChanged(_ sender: UISegmentedControl) {
        tableView.removeFromSuperview()
        if sender.selectedSegmentIndex == 0 {
            tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        } else {
            tableView = UITableView(frame: UIScreen.main.bounds, style: .grouped)
        }
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "abc") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "abc")
        // iOS18新增，通过UITraitCollection.listEnvironment设置单元格样式
        cell.backgroundColor = cell.contentView.traitCollection.listEnvironment == .plain ? .green : .orange
        cell.textLabel?.font = cell.textLabel?.traitCollection.listEnvironment == .plain ? .systemFont(ofSize: 25) : .systemFont(ofSize: 21)
        cell.detailTextLabel?.textColor = cell.traitCollection.listEnvironment == .plain ? .red : .cyan
        cell.textLabel?.text = cell.traitCollection.listEnvironment == .plain ? content[indexPath.row] : detailContent[indexPath.row]
        cell.detailTextLabel?.text = cell.traitCollection.listEnvironment == .plain ? detailContent[indexPath.row] : content[indexPath.row]
        cell.imageView?.image = cell.traitCollection.listEnvironment == .plain ? UIImage(systemName: "iphone") : UIImage(systemName: "ipad")
        cell.accessoryType = cell.traitCollection.listEnvironment == .plain ? .disclosureIndicator : .checkmark
        return cell
    }
}


