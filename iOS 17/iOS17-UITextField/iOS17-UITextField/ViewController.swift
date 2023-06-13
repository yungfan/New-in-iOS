//
//  ViewController.swift
//  iOS17-UITextField
//
//  Created by 杨帆 on 2023/6/13.
//

import UIKit

class ViewController: UIViewController {
    lazy var birthdayTF: UITextField = {
        let textfield = UITextField(frame: CGRect(x: 100, y: 100, width: 200, height: 34))
        textfield.borderStyle = .roundedRect
        textfield.textContentType = .birthdate
        return textfield
    }()
    lazy var cardTF: UITextField = {
        let textfield = UITextField(frame: CGRect(x: 100, y: 150, width: 200, height: 34))
        textfield.borderStyle = .roundedRect
        textfield.textContentType = .creditCardNumber
        return textfield
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(birthdayTF)
        view.addSubview(cardTF)
    }
}

#Preview {
    ViewController()
}
