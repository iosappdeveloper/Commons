//
//  UIUtils.swift
//  Common
//
//  Created by Matoria, Ashok on 15/03/19.
//  Copyright © 2019 Matoria, Ashok. All rights reserved.
//

import UIKit

public struct UIUtils {
    private init() {}
    
    @discardableResult
    public static func showAlert(title: String, message: String? = nil, okTitle: String = "OK", okAction: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: okTitle, style: .default, handler: okAction))
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
        return alert
    }
}
