//
//  SignInViewController.swift
//  makeLogInProcess
//
//  Created by Minseop Kim on 2020/05/22.
//  Copyright © 2020 Minseop Kim. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var checkLabel: UILabel!
    
    @IBOutlet weak var idCheckLabel: UILabel!
    @IBOutlet weak var psCheckLabel: UILabel!
    
    @IBAction func loginAction(_ sender: Any) {
        let login = UIAlertController(title: "로그인", message: "아이디와 비밀번호를 입력해주세요.", preferredStyle: .alert)
        
        login.addTextField { (idField) in
            idField.placeholder = "ID"
        }
        login.addTextField { (psField) in
            psField.placeholder = "PS"
            psField.isSecureTextEntry = true
        }
        
        
        let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
            guard let fieldList = login.textFields else {return}
            guard let idField = fieldList.first?.text , idField.count > 0 else {
                print("id error")
                self.checkLabel.text = "ID를 입력해주세요"
                return
                }
            guard let psField = fieldList.last?.text , psField.count > 0 else {
                print("ps error")
                self.checkLabel.text = "PS를 입력해주세요"
                return}
            self.checkLabel.text = "ID와 PS가 입력되었습니다."
            
            let id = self.idCheck(id: idField)
            let ps = self.psCheck(ps: psField)
            
            switch id {
            case 0 :
                self.idCheckLabel.text = "올바른 id 입니다."
            case 1 :
                self.idCheckLabel.text = "12자 이내의 id를 입력해 주세요"
            case 3 :
                self.idCheckLabel.text = "소문자와 숫자만을 입력해 주세요"
            default :
                break
            }
            switch ps {
            case 0 :
                self.psCheckLabel.text = "올바른 PS 입니다"
            case 1 :
                self.psCheckLabel.text = "12자 이내의 ps를 입력해 주세요"
            case 2 :
                self.psCheckLabel.text = "영어 대소문자, 숫자 특수문자를 사용해 주세요"
            default :
                break
            }
            
        }
        
        login.addAction(okAction)
        present(login, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        idCheckLabel.textAlignment = .center
        psCheckLabel.textAlignment = .center

    }

}

extension SignInViewController {
    func idCheck(id: String) -> Int {
        var check = 0
        if id.count > 12 {
            check = 1
            return check
        }
        for char in id {
            if char.isLowercase || char.isNumber {
                continue
            } else {
                check = 1
                return check
            }
        }
        return check
    }
    func psCheck(ps: String) -> Int {
        var check = 0
        let spcialChar = ["!", "@", "#", "$", "%", "^", "&", "*","~"]
        var checkList = [false, false, false, false]
        if ps.count > 12 {
            check = 1
            return check
        }
        for char in ps {
            if char.isNumber { checkList[0] = true}
            if char.isUppercase {checkList[1] = true}
            if char.isLowercase { checkList[2] = true}
            if spcialChar.contains(String(char)) { checkList[3] = true}
        }
        for i in checkList {
            if !i { return 2}
        }
        return check
    }
    
}
