//
//  ViewController.swift
//  iOS26-AppIcon
//
//  Created by 杨帆 on 2025/08/24  11:48.
//

import UIKit

enum AppIcon: String, CaseIterable {
    case defaultIcon
    case redIcon
    case greenIcon
    case blueIcon

    // icon文件的名称
    var iconName: String? {
        switch self {
        case .defaultIcon:
            return nil // 默认图标
        case .redIcon:
            return "RedIcon" // 第1个icon
        case .greenIcon:
            return "GreenIcon" // 第2个icon
        case .blueIcon:
            return "BlueIcon" // 第3个icon
        }
    }
}

class ViewController: UIViewController {
    lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: AppIcon.allCases.map { $0.rawValue })
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        return segmentedControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(segmentedControl)
        
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            segmentedControl.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20)
        ])
    }

    @objc func valueChanged(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        let selectedIcon = AppIcon.allCases[selectedIndex]
        if UIApplication.shared.supportsAlternateIcons {
            UIApplication.shared.setAlternateIconName(selectedIcon.iconName) { error in
                if error != nil {
                    print(error?.localizedDescription)
                } else {
                    print("切换App图标成功")
                }
            }
        } else {
            print("不支持切换App图标")
        }
    }
}
