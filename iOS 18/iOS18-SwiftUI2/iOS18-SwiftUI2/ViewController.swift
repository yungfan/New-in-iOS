//
//  ViewController.swift
//  iOS18-SwiftUI2
//
//  Created by 杨帆 on 2024/9/29.
//

import SwiftUI
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // 添加SwiftUI中的View并添加手势
        let swiftUIView = ContentView()
        let hostingController = UIHostingController(rootView: swiftUIView)
        addChild(hostingController)
        hostingController.view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        hostingController.view.center = view.center
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        tapGestureRecognizer.delegate = self
        hostingController.view.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc func tap() {
        print("UIKit UITapGestureRecognizer")
    }
}

// MARK: - UIGestureRecognizerDelegate
extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return otherGestureRecognizer.name == "tap" // 通过name引用SwiftUI中的手势
    }
}

// MARK: - SwiftUI
struct ContentView: View {
    var tapGesture: some Gesture {
        TapGesture()
            .onEnded { _ in
                print("SwiftUI TapGesture")
            }
    }

    var body: some View {
        Circle()
            .fill(Color.red)
            .frame(width: 100, height: 100)
            .gesture(tapGesture, name: "tap") // iOS18新增，通过name标识该手势
    }
}
