//
//  ViewController.swift
//  iOS17-UIViewController
//
//  Created by 杨帆 on 2023/6/28.
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

    // MARK: view完成内存加载
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
    }

    // MARK: view即将显示
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }

    // MARK: view已经显示，iOS17新增
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)

        contentUnavailableConfiguration = emptyConfig
        // 切换UIContentUnavailableConfiguration
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let loadingConfig = UIContentUnavailableConfiguration.loading()
            self.contentUnavailableConfiguration = loadingConfig
        }
        // 移除UIContentUnavailableConfiguration
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            self.contentUnavailableConfiguration = nil
            self.view.backgroundColor = .systemTeal
        }

        print(#function)
    }

    // MARK: view即将布局子UIView
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(#function)
    }

    // MARK: view完成布局子UIView
    override func viewDidLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(#function)
    }

    // MARK: view完全显示
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }

    // MARK: view即将消失
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function)
    }

    // MARK: view彻底消失
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }
}

#Preview {
    ViewController()
}
