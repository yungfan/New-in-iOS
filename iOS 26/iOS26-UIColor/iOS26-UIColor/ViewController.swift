//
//  ViewController.swift
//  iOS26-UIColor
//
//  Created by 杨帆 on 2025/09/16  18:35.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // iOS26新增
        let hdrColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0, exposure: 2.5)
        view.backgroundColor = hdrColor
    }
}
