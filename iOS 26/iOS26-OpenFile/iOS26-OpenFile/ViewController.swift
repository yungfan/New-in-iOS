//
//  ViewController.swift
//  iOS26-OpenFile
//
//  Created by 杨帆 on 2025/09/16  19:12.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let fileURL = Bundle.main.url(forResource: "test.zip", withExtension: nil)!
        openFileExternally(fileURL: fileURL)
    }

    @MainActor
    func openFileExternally(fileURL: URL) {
        // 拷贝文件到沙盒
        let tmpURL = URL.temporaryDirectory.appendingPathComponent(fileURL.lastPathComponent)
        if FileManager.default.fileExists(atPath: tmpURL.path) {
            try? FileManager.default.removeItem(at: tmpURL)
        }
        do {
            try FileManager.default.copyItem(at: fileURL, to: tmpURL)
        } catch {
            print(error.localizedDescription)
        }

        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            scene.open(tmpURL, options: nil) { success in
                self.completionHandler(success: success)
            }
        }
    }

    func completionHandler(success: Bool) {
        if success {
            print("通过其他App打开文件")
        }
    }
}
