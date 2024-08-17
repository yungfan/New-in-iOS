//
//  ViewController.swift
//  iOS18-Symbol Animations
//
//  Created by 杨帆 on 2024/8/17.
//

import UIKit

class ViewController: UIViewController {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "heart.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal))
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        imageView.contentMode = .scaleAspectFit
        imageView.center = view.center
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(imageView)

        // iOS18新增
        // imageView.addSymbolEffect(.rotate, options: .repeat(.periodic(3, delay: 1)), animated: true) // periodic控制方式：重复执行3次，延迟1s
        // imageView.addSymbolEffect(.wiggle, options: .repeat(.continuous), animated: true)
        imageView.addSymbolEffect(.breathe, options: .repeat(.continuous), animated: true)
    }
}
