//
//  ViewController.swift
//  iOS18-UIUpdateLink
//
//  Created by 杨帆 on 2024/8/2.
//

import UIKit

class ViewController: UIViewController {
    lazy var redView: UIView = {
        let redView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        redView.backgroundColor = .red
        redView.alpha = 0
        redView.center = view.center
        return redView
    }()
    // UIUpdateLink
    var updateLink: UIUpdateLink!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(redView)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        updateLink = UIUpdateLink(view: redView)
        updateLink.addAction { link, info in
            let layer = self.redView.layer.presentation()
            print(layer?.opacity ?? 0)
        }
        updateLink.isEnabled = true
        updateLink.requiresContinuousUpdates = true

        UIView.animate(withDuration: 10) {
            self.redView.alpha = 1
        } completion: { _ in
            self.updateLink.isEnabled = false
        }
        
    }
}

#Preview {
    ViewController()
}
