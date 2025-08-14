//
//  ViewController.swift
//  iOS26-UIButton2
//
//  Created by 杨帆 on 2025/08/14  14:34.
//

import UIKit

class ViewController: UIViewController {
    let button = UIButton(frame: CGRect(x: 100, y: 200, width: 200, height: 200))

    override func viewDidLoad() {
        super.viewDidLoad()

        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "heart.circle")
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 50, weight: .thin)
        // iOS26新增
        config.symbolContentTransition = UISymbolContentTransition(.replace, options: .speed(0.1))
        button.configuration = config
        button.isSymbolAnimationEnabled = true
        button.tintColor = .systemRed
        view.addSubview(button)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        button.configuration?.image = UIImage(systemName: "heart.circle.fill")
    }
}
