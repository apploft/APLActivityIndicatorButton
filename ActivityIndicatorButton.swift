//
//  ActivityIndicatorButton.swift
//  BPI
//
//  Created by Famara Kassama on 04.07.19.
//  Copyright © 2019 apploft GmbH. All rights reserved.
//

import Foundation
import UIKit

protocol Animatable {
    func startAnimating()
    func stopAnimating()
}

class ActivityIndicatorButton: UIView, Animatable {
    var button: UIButton {
        willSet {
            button.removeFromSuperview()
        }
        didSet {
            setupButton()
        }
    }

    private(set) var isAnimating: Bool = false

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        self.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

        return activityIndicator
    }()

    fileprivate var buttonTitle: String?
    fileprivate var attributedButtonTitle: NSAttributedString?

    init(button: UIButton = UIButton()) {
        self.button = button

        super.init(frame: CGRect.zero)

        setupButton()
    }

    required init?(coder aDecoder: NSCoder) {
        button = UIButton()

        super.init(coder: aDecoder)

        setupButton()
    }

    private func setupButton() {
        self.addSubview(button)
        sendSubviewToBack(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        button.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

    func startAnimating() {
        isAnimating = true

        if let attributedTitle = button.attributedTitle(for: UIControl.State()) {
            self.attributedButtonTitle = attributedTitle
            button.setAttributedTitle(nil, for: UIControl.State())
        } else if let title = button.title(for: UIControl.State()) {
            self.buttonTitle = title
            button.setTitle(nil, for: UIControl.State())
        }

        self.activityIndicator.startAnimating()
    }

    func stopAnimating() {
        self.activityIndicator.stopAnimating()

        if attributedButtonTitle != nil {
            button.setAttributedTitle(attributedButtonTitle, for: UIControl.State())
        } else if buttonTitle != nil {
            button.setTitle(buttonTitle, for: UIControl.State())
        }

        isAnimating = false
    }
}
