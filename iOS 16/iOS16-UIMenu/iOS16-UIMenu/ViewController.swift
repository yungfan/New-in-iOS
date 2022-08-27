//
//  ViewController.swift
//  iOS16-UIMenu
//
//  Created by 杨帆 on 2022/8/27.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        var config = UIButton.Configuration.filled()
        config.title = "显示菜单"
        config.baseForegroundColor = .white
        config.background.backgroundColor = .systemBlue
        config.background.cornerRadius = 10
        config.contentInsets = .init(top: 10, leading: 20, bottom: 10, trailing: 20)
        let button = UIButton(configuration: config)
        button.sizeToFit()
        button.center = view.center
        button.menu = createMenu()
        button.showsMenuAsPrimaryAction = true
        view.addSubview(button)
    }

    // MARK: 创建菜单
    func createMenu() -> UIMenu {
        let favorite = UIAction(title: "Favorite", image: UIImage(systemName: "heart.fill")) { _ in
            print("favorite")
        }
        let share = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up.fill")) { _ in
            print("share")
        }
        let delete = UIAction(title: "Delete",
                              image: UIImage(systemName: "trash.fill"),
                              attributes: [.destructive]) { _ in
            print("delete")
        }
        // UIMenu支持通过preferredElementSize属性设置显示的元素尺寸
        let menu = UIMenu(title: "", preferredElementSize: .small, children: [favorite, share, delete])
        return menu
    }
}
