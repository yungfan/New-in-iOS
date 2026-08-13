//
//  BlackBackgroundTabBarController.swift
//  UITabBarControllerDemo
//
//  Created by 杨帆 on 2024/10/1.
//

import UIKit

// MARK: - 解决 iOS 18 UITabBarController 切换选中标签时屏幕闪烁的问题
class BlackBackgroundTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self

        // 1. 关闭半透明效果
        tabBar.isTranslucent = false
        // 2. 设置 tabBar 背景为黑色
        tabBar.backgroundColor = .black
        // 3. 设置 barStyle 为 black 以匹配深色背景
        tabBar.barStyle = .black
    }
}

extension BlackBackgroundTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // 在切换选中时再次确保样式正确，防止过渡动画期间背景露白
        tabBar.barStyle = .black
        tabBar.backgroundColor = .black
        tabBar.isTranslucent = false
    }
}
