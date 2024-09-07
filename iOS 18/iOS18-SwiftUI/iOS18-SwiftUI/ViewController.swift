//
//  ViewController.swift
//  iOS18-SwiftUI
//
//  Created by 杨帆 on 2024/9/7.
//

import SwiftUI
import UIKit

class ViewController: UIViewController {
    lazy var redView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 50, width: 100, height: 100))
        view.backgroundColor = .red
        return view
    }()
    lazy var greenView: UIView = {
        let view = UIView(frame: CGRect(x: 120, y: 50, width: 100, height: 100))
        view.backgroundColor = .green
        return view
    }()
    lazy var blueView: UIView = {
        let view = UIView(frame: CGRect(x: 240, y: 50, width: 100, height: 100))
        view.backgroundColor = .blue
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(blueView)
        view.addSubview(greenView)
        view.addSubview(redView)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        animate()
    }
}

extension ViewController {
    // MARK: UIView动画
    func animate() {
        // 使用SwiftUI动画
        // 第1个
        UIView.animate(SwiftUI.Animation.linear(duration: 1.0)) {
            self.redView.center.y = 300
        }
        // 第2个
        UIView.animate(SwiftUI.Animation.easeInOut(duration: 1.0).delay(1.5).speed(2)) {
            self.greenView.center.y = 300
        }
        // 第3个
        UIView.animate(Animation.spring(duration: 2.0, bounce: 0.7, blendDuration: 0)) {
            self.blueView.center.y = 300
        }
    }
}

