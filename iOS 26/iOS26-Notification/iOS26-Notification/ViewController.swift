//
//  ViewController.swift
//  iOS26-Notification
//
//  Created by 杨帆 on 2025/6/30.
//

import UIKit

public class NotificationSubject {
    static let shared = NotificationSubject()
}

// MARK: - 消息类型
public struct CustomMainActorMessage: NotificationCenter.MainActorMessage {
    // 发送者
    public typealias Subject = NotificationSubject
    public static var name: Notification.Name {
        .init("CustomMainActorMessage")
    }

    // 数据
    let info: String
}

class ViewController: UIViewController {
    lazy var label: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 300, height: 60)
        label.textAlignment = .center
        label.text = "暂无通知消息"
        label.center = view.center
        return label
    }()

    var mainActorMessageToken: NotificationCenter.ObservationToken!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(label)
        // 监听通知
        mainActorMessageToken = NotificationCenter.default.addObserver(of: NotificationSubject.shared, for: CustomMainActorMessage.self) { message in
            self.label.text = "\(message.info)"
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 发送通知
        NotificationCenter.default.post(CustomMainActorMessage(info: "you have a new message"), subject: NotificationSubject.shared)
    }

    deinit {
        NotificationCenter.default.removeObserver(mainActorMessageToken)
    }
}
