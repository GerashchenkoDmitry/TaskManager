//
//  PhoneNumberTextField.swift
//  TaskManager
//
//  Created by Дмитрий Геращенко on 28.01.2022.
//

import UIKit

final class PhoneNumberTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var rawPhoneNumber: String {
        guard let text = self.text else { return "" }
        return text.filter { (char) -> Bool in
            Int(String(char)) != nil
        }
    }
}

extension PhoneNumberTextField: UITextFieldDelegate {
    
    func format(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex

        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                result.append(numbers[index])

                index = numbers.index(after: index)

            } else {
                result.append(ch)
            }
        }
        return result
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        guard !(text == "+7" && string == "") else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = format(with: "+X (XXX) XXX-XXXX", phone: newString)
        return false
    }
}

