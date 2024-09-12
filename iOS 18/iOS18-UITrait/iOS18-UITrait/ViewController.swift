//
//  ViewController.swift
//  iOS18-UITrait
//
//  Created by 杨帆 on 2024/9/12.
//

import UIKit

// MARK: - 自定义支持深色模式的UIView
class CustomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        // iOS18之后自动处理
        if traitCollection.userInterfaceStyle == .dark {
            backgroundColor = .red
        } else {
            backgroundColor = .green
        }
    }
}

class ViewController: UIViewController {
    lazy var customView: CustomView = {
        let customView = CustomView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        customView.center = view.center
        return customView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(customView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // iOS18之后自动处理
        if traitCollection.userInterfaceStyle == .dark {
            view.backgroundColor = .white
        } else {
            view.backgroundColor = .black
        }
    }
}

#Preview {
    ViewController()
}

