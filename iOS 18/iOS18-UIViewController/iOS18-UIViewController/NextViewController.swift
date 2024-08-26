//
//  NextViewController.swift
//  iOS18-UIViewController
//
//  Created by 杨帆 on 2024/8/26.
//

import UIKit

class NextViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true)
    }
}
