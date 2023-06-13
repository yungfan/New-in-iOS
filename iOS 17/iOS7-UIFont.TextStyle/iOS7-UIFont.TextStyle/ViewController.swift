//
//  ViewController.swift
//  iOS7-UIFont.TextStyle
//
//  Created by 杨帆 on 2023/6/13.
//

import UIKit

class ViewController: UIViewController {
    lazy var label1: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 100))
        label.text = "WWDC 23 推出了 Xcode 15，发布了 iOS 17。"
        label.numberOfLines = 0
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    lazy var label2: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: 100))
        label.text = "WWDC 23 推出了 Xcode 15，发布了 iOS 17。"
        label.numberOfLines = 0
        label.font = .preferredFont(forTextStyle: .extraLargeTitle2)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    lazy var label3: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 300, width: UIScreen.main.bounds.width, height: 150))
        label.text = "WWDC 23 推出了 Xcode 15，发布了 iOS 17。"
        label.numberOfLines = 0
        label.font = .preferredFont(forTextStyle: .extraLargeTitle)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
    }
}

#Preview {
    ViewController()
}

