//
//  ViewController.swift
//  iOS18-PencilKit
//
//  Created by 杨帆 on 2024/9/27.
//

import PencilKit
import UIKit

class ViewController: UIViewController {
    lazy var canvasView: PKCanvasView = {
        let canvasView = PKCanvasView()
        canvasView.translatesAutoresizingMaskIntoConstraints = false
        return canvasView
    }()
    // 调色板
    lazy var toolPicker: PKToolPicker = {
        //  iOS18新增，自定义调色板工具选项
        var config = PKToolPickerCustomItem.Configuration(identifier: "customTool", name: "pencil.and.scribble")
        config.imageProvider = { toolItem in
            guard let toolImage = UIImage(systemName: config.name) else {
                return UIImage()
            }
            return toolImage
        }
        config.allowsColorSelection = true
        config.defaultColor = .red
        config.defaultWidth = 10.0
        let customItem = PKToolPickerCustomItem(configuration: config)
        // iOS18新增，自定义中间区域的调色板工具
        let toolPicker = PKToolPicker(toolItems: [PKToolPickerInkingItem(type: .pen), PKToolPickerLassoItem(), PKToolPickerRulerItem(),
                                                  PKToolPickerEraserItem(type: .bitmap), PKToolPickerScribbleItem(), customItem])
        return toolPicker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(canvasView)
        setToolPicker()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        NSLayoutConstraint.activate([
            canvasView.topAnchor.constraint(equalTo: view.topAnchor),
            canvasView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            canvasView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            canvasView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    // MARK: 为PKCanvasView设置PKToolPicker
    func setToolPicker() {
        toolPicker.addObserver(canvasView)
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        // iOS18新增，自定义右侧附加选项
        toolPicker.accessoryItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.down.fill"), primaryAction: UIAction(handler: { [self] _ in
            self.saveDrawing()
        }))
        canvasView.becomeFirstResponder()
    }

    // MARK: 保存绘画内容到相册，需要添加相册权限
    func saveDrawing() {
        let drawing = canvasView.drawing
        let image = drawing.image(from: canvasView.frame, scale: UIScreen.main.scale)
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}
