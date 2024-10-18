//
//  ViewController.swift
//  iOS18-UITabBarController
//
//  Created by 杨帆 on 2024/9/17.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // iOS18新增，获取sidebar
        let sidebar = tabBarController?.sidebar
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        navigationController?.pushViewController(NextviewController(), animated: true)
    }
}



