//
//  ViewController.swift
//  iOS26-Menu Bar
//
//  Created by 杨帆 on 2025/6/30.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setupMenuBar()
    }

    // MARK: 配置MenuBar
    func setupMenuBar() {
        let config = UIMainMenuSystem.Configuration()
        let menuSystem = UIMainMenuSystem.shared
        // 自定义菜单
        menuSystem.setBuildConfiguration(config) { builder in
            // UIKeyCommand
            let refreshCommand = UIKeyCommand(input: "R", modifierFlags: [.command], action: #selector(self.refreshContent))
            refreshCommand.title = "Refresh"
            refreshCommand.image = UIImage(systemName: "arrow.clockwise")
            builder.insertElements([refreshCommand], beforeMenu: .about)
            // UIMenu
            let sortMenu = UIMenu(title: "Sort", children: [
                UICommand(title: "By Name", action: #selector(self.sortByName)),
                UICommand(title: "By Kind", action: #selector(self.sortByKind)),
                UICommand(title: "By Size", action: #selector(self.sortBySize)),
                UICommand(title: "By Date", action: #selector(self.sortByDate))
            ])
            builder.insertSibling(sortMenu, afterMenu: .help)
        }
    }

    @objc func refreshContent() {
        view.backgroundColor = .systemRed
    }

    @objc func sortByName() {
        view.backgroundColor = .systemGreen
    }

    @objc func sortByKind() {
        view.backgroundColor = .systemBlue
    }

    @objc func sortBySize() {
        view.backgroundColor = .systemOrange
    }

    @objc func sortByDate() {
        view.backgroundColor = .systemGray
    }
}
