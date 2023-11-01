//
//  ViewController.swift
//  Size Classes
//
//  Created by 杨帆 on 2023/11/1.
//

import UIKit

class ViewController: UIViewController {
    lazy var redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var compactConstraints: [NSLayoutConstraint] = []
    var regularConstraints: [NSLayoutConstraint] = []

    func setupCompactConstraints() {
        let redViewTopConstraint = NSLayoutConstraint(item: redView,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: view,
                                                      attribute: .topMargin,
                                                      multiplier: 1.0,
                                                      constant: 20)
        let redViewLeadingConstraint = NSLayoutConstraint(item: redView,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: view,
                                                          attribute: .leadingMargin,
                                                          multiplier: 1.0,
                                                          constant: 20)
        let redViewTrailingConstraint = NSLayoutConstraint(item: redView,
                                                           attribute: .trailing,
                                                           relatedBy: .equal,
                                                           toItem: view,
                                                           attribute: .trailingMargin,
                                                           multiplier: 1.0,
                                                           constant: -20)
        let redViewHeightConstraint = NSLayoutConstraint(item: redView,
                                                         attribute: .height,
                                                         relatedBy: .equal,
                                                         toItem: nil,
                                                         attribute: .notAnAttribute,
                                                         multiplier: 1.0,
                                                         constant: 100)

        let blueViewTopConstraint = NSLayoutConstraint(item: blueView,
                                                       attribute: .top,
                                                       relatedBy: .equal,
                                                       toItem: redView,
                                                       attribute: .bottom,
                                                       multiplier: 1.0,
                                                       constant: 20)
        let blueViewLeadingConstraint = NSLayoutConstraint(item: blueView,
                                                           attribute: .leading,
                                                           relatedBy: .equal,
                                                           toItem: redView,
                                                           attribute: .leading,
                                                           multiplier: 1.0,
                                                           constant: 0)
        let blueViewTrailingConstraint = NSLayoutConstraint(item: blueView,
                                                            attribute: .trailing,
                                                            relatedBy: .equal,
                                                            toItem: redView,
                                                            attribute: .trailing,
                                                            multiplier: 1.0,
                                                            constant: 0)
        let blueViewHeightConstraint = NSLayoutConstraint(item: blueView,
                                                          attribute: .height,
                                                          relatedBy: .equal,
                                                          toItem: redView,
                                                          attribute: .height,
                                                          multiplier: 1.0,
                                                          constant: 0)

        compactConstraints.append(contentsOf: [
            redViewTopConstraint,
            redViewLeadingConstraint,
            redViewTrailingConstraint,
            blueViewTopConstraint,
            blueViewLeadingConstraint,
            blueViewTrailingConstraint,
            redViewHeightConstraint,
            blueViewHeightConstraint
        ])
    }

    func setupRegularConstraints() {
        let redViewTopConstraint = NSLayoutConstraint(item: redView,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: view,
                                                      attribute: .topMargin,
                                                      multiplier: 1.0,
                                                      constant: 20)
        let redViewLeadingConstraint = NSLayoutConstraint(item: redView,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: view,
                                                          attribute: .leadingMargin,
                                                          multiplier: 1.0,
                                                          constant: 20)
        let redViewTrailingConstraint = NSLayoutConstraint(item: redView,
                                                           attribute: .trailing,
                                                           relatedBy: .equal,
                                                           toItem: blueView,
                                                           attribute: .leading,
                                                           multiplier: 1.0,
                                                           constant: -20)
        let redViewHeightConstraint = NSLayoutConstraint(item: redView,
                                                         attribute: .height,
                                                         relatedBy: .equal,
                                                         toItem: nil,
                                                         attribute: .notAnAttribute,
                                                         multiplier: 1.0,
                                                         constant: 100)
        let blueViewTopConstraint = NSLayoutConstraint(item: blueView,
                                                       attribute: .top,
                                                       relatedBy: .equal,
                                                       toItem: redView,
                                                       attribute: .top,
                                                       multiplier: 1.0,
                                                       constant: 0)
        let blueViewTrailingConstraint = NSLayoutConstraint(item: blueView,
                                                            attribute: .trailing,
                                                            relatedBy: .equal,
                                                            toItem: view,
                                                            attribute: .trailingMargin,
                                                            multiplier: 1.0,
                                                            constant: -20)
        let blueViewHeightConstraint = NSLayoutConstraint(item: blueView,
                                                          attribute: .height,
                                                          relatedBy: .equal,
                                                          toItem: redView,
                                                          attribute: .height,
                                                          multiplier: 1.0,
                                                          constant: 0)

        let blueViewWidthConstraint = NSLayoutConstraint(item: blueView,
                                                         attribute: .width,
                                                         relatedBy: .equal,
                                                         toItem: redView,
                                                         attribute: .width,
                                                         multiplier: 1.0,
                                                         constant: 0)

        regularConstraints.append(contentsOf: [
            redViewTopConstraint,
            redViewLeadingConstraint,
            redViewTrailingConstraint,
            blueViewTopConstraint,
            blueViewTrailingConstraint,
            redViewHeightConstraint,
            blueViewHeightConstraint,
            blueViewWidthConstraint
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(redView)
        view.addSubview(blueView)

        setupCompactConstraints()
        setupRegularConstraints()

        NSLayoutConstraint.activate(compactConstraints)
        layoutTrait(traitCollection: UIScreen.main.traitCollection)

        registerForTraitChanges([UITraitHorizontalSizeClass.self, UITraitVerticalSizeClass.self]) { (self: Self, _: UITraitCollection) in
            self.layoutTrait(traitCollection: self.traitCollection)
        }
    }

    func layoutTrait(traitCollection: UITraitCollection) {
        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular {
            NSLayoutConstraint.deactivate(regularConstraints)
            NSLayoutConstraint.activate(compactConstraints)
        } else {
            NSLayoutConstraint.deactivate(compactConstraints)
            NSLayoutConstraint.activate(regularConstraints)
        }
    }
}
