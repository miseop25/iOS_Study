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

// Notification.Name.UIKeyboardDidHide
// Notification.Name.UIKeyboardDidShow
// Notification.Name.UIKeyboardWillHide
// Notification.Name.UIKeyboardWillShow
// Notification.Name.UIKeyboardWillChangeFrame
// Notification.Name.UIKeyboardDidChangeFrame

import UIKit

class KeyboardNotificationViewController: UIViewController {
   
   @IBOutlet var textView: UITextView!
   
   override func viewDidLoad() {
      super.viewDidLoad()
    
    NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (noti) in
        
        guard let userInfo = noti.userInfo else { return}
        guard let bounds = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        
        
        var inset = self.textView.textContainerInset
        inset.bottom = bounds.height
        self.textView.textContainerInset = inset
    }
    NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (noti) in
        
        guard let userInfo = noti.userInfo else { return}
        guard let bounds = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        var inset = self.textView.textContainerInset
        inset.bottom = 8
        self.textView.textContainerInset = inset
        
        
    }
      
      
   }
}
