//
//  ViewController.swift
//  iOS17-Symbol Animations
//
//  Created by 杨帆 on 2023/6/15.
//

import UIKit

class ViewController: UIViewController {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "touchid"))
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.contentMode = .scaleAspectFit
        imageView.center = view.center
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(imageView)
        // 增加动画效果
        imageView.addSymbolEffect(.variableColor.reversing, options: .repeat(3), animated: true) { context in
            if context.isFinished {
                print("动画完成")
            }
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 移除动画效果
        imageView.removeSymbolEffect(ofType: .variableColor.reversing)
        // imageView.removeAllSymbolEffects()
    }
}

#Preview {
    ViewController()
}
