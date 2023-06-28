//
//  ViewController.swift
//  iOS17-Spring Animation
//
//  Created by 杨帆 on 2023/6/28.
//

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
    func animate() {
        // 3个不同参数的弹簧动画对比
        UIView.animate(springDuration: 1.5, bounce: 0) {
            self.redView.center.y = 300
        }
        UIView.animate(springDuration: 1.5, bounce: 0.5, initialSpringVelocity: 5) {
            self.greenView.center.y = 300
        }
        UIView.animate(springDuration: 1.5,
                       bounce: 0.9,
                       initialSpringVelocity: 10,
                       delay: 0,
                       options: .curveLinear,
                       animations: {
                           self.blueView.center.y = 300
                       }, completion: nil)
    }
}

#Preview {
    ViewController()
}

