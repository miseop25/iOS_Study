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

class AddTextFieldViewController: UIViewController {
   
   @IBOutlet weak var idLabel: UILabel!
   @IBOutlet weak var passwordLabel: UILabel!
   
   @IBAction func show(_ sender: Any) {
    
    let login = UIAlertController(title: "로그인 화면", message: nil, preferredStyle: .alert)
    login.addTextField { (idField) in
        idField.placeholder = "ID"
    }
    login.addTextField { (psField) in
        psField.placeholder = "Password"
        psField.isSecureTextEntry = true
    }
    
    let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
        if let fieldList = login.textFields{
            if let idField = fieldList.first {
                self.idLabel.text = "idField.text"
            }
            if let psField = fieldList.last {
                self.passwordLabel.text = psField.text
            }
        }
    }
    
    login.addAction(okAction)
    
    let cancleAction = UIAlertAction(title: "cancle", style: .cancel, handler: nil)
    login.addAction(cancleAction)
    present(login, animated: true, completion: nil)
    
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // Do any additional setup after loading the view.
   }
}


























