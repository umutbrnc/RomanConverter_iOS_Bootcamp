//
//  UIView+Extensions.swift
//  RomanConverter
//
//  Created by Emincan Antalyalı on 14.10.2023.
//

import UIKit
extension UIViewController {
    func presentAlert(status: AlertImage, message: String) {
        let alertVC = CustomAlertViewController(status: status, message: message)
        alertVC.modalPresentationStyle = .overFullScreen
        alertVC.modalTransitionStyle = .crossDissolve
        present(alertVC, animated: true)
    }
}
