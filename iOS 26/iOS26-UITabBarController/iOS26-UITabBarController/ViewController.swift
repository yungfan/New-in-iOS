//
//  ViewController.swift
//  iOS26-UITabBarController
//
//  Created by 杨帆 on 2025/7/11.
//

import UIKit

// MARK: - 自定义UITabBarController
class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        tabs.append(configTab(UIViewController(), title: "微信", imageName: "message", identifier: "chats", badgeValue: "3"))
        tabs.append(configTab(UIViewController(), title: "通讯录", imageName: "person.2", identifier: "contacts"))
        tabs.append(configTab(UIViewController(), title: "发现", imageName: "safari", identifier: "discover"))
        tabs.append(configTab(UIViewController(), title: "我", imageName: "person", identifier: "me"))
        tabs.append(configSearchTab(UIViewController(), title: "搜索"))
        selectedTab = tabs.last
        // iOS26新增，向下滚动时，只显示第一个与UISearchTab的图标，中间显示辅助UITabAccessory
        self.tabBarMinimizeBehavior = .onScrollDown
        // iOS26新增
        self.bottomAccessory = UITabAccessory(contentView: UIToolbar())
    }

    // MARK: 设置UITab
    func configTab(_ viewController: UIViewController,
                   title: String,
                   imageName: String,
                   identifier: String,
                   badgeValue: String? = nil) -> UITab {
        let tab = UITab(title: title, image: UIImage(systemName: imageName), identifier: identifier) { tab in
            tab.badgeValue = badgeValue
            tab.userInfo = identifier
            let scrollView = UIScrollView(frame: UIScreen.main.bounds)
            scrollView.backgroundColor = .init(red: .random(in: 0 ... 1), green: .random(in: 0 ... 1), blue: .random(in: 0 ... 1), alpha: 1.0)
            scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1500)
            viewController.view.addSubview(scrollView)
            return self.configViewController(viewController: viewController, title: title)
        }
        return tab
    }

    // MARK: 设置UISearchTab
    func configSearchTab(_ viewController: UIViewController, title: String) -> UISearchTab {
        // UISearchTab，从TabBar分离出来单独显示
        let searchTab = UISearchTab { tab in
            viewController.view.backgroundColor = .init(red: .random(in: 0 ... 1), green: .random(in: 0 ... 1), blue: .random(in: 0 ... 1), alpha: 1.0)
            return self.configViewController(viewController: viewController, title: title)
        }
        return searchTab
    }

    // MARK: 设置UIViewController
    func configViewController(viewController: UIViewController, title: String) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.navigationItem.title = title
        return navigationController
    }
}


