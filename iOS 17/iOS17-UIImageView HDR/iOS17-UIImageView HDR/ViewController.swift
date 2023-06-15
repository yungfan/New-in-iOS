//
//  ViewController.swift
//  iOS17-UIImageView HDR
//
//  Created by 杨帆 on 2023/6/15.
//

import UIKit

class ViewController: UIViewController {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "hdr.png"))
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.contentMode = .scaleAspectFit
        imageView.center = view.center
        // iOS17新增，支持HDR图片
        imageView.preferredImageDynamicRange = .constrainedHigh
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(imageView)
    }
}


#Preview {
    ViewController()
}
