//
//  ViewController.swift
//  iOS18-UITextView
//
//  Created by 杨帆 on 2024/8/17.
//

import UIKit

class ViewController: UIViewController {
    lazy var textView: UITextView = {
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
        textView.center = view.center
        textView.text = "WWDC24 上 Apple 发布了 iOS 18，推出了很多新的内容。在掌握了基于 iOS 17 开发的基础上，只要学习以下的新特性就能轻松过渡到 iOS 18。"
        textView.font = .systemFont(ofSize: 21)
        textView.borderStyle = .none
        // 开启富文本编辑
        textView.allowsEditingTextAttributes = true
        // iOS18新增，自定义Format选项
        textView.textFormattingConfiguration = .init(groups: [
            // 第1组
            .group([
                .component(.formattingStyles, .automatic),
                .component(.fontAttributes, .small),
                .component(.fontPicker, .regular),
                .component(.fontSize, .small),
                .component(.fontPointSize, .mini)
            ]),
            // 第2组
            .group([
                .component(.textAlignment, .mini),
                .component(.textAlignmentAndJustification, .mini),
                .component(.textIndentation, .mini),
                .component(.lineHeight, .mini),
                .component(.listStyles, .regular)

            ]),
            // 第3组
            .group([
                .component(.textColor, .extraLarge),
                .component(.highlight, .mini),
                .component(.highlightPicker, .large)
            ])
        ])
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(textView)
    }
}


