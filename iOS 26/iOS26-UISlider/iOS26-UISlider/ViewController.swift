//
//  ViewController.swift
//  iOS26-UISlider
//
//  Created by 杨帆 on 2025/09/15  07:14.
//

import UIKit

class ViewController: UIViewController {
    lazy var basicTickSlider: UISlider = {
        let slider = UISlider()
        slider.value = 0.5
        slider.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        // iOS26新增
        slider.sliderStyle = .default
        // iOS26新增，刻度数量
        var config = UISlider.TrackConfiguration(numberOfTicks: 10)
        config.allowsTickValuesOnly = true
        slider.trackConfiguration = config
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    lazy var customTickSlider: UISlider = {
        let slider = UISlider()
        slider.value = 0.5
        slider.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        slider.sliderStyle = .thumbless
        // iOS26新增，自定义刻度
        let customTicks = [
            UISlider.TrackConfiguration.Tick(position: 0),
            UISlider.TrackConfiguration.Tick(position: 0.1),
            UISlider.TrackConfiguration.Tick(position: 0.3),
            UISlider.TrackConfiguration.Tick(position: 0.6),
            UISlider.TrackConfiguration.Tick(position: 1.0)
        ]
        let config = UISlider.TrackConfiguration(allowsTickValuesOnly: true, ticks: customTicks)
        slider.trackConfiguration = config
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(basicTickSlider)
        view.addSubview(customTickSlider)

        NSLayoutConstraint.activate([
            basicTickSlider.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            basicTickSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            basicTickSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            basicTickSlider.heightAnchor.constraint(equalToConstant: 44),
            customTickSlider.topAnchor.constraint(equalTo: basicTickSlider.bottomAnchor, constant: 40),
            customTickSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            customTickSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    // MARK: 滑块内容变化事件
    @objc func valueChanged(_ sender: Any) {
        print(#function)
    }
}
