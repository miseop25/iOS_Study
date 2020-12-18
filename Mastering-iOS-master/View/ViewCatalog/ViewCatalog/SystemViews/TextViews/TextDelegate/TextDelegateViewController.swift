//
//  Copyright (c) 2018 KxCoding <kky0317@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

class TextDelegateViewController: UIViewController {
   
   @IBOutlet weak var nameField: UITextField!
   
   @IBOutlet weak var ageField: UITextField!
   
   @IBOutlet weak var genderField: UITextField!
   
   @IBOutlet weak var emailField: UITextField!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
   }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameField.becomeFirstResponder()
    }
    lazy var charSet = CharacterSet(charactersIn: "1234567890").inverted
    lazy var ageCahrSet = CharacterSet(charactersIn: "MF").inverted
    
}

extension TextDelegateViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameField:
            ageField.becomeFirstResponder()
        case ageField:
            genderField.becomeFirstResponder()
        case genderField:
            emailField.becomeFirstResponder()
        case emailField:
            emailField.resignFirstResponder()
        default:
            break
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let currentText = textField.text as NSString? else {
            return true
        }
        let finalText = currentText.replacingCharacters(in: range, with: string)
        
        switch textField {
        case nameField:
            if finalText.count > 10{
                return false
            }
        case ageField:
            if let _ = string.rangeOfCharacter(from: charSet) {
                return false
            }
            if let age = Int(finalText), !(1...100).contains(age) {
                return false
            }
        case genderField:
            if let _ = string.rangeOfCharacter(from: ageCahrSet) {
                return false
            }
            if finalText.count > 1 {
                return false
            }
        default:
            break
        }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField == emailField {
            let regex = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
            guard let email = emailField.text, let _ = email.range(of: regex, options: .regularExpression) else {
                alert(message: "invalid email")
                return false
            }
        }
        return true
    }

}


extension TextDelegateViewController {
   func alert(message: String) {
      let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
      
      let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
      alert.addAction(ok)
      
      present(alert, animated: true, completion: nil)
   }
}

