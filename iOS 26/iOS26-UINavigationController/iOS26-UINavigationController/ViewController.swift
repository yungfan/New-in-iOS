//
//  ViewController.swift
//  iOS26-UINavigationController
//
//  Created by 杨帆 on 2025/7/5.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        // iOS26新增
        navigationItem.largeTitle = "导航"
        navigationItem.largeSubtitle = "子标题"

        let barButtonItemOne = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleEvent))
        let barButtonItemTwo = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(handleEvent))
        let barButtonItemThree = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(handleEvent))
        let barButtonItemFour = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(handleEvent))
        // iOS26新增
        barButtonItemOne.badge = .count(10)
        // iOS26新增
        barButtonItemFour.style = .prominent
        // iOS26新增
        let fixedSpace = UIBarButtonItem.fixedSpace(20)
        let flexibleSpace = UIBarButtonItem.flexibleSpace()
        navigationItem.rightBarButtonItems = [barButtonItemOne]
        navigationController?.isToolbarHidden = false
        toolbarItems = [barButtonItemTwo, fixedSpace, barButtonItemThree, flexibleSpace, barButtonItemFour]
    }

    @objc func handleEvent(_ sender: UIBarButtonItem) {
        view.backgroundColor = .init(red: .random(in: 0 ... 1),
                                     green: .random(in: 0 ... 1),
                                     blue: .random(in: 0 ... 1),
                                     alpha: 1.0)
    }
}
