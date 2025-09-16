//
//  ViewController.swift
//  iOS26-UIColorWell
//
//  Created by 杨帆 on 2025/09/16  18:49.
//

import UIKit

class ViewController: UIViewController {
    lazy var colorWell: UIColorWell = {
        let colorWell = UIColorWell()
        colorWell.title = "设置背景色"
        // iOS26新增
        colorWell.maximumLinearExposure = 2.0
        // iOS26新增
        colorWell.supportsEyedropper = false
        colorWell.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        colorWell.sizeToFit()
        colorWell.center = view.center
        return colorWell
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(colorWell)
    }

    @objc func valueChanged(_ sender: UIColor) {
        view.backgroundColor = colorWell.selectedColor
    }
}
