//
//  ViewController.swift
//  iOS26-UIVisualEffectView
//
//  Created by 杨帆 on 2025/7/20.
//

import UIKit

class ViewController: UIViewController {
    lazy var wwdcLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        label.text = "WWDC25"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    lazy var iOSLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        label.text = "iOS26"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    let visualEffectView = UIVisualEffectView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemTeal

        // glassEffect()
        glassContainerEffect()
    }

    // MARK: UIGlassEffect
    func glassEffect() {
        // iOS26新增
        let glassEffect = UIGlassEffect()
        glassEffect.isInteractive = true
        visualEffectView.effect = glassEffect
        visualEffectView.frame = CGRect(x: view.frame.midX - 50, y: view.frame.midY - 25, width: 100, height: 50)
        visualEffectView.layer.cornerRadius = 20
        visualEffectView.clipsToBounds = true
        visualEffectView.contentView.addSubview(wwdcLabel)
        view.addSubview(visualEffectView)
    }

    // MARK: UIGlassContainerEffect
    func glassContainerEffect() {
        // iOS26新增
        let glassContainerEffect = UIGlassContainerEffect()
        visualEffectView.effect = glassContainerEffect
        visualEffectView.frame = CGRect(x: 0, y: 0, width: 210, height: 50)
        visualEffectView.center = view.center
        let glassEffect = UIGlassEffect()
        let view1 = UIVisualEffectView(effect: glassEffect)
        view1.frame = CGRect(x: 10, y: 10, width: 100, height: 50)
        view1.contentView.addSubview(wwdcLabel)
        let view2 = UIVisualEffectView(effect: glassEffect)
        view2.frame = CGRect(x: 110, y: 10, width: 100, height: 50)
        view2.contentView.addSubview(iOSLabel)
        visualEffectView.contentView.addSubview(view1)
        visualEffectView.contentView.addSubview(view2)
        view.addSubview(visualEffectView)
    }
}

