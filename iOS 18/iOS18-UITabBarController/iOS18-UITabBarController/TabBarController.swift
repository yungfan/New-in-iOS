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
        tabs.append(configTab(ViewController(), title: "微信", imageName: "message", identifier: "chats", badgeValue: "3"))
        tabs.append(configTab(UIViewController(), title: "通讯录", imageName: "person.2", identifier: "contacts"))
        tabs.append(configTab(UIViewController(), title: "发现", imageName: "safari", identifier: "discover"))
        tabs.append(configTab(UIViewController(), title: "我", imageName: "person", identifier: "me"))
        tabs.append(configTabGroup(UIViewController(), title: "更多", imageName: "ellipsis", identifier: "more"))
        tabs.append(configSearchTab(UIViewController(), title: "搜索"))
        // 选中的UITab
        selectedTab = tabs.last
    }

    // MARK: 设置UITab
    func configTab(_ viewController: UIViewController,
                   title: String,
                   imageName: String,
                   identifier: String,
                   badgeValue: String? = nil) -> UITab {
        // UITab
        let tab = UITab(title: title, image: UIImage(systemName: imageName), identifier: identifier) { tab in
            // 角标
            tab.badgeValue = badgeValue
            // 关联对象
            tab.userInfo = identifier
            viewController.view.backgroundColor = .init(red: .random(in: 0 ... 1), green: .random(in: 0 ... 1), blue: .random(in: 0 ... 1), alpha: 1.0)
            // 返回显示的UIViewController
            return self.configViewController(viewController: viewController, title: title)
        }
        // UITab内容的显示方式，如只在sidebar模式下才显示
        tab.preferredPlacement = .default
        // siderBar模式下，允许编辑隐藏
        tab.allowsHiding = true
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
        // 可以添加多个UITab，siderBar模式下肯定会显示，tabBar模式下根据UITab的preferredPlacement取值决定
        tabGroup.children.append(configTab(UIViewController(), title: "设置", imageName: "gear", identifier: "setting"))
        tabGroup.children.append(configTab(UIViewController(), title: "关于", imageName: "info", identifier: "about"))
        // UITabGroup内容在siderBar模式下的显示样式
        tabGroup.sidebarAppearance = .rootSection
        // 以下内容只在rootSection样式下才会生效
        // UITabGroup内容的显示方式，如可以移动
        tabGroup.preferredPlacement = .movable
        // 允许内容重组
        tabGroup.allowsReordering = true
        // 给siderBar添加Action
        let refreshAction = UIAction(title: "刷新", image: UIImage(systemName: "arrow.clockwise")) { _ in
            print(#function)
        }
        tabGroup.sidebarActions = [refreshAction]
        return tabGroup
    }

    // MARK: 设置UISearchTab
    func configSearchTab(_ viewController: UIViewController, title: String) -> UISearchTab {
        // UISearchTab
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

    // MARK: siderBar模式下开始编辑，tabBar模式下无法编辑
    func tabBarControllerWillBeginEditing(_ tabBarController: UITabBarController) {
        print(#function)
    }

    // MARK: siderBar模式下结束编辑
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
