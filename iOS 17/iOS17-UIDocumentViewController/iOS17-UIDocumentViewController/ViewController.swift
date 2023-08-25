//
//  ViewController.swift
//  iOS17-UIDocumentViewController
//
//  Created by 杨帆 on 2023/8/25.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let documentViewController = CustomDocumentViewController()
        documentViewController.openDocument { _ in
            print("打开文档")
        }
        navigationController?.pushViewController(documentViewController, animated: true)
    }
}

class CustomDocumentViewController: UIDocumentViewController {
    override func documentDidOpen() {
        print(#function)
    }

    override func navigationItemDidUpdate() {
        navigationItem.title = "打开/关闭文档"
    }
}
