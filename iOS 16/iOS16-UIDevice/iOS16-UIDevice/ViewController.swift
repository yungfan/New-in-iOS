//
//  ViewController.swift
//  iOS16-UIDevice
//
//  Created by 杨帆 on 2022/8/26.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let name = UIDevice.current.name
        // iOS16之后：iPhone 13 Pro Max，不再包含用户信息
        print(name)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        // 旋转屏幕
        windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .landscapeLeft))
    }

    // MARK: 屏幕旋转通知在iOS16中无法触发，但会触发下列方法
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        // 处理旋转时的逻辑
        print(#function)
    }
}
