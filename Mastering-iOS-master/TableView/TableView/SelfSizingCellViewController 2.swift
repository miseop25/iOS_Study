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

class SelfSizingCellViewController: UIViewController {
   
   @IBOutlet weak var listTableView: UITableView!
   
   let list = [("Always laugh when you can. It is cheap medicine.", "Lord Byron"), ("I probably hold the distinction of being one movie star who, by all laws of logic, should never have made it. At each stage of my career, I lacked the experience.", "Audrey Hepburn"), ("Sometimes when you innovate, you make mistakes. It is best to admit them quickly, and get on with improving your other innovations.", "Steve Jobs")]
   
   override func viewDidLoad() {
      super.viewDidLoad()
    
//    listTableView.rowHeight = UITableViewAutomaticDimension
//    listTableView.estimatedRowHeight = UITableViewAutomaticDimension
    

   }
}


extension SelfSizingCellViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return list.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      let target = list[indexPath.row]
      cell.textLabel?.text = target.0
      cell.detailTextLabel?.text = target.1
    
      return cell
   }
}


extension SelfSizingCellViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100
        }
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100
        }
        return UITableViewAutomaticDimension
        
    }
   
}


























