//
//  TabBarController.swift
//  iOS18-UITabBarController
//
//  Created by 杨帆 on 2024/9/17.
//

import UIKit

// MARK: - 自定义UITabBarController
class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        tabs.append(configTab(UIViewController(), title: "微信", imageName: "message", identifier: "wechat", badgeValue: "3"))
        tabs.append(configTab(UIViewController(), title: "通讯录", imageName: "person.2", identifier: "contact"))
        tabs.append(configTab(UIViewController(), title: "发现", imageName: "safari", identifier: "discover"))
        tabs.append(configTab(UIViewController(), title: "我", imageName: "person", identifier: "me"))
        tabs.append(configTabGroup(UIViewController(), title: "更多", imageName: "ellipsis", identifier: "more"))
        // 选中的Tab
        selectedTab = tabs.last
    }

    // MARK: 设置Tab
    func configTab(_ viewController: UIViewController,
                   title: String,
                   imageName: String,
                   identifier: String,
                   badgeValue: String? = nil) -> UITab {
        // Tab
        let tab = UITab(title: title, image: UIImage(systemName: imageName), identifier: identifier) { tab in
            // 角标
            tab.badgeValue = badgeValue
            // 关联对象
            tab.userInfo = identifier
            viewController.view.backgroundColor = .init(red: .random(in: 0 ... 1), green: .random(in: 0 ... 1), blue: .random(in: 0 ... 1), alpha: 1.0)
            // 返回显示的UIViewController
            return self.configViewController(viewController: viewController, title: title)
        }
        // Tab内容的显示方式
        tab.preferredPlacement = .sidebarOnly
        return tab
    }

    // MARK: 设置UITabGroup
    func configTabGroup(_ viewController: UIViewController,
                        title: String,
                        imageName: String,
                        identifier: String,
                        badgeValue: String? = nil) -> UITabGroup {
        // UITabGroup
        let tabGroup = UITabGroup(title: title, image: UIImage(systemName: imageName), identifier: identifier) { _ in
            viewController.view.backgroundColor = .init(red: .random(in: 0 ... 1), green: .random(in: 0 ... 1), blue: .random(in: 0 ... 1), alpha: 1.0)
            // 返回显示的UIViewController
            return self.configViewController(viewController: viewController, title: title)
        }
        // 可以添加多个Tab，siderBar时肯定会显示，tabBar时根据Tab的preferredPlacement取值决定
        tabGroup.children.append(configTab(UIViewController(), title: "设置", imageName: "gear", identifier: "setting"))
        tabGroup.children.append(configTab(UIViewController(), title: "关于", imageName: "info", identifier: "about"))
        return tabGroup
    }

    // MARK: 设置UIViewController
    func configViewController(viewController: UIViewController, title: String) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.navigationItem.title = title
        return navigationController
    }
}

// MARK: - UITabBarControllerDelegate
extension TabBarController: UITabBarControllerDelegate {
    // MARK: Tab是否可以选中
    func tabBarController(_ tabBarController: UITabBarController, shouldSelectTab tab: UITab) -> Bool {
        return true
    }

    // MARK: 选中Tab
    func tabBarController(_ tabBarController: UITabBarController, didSelectTab selectedTab: UITab, previousTab: UITab?) {
        print(previousTab?.title ?? "", selectedTab.title)
    }

    // MARK: 开始编辑
    func tabBarControllerWillBeginEditing(_ tabBarController: UITabBarController) {
        print(#function)
    }

    // MARK: 结束编辑
    func tabBarControllerDidEndEditing(_ tabBarController: UITabBarController) {
        print(#function)
    }

    // MARK: UITabGroup中的顺序发生变化
    func tabBarController(_ tabBarController: UITabBarController, displayOrderDidChangeFor group: UITabGroup) {
        print(#function)
    }
}


#Preview {
    TabBarController()
}
