//
//  ViewController.swift
//  iOS16-Others
//
//  Created by 杨帆 on 2022/8/28.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // 新的获取UIScreen尺寸的方法
        if let screen = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.screen {
            print(screen)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 新的通知设置URL Scheme
        let urlString = UIApplication.openNotificationSettingsURLString
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
