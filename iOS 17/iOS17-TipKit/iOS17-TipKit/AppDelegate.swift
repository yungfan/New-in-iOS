//
//  AppDelegate.swift
//  iOS17-TipKit
//
//  Created by 杨帆 on 2023/8/30.
//

import UIKit
import TipKit

// MARK: - 初始化Tip System
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        try? Tips.configure([
            // 显示频率
            .displayFrequency(.daily),
            // 数据存储位置
            .datastoreLocation(.applicationDefault)
        ])
        return true
    }
}

