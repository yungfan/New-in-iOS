//
//  ViewController.swift
//  iOS17-UIContentUnavailableView03
//
//  Created by 杨帆 on 2023/8/6.
//

import UIKit

class ViewController: UIViewController {
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "abc")
        tableView.dataSource = self
        tableView.rowHeight = 60.0
        return tableView
    }()

    lazy var schoolSearchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.searchBar.searchBarStyle = .minimal
        controller.searchBar.sizeToFit()
        controller.searchResultsUpdater = self
        controller.searchBar.delegate = self
        return controller
    }()

    let schoolArray = ["清华大学", "北京大学", "中国人民大学", "北京交通大学", "北京工业大学",
                       "北京航空航天大学", "北京理工大学", "北京科技大学", "中国政法大学",
                       "中央财经大学", "华北电力大学", "北京体育大学", "上海外国语大学", "复旦大学",
                       "华东师范大学", "上海交通大学", "同济大学", "上海财经大学", "华东理工大学"]
    var searchArray: [String] = [] {
        didSet {
            tableView.reloadData()
            setNeedsUpdateContentUnavailableConfiguration()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.tableHeaderView = schoolSearchController.searchBar
    }

    override func updateContentUnavailableConfiguration(using state: UIContentUnavailableConfigurationState) {
        // 更新UISearchController的contentUnavailableConfiguration
        let config: UIContentUnavailableConfiguration? = searchArray.isEmpty ? .search() : nil
        schoolSearchController.contentUnavailableConfiguration = config
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if schoolSearchController.isActive {
            return searchArray.count
        } else {
            return schoolArray.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "abc", for: indexPath)
        if schoolSearchController.isActive {
            cell.textLabel?.text = searchArray[indexPath.row]
            return cell
        } else {
            cell.textLabel?.text = schoolArray[indexPath.row]
            return cell
        }
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text {
            searchArray = schoolArray.filter { school -> Bool in
                school.contains(text)
            }
        }
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            searchArray = schoolArray.filter { school -> Bool in
                school.contains(text)
            }
        }
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchArray = schoolArray
    }
}
