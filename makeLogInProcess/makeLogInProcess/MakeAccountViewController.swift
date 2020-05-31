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

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameField.becomeFirstResponder()
    }
    

}
extension MakeAccountViewController: UITextFieldDelegate {
    
    
}
