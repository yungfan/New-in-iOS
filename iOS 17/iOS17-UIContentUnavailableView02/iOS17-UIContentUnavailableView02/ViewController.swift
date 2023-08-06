//
//  ViewController.swift
//  iOS17-UIContentUnavailableView02
//
//  Created by 杨帆 on 2023/8/6.
//

import UIKit

class ViewController: UIViewController {
    // UIContentUnavailableConfiguration
    lazy var emptyConfig: UIContentUnavailableConfiguration = {
        var config = UIContentUnavailableConfiguration.empty()
        config.text = "暂无数据"
        config.image = UIImage(systemName: "exclamationmark.triangle")
        return config
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        contentUnavailableConfiguration = emptyConfig
    }

    override func updateContentUnavailableConfiguration(using state: UIContentUnavailableConfigurationState) {
        // 切换
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let loadingConfig = UIContentUnavailableConfiguration.loading()
            self.contentUnavailableConfiguration = loadingConfig
        }
        // 移除
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            self.contentUnavailableConfiguration = nil
            self.view.backgroundColor = .systemTeal
        }
    }
}
