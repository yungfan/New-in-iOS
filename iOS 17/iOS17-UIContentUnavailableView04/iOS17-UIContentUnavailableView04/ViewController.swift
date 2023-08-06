//
//  ViewController.swift
//  iOS17-UIContentUnavailableView04
//
//  Created by 杨帆 on 2023/8/6.
//

import SwiftUI
import UIKit

class ViewController: UIViewController {
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
        // 使用SwiftUI
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let loadingConfig = UIHostingConfiguration {
                VStack(spacing: 20) {
                    ProgressView()

                    Text("正在加载数据...")
                        .foregroundStyle(.secondary)
                }
            }
            self.contentUnavailableConfiguration = loadingConfig
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            self.contentUnavailableConfiguration = nil
            self.view.backgroundColor = .systemTeal
        }
    }
}
