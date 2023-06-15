//
//  ViewController.swift
//  iOS17-UIButton
//
//  Created by 杨帆 on 2023/6/15.
//

import UIKit

class ViewController: UIViewController {
    lazy var button1: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 0, width: 100, height: 60))
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        // iOS17新增，开启Symbol Animations
        button.isSymbolAnimationEnabled = true
        return button
    }()
    lazy var button2: UIButton = {
        let actionHandler = UIAction { _ in
        }
        actionHandler.image = UIImage(systemName: "plus")
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 60), primaryAction: actionHandler)
        button.isSymbolAnimationEnabled = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(button1)
        view.addSubview(button2)
    }
}

#Preview {
    ViewController()
}
