//
//  ViewController.swift
//  iOS17-UIHoverStyle
//
//  Created by 杨帆 on 2023/8/25.
//

import UIKit

class ViewController: UIViewController {
    lazy var redView: UIView = {
        let view = UIView(frame: CGRect(x: 200, y: 200, width: 200, height: 200))
        view.backgroundColor = .red
        // iOS17新增
        let hoverStyle = UIHoverStyle(effect: .lift, shape: .capsule)
        view.hoverStyle = hoverStyle
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(redView)
    }
}

