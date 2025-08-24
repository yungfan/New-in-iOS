//
//  ViewController.swift
//  iOS26-UIViewController
//
//  Created by 杨帆 on 2025/08/24  11:49.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(barButtonItemClicked))
        navigationItem.rightBarButtonItem = barButtonItem
    }

    // MARK: 弹出UIBarButtonItem点击事件
    @objc func barButtonItemClicked(_ sender: Any) {
        let nextViewController = NextViewController()
        nextViewController.view.backgroundColor = .systemRed
        nextViewController.preferredTransition = .zoom { context in
            guard context.zoomedViewController is NextViewController else {
                fatalError("Unable to access the current UIViewController.")
            }
            // iOS26新增，返回触发的UIBarButtonItem
            return self.navigationItem.rightBarButtonItem
        }
        present(nextViewController, animated: true)
    }
}



class NextViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGreen
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true)
    }
}

