//
//  ViewController.swift
//  iOS17-UIPageControl
//
//  Created by 杨帆 on 2023/7/14.
//

import UIKit

class ViewController: UIViewController {
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: bannerW, height: bannerH))
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        bannerArray = (0 ... 5).map { index in
            let x = bannerW * CGFloat(index)
            let imageView = UIImageView(frame: CGRect(x: x, y: 0, width: bannerW, height: bannerH))
            imageView.image = UIImage(named: "\(index)")
            scrollView.addSubview(imageView)
        }
        scrollView.contentSize = CGSize(width: bannerW * CGFloat(bannerArray.count), height: 0)
        return scrollView
    }()

    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl(frame: CGRect(x: 0, y: 0, width: bannerH - 30.0, height: 16))
        pageControl.center = CGPoint(x: bannerW * 0.5, y: 240.0)
        pageControl.numberOfPages = bannerArray.count
        // 无限循环
        timerProgress.resetsToInitialPageAfterEnd = true
        // 切换时间，覆盖构造方法的值
        timerProgress.preferredDuration = 3.0
        // 自定义某一页的切换时间
        timerProgress.setDuration(1, forPage: 2)
        // 设置progress
        pageControl.progress = timerProgress
        // 启动定时器
        timerProgress.resumeTimer()
        pageControl.addTarget(self, action: #selector(pageChanged), for: .valueChanged)
        return pageControl
    }()

    // 创建UIPageControlTimerProgress
    let timerProgress = UIPageControlTimerProgress(preferredDuration: 1.5)
    let bannerW = UIScreen.main.bounds.width
    let bannerH: CGFloat = 260
    var bannerArray: [()] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)
        view.addSubview(pageControl)
    }

    @objc func pageChanged(_ sender: UIPageControl) {
        let contentOffsetX = bannerW * CGFloat(sender.currentPage)
        let contentOffset = CGPoint(x: contentOffsetX, y: 0)
        scrollView.setContentOffset(contentOffset, animated: true)
        // 启动定时器
        timerProgress.resumeTimer()
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let contentOffsetX = scrollView.contentOffset.x
        let index = contentOffsetX / bannerW
        pageControl.currentPage = Int(index)
        // 暂停定时器
        timerProgress.pauseTimer()
    }
}

#Preview {
    ViewController()
}
