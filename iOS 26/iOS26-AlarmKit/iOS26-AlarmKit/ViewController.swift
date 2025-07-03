//
//  ViewController.swift
//  iOS26-AlarmKit
//
//  Created by 杨帆 on 2025/7/3.
//

import AlarmKit
import SwiftUI
import UIKit

nonisolated struct TimerData: AlarmMetadata {}

class ViewController: UIViewController {
    let manager = AlarmManager.shared
    var timerAlarm: Alarm?
    var alarm: Alarm?

    override func viewDidLoad() {
        super.viewDidLoad()

        Task {
            Task {
                if await checkForAuthorization() {
                    print("授权成功")
                    await scheduleTimer()
                } else {
                    print("授权失败")
                }
            }
        }
    }

    // MARK: 检查授权
    func checkForAuthorization() async -> Bool {
        switch manager.authorizationState {
        case .notDetermined:
            do {
                let state = try await manager.requestAuthorization()
                return state == .authorized
            } catch {
                print(error.localizedDescription)
                return false
            }
        case .authorized: return true
        case .denied: return false
        @unknown default: return false
        }
    }

    // MARK: 设置闹钟
    func scheduleAlarm() async {
        let button = AlarmButton(text: "起床", textColor: Color.teal, systemImageName: "checkmark")
        let secondButton = AlarmButton(text: "停止", textColor: Color.teal, systemImageName: "checkmark")
        let alert = AlarmPresentation.Alert(title: "起床", stopButton: button, secondaryButton: secondButton)
        let attributes = AlarmAttributes<TimerData>(presentation: AlarmPresentation(alert: alert), tintColor: .pink)
        let config: AlarmManager.AlarmConfiguration = .alarm(schedule: .relative(.init(time: .init(hour: 9, minute: 42), repeats: .never)), attributes: attributes)
        do {
            // 启动闹钟
            alarm = try await manager.schedule(id: UUID(), configuration: config)
            print("开始闹钟")
        } catch {
            print(error.localizedDescription)
        }
    }

    // MARK: 设置计时器
    func scheduleTimer() async {
        let button = AlarmButton(text: "完成", textColor: Color.teal, systemImageName: "checkmark")
        // 计时器Alert，两种大小：当设备解锁时为小横幅，锁定时为大横幅
        let alert = AlarmPresentation.Alert(title: "开始计时", stopButton: button)
        let attributes = AlarmAttributes<TimerData>(presentation: AlarmPresentation(alert: alert), tintColor: .pink)
        let config: AlarmManager.AlarmConfiguration = .timer(duration: 30, attributes: attributes)
        do {
            // 启动计时器
            timerAlarm = try await manager.schedule(id: UUID(), configuration: config)
            print("开始倒计时")
        } catch {
            print(error.localizedDescription)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let id = alarm?.id {
            try? AlarmManager.shared.cancel(id: id)
            print("结束闹钟")
        }
        if let id = timerAlarm?.id {
            try? AlarmManager.shared.cancel(id: id)
            print("结束倒计时")
        }
    }
}
