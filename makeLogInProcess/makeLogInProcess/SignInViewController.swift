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
            guard let fieldList = login.textFields else {
                self.checkLabel.text = "ID와 PS를 제대로 입력해주세요"
                return}
            guard let idField = fieldList.first else {
                return self.checkLabel.text = "ID를 입력해주세요"
                }
            guard let psField = fieldList.last else {
                self.checkLabel.text = "PS를 입력해주세요"
                return}
        }
        
        login.addAction(okAction)
        present(login, animated: true, completion: nil)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
