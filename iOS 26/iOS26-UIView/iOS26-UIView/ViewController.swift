//
//  ViewController.swift
//  iOS26-UIView
//
//  Created by 杨帆 on 2025/7/24.
//

import UIKit

class ViewController: UIViewController {
    lazy var redView: UIView = {
        let view = UIView(frame: CGRect(x: 150, y: 100, width: 100, height: 200))
        view.backgroundColor = .systemRed
        // iOS26新增
        view.cornerConfiguration = .capsule()
        return view
    }()

    lazy var greenView: UIView = {
        let view = UIView(frame: CGRect(x: 150, y: 340, width: 100, height: 100))
        // iOS26新增
        view.cornerConfiguration = .uniformCorners(radius: 10)
        view.backgroundColor = .systemGreen
        return view
    }()

    lazy var blueView: UIView = {
        let view = UIView(frame: CGRect(x: 150, y: 480, width: 100, height: 100))
        view.backgroundColor = .systemBlue
        // iOS26新增
        view.cornerConfiguration = .corners(topLeftRadius: 10, topRightRadius: 20, bottomLeftRadius: 30, bottomRightRadius: 40)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(redView)
        view.addSubview(greenView)
        view.addSubview(blueView)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 2.0) {
            self.redView.cornerConfiguration = .corners(radius: 10)
        } completion: { _ in
            UIView.animate(withDuration: 2.0) {
                self.greenView.cornerConfiguration = .uniformBottomRadius(50)
            } completion: { _ in
                UIView.animate(withDuration: 2.0) {
                    self.blueView.cornerConfiguration = .uniformEdges(leftRadius: 50, rightRadius: 50)
                }
            }
        }
    }
}


