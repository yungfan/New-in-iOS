//
//  ViewController.swift
//  iOS17-UITraitChangeObservable
//
//  Created by 杨帆 on 2023/11/1.
//

import UIKit

// MARK: - 自定义支持深色模式的UIColor
extension UIColor {
    static var viewBackgroundColor: UIColor {
        .init { (trait: UITraitCollection) -> UIColor in
            if trait.userInterfaceStyle == .dark {
                return .white
            }
            return .black
        }
    }

    static var viewControllerBackgroundColor: UIColor {
        .init { (trait: UITraitCollection) -> UIColor in
            if trait.userInterfaceStyle == .dark {
                return .red
            }
            return .green
        }
    }
}

// MARK: - 自定义支持深色模式的UIView
class CustomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        print(#function)
        // Target-Action方式注册Trait Changes
        registerForTraitChanges([UITraitUserInterfaceStyle.self], action: #selector(configureView))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: iOS17废弃
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {}

    @objc
    private func configureView() {
        backgroundColor = .viewBackgroundColor
    }
}

class ViewController: UIViewController {
    lazy var customView: CustomView = {
        let customView = CustomView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        customView.center = view.center
        customView.backgroundColor = .viewBackgroundColor
        return customView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .viewControllerBackgroundColor
        view.addSubview(customView)
        // 闭包方式注册Trait Changes
        registerForTraitChanges([UITraitUserInterfaceStyle.self]) { (self: Self, _: UITraitCollection) in
            self.view.backgroundColor = .viewControllerBackgroundColor
        }
    }

    // MARK: iOS17废弃
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {}
}
