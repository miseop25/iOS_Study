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
import MessageUI

class RowActionViewController: UIViewController {
   
   @IBOutlet weak var listTableView: UITableView!
   
   var list = ["iMac Pro", "iMac 5K", "Macbook Pro", "iPad Pro", "iPhone X", "Mac mini", "Apple TV", "Apple Watch"]
   
   func sendEmail(with data: String) {
      guard MFMailComposeViewController.canSendMail() else {
         return
      }
      
      let composer = MFMailComposeViewController()
      composer.mailComposeDelegate = self
      composer.setSubject("Test Mail")
      composer.setMessageBody(data, isHTML: false)
      
      present(composer, animated: true, completion: nil)
   }
   
   func sendMessage(with data: String) {
      guard MFMessageComposeViewController.canSendText() else {
         return
      }
      
      let composer = MFMessageComposeViewController()
      composer.messageComposeDelegate = self
      composer.body = data
      
      present(composer, animated: true, completion: nil)
   }
   
   func delete(at indexPath: IndexPath) {
      list.remove(at: indexPath.row)
      listTableView.deleteRows(at: [indexPath], with: .automatic)
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
   }
}


extension RowActionViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return list.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      cell.textLabel?.text = list[indexPath.row]
      return cell
   }
   
   func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//      return indexPath.row != 0
    return true
   }
}


extension RowActionViewController: UITableViewDelegate {
//    셀을 왼쪽으로 스와이프하면 이 메소드가 호출된다. 로우엑션을 리턴하면 기본으로 하는것을 리턴
//    만들지 않으면 기본값
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let emailAction = UITableViewRowAction(style: .default, title: "Email") { [weak self] (action, indexPath) in
            if let data = self?.list[indexPath.row]{
                self?.sendEmail(with: data)
            }
        }
        
        emailAction.backgroundColor = UIColor.systemBlue
        let messageAction = UITableViewRowAction(style: .normal, title: "SMS") { [weak self] (action, indexPath) in
            if let data = self?.list[indexPath.row] {
                self?.sendMessage(with: data)
            }
        }
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { [weak self] (action, indexPath) in
            self?.delete(at: indexPath)
        }
//        배열에 저장되는 순서는 표시되는 순서와 연관이 있다. 순서대로 오른쪽에서부터 생성된다.
        return [deleteAction, messageAction, emailAction]
    }
   
}


extension RowActionViewController: MFMailComposeViewControllerDelegate {
   func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
      controller.dismiss(animated: true, completion: nil)
   }
}


extension RowActionViewController: MFMessageComposeViewControllerDelegate {
   func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
      controller.dismiss(animated: true, completion: nil)
   }
}


















