//
//  ViewController.swift
//  iOS26-动画
//
//  Created by 杨帆 on 2025/7/13.
//

import UIKit

@Observable class Model {
    var backgroundColor: UIColor = .systemGray
}

class ViewController: UIViewController {
    lazy var redView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 50, width: 100, height: 100))
        view.backgroundColor = .systemRed
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var widthConstraint: NSLayoutConstraint!
    var heightConstraint: NSLayoutConstraint!
    let model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(redView)

        widthConstraint = redView.widthAnchor.constraint(equalToConstant: 100)
        heightConstraint = redView.heightAnchor.constraint(equalToConstant: 100)
        widthConstraint.isActive = true
        heightConstraint.isActive = true
        redView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        redView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.backgroundColor = model.backgroundColor
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // UIView动画
        UIView.animate(withDuration: 2.0, delay: 0, options: .flushUpdates) {
            self.model.backgroundColor = .systemBlue
        } completion: { _ in
            // UIViewPropertyAnimator动画
            _ = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 2.0,
                                                               delay: 0,
                                                               options: .flushUpdates) {
                self.widthConstraint.constant = 300
                self.heightConstraint.constant = 300
            } completion: { _ in
                print("动画完成")
            }
        }
    }
}


