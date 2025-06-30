//
//  ViewController.swift
//  iOS26-Update Properties
//
//  Created by 杨帆 on 2025/6/30.
//

import UIKit

@Observable class Model {
    var currentColor: UIColor = .systemGray
    var currentValue: String = "WWDC26"
}

class ViewController: UIViewController {
    lazy var label: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 300, height: 60)
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 64)
        label.center = view.center
        return label
    }()
    let model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(label)
    }

    override func updateProperties() {
        super.updateProperties()

        label.textColor = model.currentColor
        label.text = model.currentValue
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        model.currentColor = .systemBlue
        model.currentValue = "iOS26"
    }
}

