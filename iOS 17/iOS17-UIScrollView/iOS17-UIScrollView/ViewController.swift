//
//  ViewController.swift
//  iOS17-UIScrollView
//
//  Created by 杨帆 on 2023/8/25.
//

import UIKit

class ViewController: UIViewController {
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0,
                                                    y: 0,
                                                    width: UIScreen.main.bounds.width,
                                                    height: UIScreen.main.bounds.width))
        scrollView.backgroundColor = .red
        scrollView.contentSize = CGSize(width: 2000, height: 2000)
        // iOS17新增，默认为true
        scrollView.isScrollEnabled = true
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)
    }
}
