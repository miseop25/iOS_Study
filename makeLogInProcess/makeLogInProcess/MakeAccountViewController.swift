//
//  MakeAccountViewController.swift
//  makeLogInProcess
//
//  Created by Minseop Kim on 2020/05/31.
//  Copyright © 2020 Minseop Kim. All rights reserved.
//

import UIKit

class MakeAccountViewController: UIViewController {

    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var psField: UITextField!
    @IBOutlet weak var psCheckField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        psField.isSecureTextEntry = true
        psCheckField.isSecureTextEntry = true

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameField.becomeFirstResponder()
    }
    lazy var numberCharSet = CharacterSet(charactersIn: "1234567890").inverted
    lazy var hangulCharSet = CharacterSet(charactersIn: "ㄱㄴㄷㄹㅁㅂㅅㅇㅈㅊㅋㅌㅍㅎㄱㅃㅉㄸㄲㅆㅏㅑㅓㅕㅗㅛㅜㅠㅣㅡㅔㅐㅖㅒㅢ").inverted
    lazy var engCharSet = CharacterSet(charactersIn: "abcdefghijklmnopqrswxyz").inverted
    

}
extension MakeAccountViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let currentText = textField.text as NSString? else {
            return true
        }
        let finalText = currentText.replacingCharacters(in: range, with: string)
        
        switch textField {
        case nameField:
            if finalText.count > 6{
                return false
            }
            if let _ = string.rangeOfCharacter(from: hangulCharSet) {
                return false
            }
        case ageField:
            if let _ = string.rangeOfCharacter(from: numberCharSet) {
                return false
            }
            if let age = Int(finalText), !(1...120).contains(age) {
                return false
            }
        case phoneField:
            if finalText.count > 11 { return false }
            if let _ = string.rangeOfCharacter(from: numberCharSet) {
                return false
            }
        case idField:
            if finalText.count > 16 { return false}
            if let _ = string.rangeOfCharacter(from: engCharSet), let _ = string.rangeOfCharacter(from: numberCharSet) {
                return false
            }
            
            
        default:
            break
        }
        
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        switch textField {
        case emailField:
            let ragex = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
            guard let email = emailField.text, let _ = email.range(of: ragex, options: .regularExpression) else {
                alert(message: "잘못된 이메일 형식입니다.")
                emailField.text = ""
                emailField.becomeFirstResponder()
                return false
            }
        case psCheckField:
            if psCheckField.text != psField.text {
                alert(message: "비밀번호가 일치하지 않습니다.")
                psField.text = ""
                psCheckField.text = ""
                psField.becomeFirstResponder()
                return false
            }
        default:
            break
        }
        return true

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == psCheckField {
            textField.resignFirstResponder()
        }
        return true
    }
    
    
}

extension MakeAccountViewController {
   func alert(message: String) {
      let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
      
      let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
      alert.addAction(ok)
      
      present(alert, animated: true, completion: nil)
   }
}
