//
//  ViewController.swift
//  截屏
//
//  Created by 杨帆 on 2022/11/29.
//

import UIKit

class ViewController: UIViewController {
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "abc")
        tableView.dataSource = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        // 设置代理
        let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        scene?.window?.windowScene?.screenshotService?.delegate = self
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "abc")
        cell?.textLabel?.text = "Row \(indexPath.row)"
        return cell!
    }
}

// MARK: - UIScreenshotServiceDelegate
extension ViewController: UIScreenshotServiceDelegate {
    // 生成截屏窗口所有内容的PDF数据（包括超出屏幕范围的部分）
    func screenshotService(_ screenshotService: UIScreenshotService,
                           generatePDFRepresentationWithCompletion completionHandler: @escaping (Data?, Int, CGRect) -> Void) {
        // PDF数据
        let pdfData = NSMutableData()
        // PDF尺寸
        let pdfFrame = CGRect(origin: .zero, size: tableView.contentSize)
        // PDF文档信息
        let pdfInfo: [AnyHashable: Any]? = nil
        UIGraphicsBeginPDFContextToData(pdfData, pdfFrame, pdfInfo)
        UIGraphicsBeginPDFPageWithInfo(pdfFrame, pdfInfo)
        if let context = UIGraphicsGetCurrentContext() {
            let frame = tableView.frame
            let contentOffset = tableView.contentOffset
            let contentInset = tableView.contentInset
            tableView.contentOffset = .zero
            tableView.contentInset = .zero
            tableView.frame = pdfFrame
            tableView.layer.render(in: context)
            tableView.frame = frame
            tableView.contentOffset = contentOffset
            tableView.contentInset = contentInset
        }
        UIGraphicsEndPDFContext()
        // 计算PDF页的y值
        let y = tableView.contentSize.height - tableView.contentOffset.y - tableView.frame.height
        completionHandler(pdfData as Data, 0, .init(origin: CGPoint(x: 0, y: y), size: view.frame.size))
    }
}
