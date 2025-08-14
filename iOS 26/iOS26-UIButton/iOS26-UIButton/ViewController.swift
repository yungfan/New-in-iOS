//
//  ViewController.swift
//  iOS26-UIButton
//
//  Created by 杨帆 on 2025/08/14  14:33.
//

import UIKit

class ViewController: UIViewController {
    let configs: [UIButton.Configuration] = {
        [
            {
                // iOS26新增
                var config = UIButton.Configuration.glass()
                config.title = "喜欢"
                config.image = UIImage(systemName: "heart")
                return config
            }(),
            {
                // iOS26新增
                var config = UIButton.Configuration.clearGlass()
                config.title = "收藏"
                config.image = UIImage(systemName: "star")
                return config
            }(),
            {
                // iOS26新增
                var config = UIButton.Configuration.prominentGlass()
                config.title = "分享"
                config.image = UIImage(systemName: "square.and.arrow.up")
                return config
            }(),
            {
                // iOS26新增
                var config = UIButton.Configuration.prominentClearGlass()
                config.title = "下载"
                config.image = UIImage(systemName: "arrow.down.circle")
                return config
            }()
        ]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray

        for (index, config) in configs.enumerated() {
            let button = UIButton(frame: CGRect(x: 120, y: 220 + CGFloat(index) * 70, width: 160, height: 60))
            button.configuration = config
            view.addSubview(button)
        }
    }
}

