//
//  ViewController.swift
//  iOS18-UIViewController
//
//  Created by 杨帆 on 2024/8/26.
//

import UIKit

class ViewController: UIViewController {
    lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        button.setImage(UIImage(systemName: "cursorarrow.click.2"), for: .normal)
        button.center = view.center
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(button)
    }

    // MARK: 弹出按钮点击事件
    @objc func buttonClicked(_ sender: Any) {
        let nextViewController = NextViewController()
        // iOS18新增，zoom效果
        nextViewController.preferredTransition = .zoom { context in
            guard context.zoomedViewController is NextViewController else {
                fatalError("Unable to access the current UIViewController.")
            }
            // 返回触发的UIView
            return self.button
        }
        // coverVertical效果
        // nextViewController.preferredTransition = .coverVertical
        // flipHorizontal效果
        // nextViewController.preferredTransition = .flipHorizontal
        // crossDissolve效果
        // nextViewController.preferredTransition = .crossDissolve
        // partialCurl效果，必须全屏显示
        // nextViewController.modalPresentationStyle = .fullScreen
        // nextViewController.preferredTransition = .partialCurl
        
        // 模态方式
        present(nextViewController, animated: true)
    }
}





