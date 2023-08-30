//
//  ViewController.swift
//  iOS17-TipKit
//
//  Created by 杨帆 on 2023/8/30.
//

import TipKit
import UIKit

// MARK: - 自定义Tip
struct SearchTip: Tip {
    // 标题
    var title: Text {
        Text("搜索提示")
    }

    // 消息
    var message: Text? {
        Text("点击这里可以进行搜索")
    }

    // 图片
    var asset: Image? {
        Image(systemName: "globe")
    }

    // 按钮
    var actions: [Action] {
        [
            Action(id: "id_more", title: "更多") {
                print("点击更多")
            },
            Action(id: "id_dismiss", title: "关闭"),
            // Action(id: "id_dismiss", title: "关闭", disabled: true)
        ]
    }

    // 显示规则
    // 1. 基于参数规则
    @Parameter
    static var showTip: Bool = false
    // 2. 基于事件规则
    static let appOpenedCount = Event(id: "appOpenedCount")
    var rules: [Rule] {
        [
            #Rule(Self.$showTip) { $0 == true }, // showTip为true
            #Rule(Self.appOpenedCount) { $0.donations.count >= 3 } // 打开超过3次
        ]
    }

    // 选项
    var options: [TipOption] {
        [
            Tip.IgnoresDisplayFrequency(true), // 忽略显示频率限制即立即显示
            Tip.MaxDisplayCount(3) // 最大显示次数
        ]
    }
}

// MARK: - 自定义Tip
struct OperationTip: Tip {
    var title: Text {
        Text("操作提示")
            .foregroundStyle(.red)
            .font(.title2)
            .fontDesign(.serif)
            .bold()
    }

    var message: Text? {
        Text("通过触摸屏幕显示TipKit")
            .foregroundStyle(.white)
            .font(.title3)
            .fontDesign(.monospaced)
    }

    var asset: Image? {
        Image(systemName: "info.bubble")
    }
}

// MARK: - UIViewController
class ViewController: UIViewController {
    lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        button.setTitle("显示Tip", for: .normal)
        button.center = view.center
        button.addTarget(self, action: #selector(showTip), for: .touchUpInside)
        return button
    }()
    // TipUIPopoverViewController
    var tipUIPopoverViewController: TipUIPopoverViewController?
    // TipUIView
    lazy var tipUIView: TipUIView = {
        let tipUIView = TipUIView(operationTip, arrowEdge: .bottom)
        tipUIView.backgroundColor = .black
        tipUIView.tintColor = .red
        tipUIView.cornerRadius = 6.0
        tipUIView.imageSize = CGSize(width: 40, height: 40)
        tipUIView.translatesAutoresizingMaskIntoConstraints = false
        return tipUIView
    }()

    // Tip
    var searchTip = SearchTip()
    var operationTip = OperationTip()
    var searchTipObservationTask: Task<Void, Never>?
    var operationTipObservationTask: Task<Void, Never>?

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        view.backgroundColor = .systemTeal
        view.addSubview(button)

        Task {
            await SearchTip.appOpenedCount.donate()
        }
    }

    @objc func showTip() {
        SearchTip.showTip = true

        // 显隐TipUIPopoverViewController
        searchTipObservationTask = searchTipObservationTask ?? Task { @MainActor in
            for await shouldDisplay in searchTip.shouldDisplayUpdates {
                if shouldDisplay {
                    tipUIPopoverViewController = TipUIPopoverViewController(searchTip, sourceItem: button)
                    present(tipUIPopoverViewController!, animated: true)
                } else {
                    tipUIPopoverViewController?.dismiss(animated: true, completion: nil)
                }
            }
        }
        // 显隐TipUIView
        operationTipObservationTask = operationTipObservationTask ?? Task { @MainActor in
            for await shouldDisplay in operationTip.shouldDisplayUpdates {
                if shouldDisplay {
                    view.addSubview(tipUIView)
                    NSLayoutConstraint.activate([
                        tipUIView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
                        tipUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0),
                        tipUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0)
                    ])
                } else {
                    tipUIView.removeFromSuperview()
                }
            }
        }
    }
}
