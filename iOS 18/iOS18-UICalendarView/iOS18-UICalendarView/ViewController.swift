//
//  ViewController.swift
//  iOS18-UICalendarView
//
//  Created by 杨帆 on 2024/8/28.
//

import UIKit

class ViewController: UIViewController {
    // UICalendarSelectionWeekOfYear
    lazy var calendarSelectionWeekOfYear = UICalendarSelectionWeekOfYear(delegate: self)
    // UICalendarView
    lazy var calendarView: UICalendarView = {
        let calendarView = UICalendarView(frame: UIScreen.main.bounds)
        calendarView.locale = Locale(identifier: "zh_Hans_CN")
        // iOS18新增，一次选择一周日期
        calendarView.selectionBehavior = calendarSelectionWeekOfYear
        calendarSelectionWeekOfYear.selectedWeekOfYear = DateComponents(weekOfYear: 36, yearForWeekOfYear: 2024)
        return calendarView
    }()

    var selectedDate: DateComponents = DateComponents(weekOfYear: 36, yearForWeekOfYear: 2024) {
        didSet {
            // 格式化日期
            let startDateOfSelecedWeek = Calendar.current
                .date(from: selectedDate)?
                .formatted(.dateTime.year().month().day()
                    .locale(Locale(identifier: "zh_Hans_CN")))
            print(startDateOfSelecedWeek ?? Date.now)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(calendarView)
        // 3秒之后切换到指定的某周日期
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.calendarSelectionWeekOfYear.setSelected(DateComponents(weekOfYear: 38, yearForWeekOfYear: 2024), animated: true)
        }
    }
}

// MARK: - UICalendarSelectionWeekOfYearDelegate
extension ViewController: UICalendarSelectionWeekOfYearDelegate {
    func week(ofYearSelection selection: UICalendarSelectionWeekOfYear, didSelectWeekOfYear weekOfYearComponents: DateComponents?) {
        guard let weekOfYearComponents = weekOfYearComponents else { return }
        selectedDate = weekOfYearComponents
    }

    func week(ofYearSelection selection: UICalendarSelectionWeekOfYear, canSelectWeekOfYear weekOfYearComponents: DateComponents?) -> Bool {
        return true
    }
}
