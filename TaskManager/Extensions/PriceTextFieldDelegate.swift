//
//  PriceTextFieldDelegate.swift
//  TaskManager
//
//  Created by Дмитрий Геращенко on 28.01.2022.
//

import UIKit

final class PriceTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {
            return false
        }
        if text.count > 6 && string != "" {
            return false
        }
        return true
    }
}
