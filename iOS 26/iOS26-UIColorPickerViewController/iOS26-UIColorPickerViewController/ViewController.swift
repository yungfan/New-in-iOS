//
//  ViewController.swift
//  iOS26-UIColorPickerViewController
//
//  Created by 杨帆 on 2025/09/16  18:51.
//

import UIKit

class ViewController: UIViewController {
    lazy var colorPickerViewController: UIColorPickerViewController = {
        var colorPickerViewController = UIColorPickerViewController()
        colorPickerViewController.title = "颜色选择器"
        colorPickerViewController.delegate = self
        // iOS26新增
        colorPickerViewController.maximumLinearExposure = 2.0
        // iOS26新增
        colorPickerViewController.supportsEyedropper = false
        return colorPickerViewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        present(colorPickerViewController, animated: true, completion: nil)
    }
}

extension ViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        view.backgroundColor = color
    }
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        dismiss(animated: true, completion: nil)
    }
}
