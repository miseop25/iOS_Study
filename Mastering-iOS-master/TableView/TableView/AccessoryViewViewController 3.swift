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

class AccessoryViewViewController: UIViewController {
   
   @IBOutlet weak var listTableView: UITableView!
   
   @objc func toggleEditMode() {
      listTableView.setEditing(!listTableView.isEditing, animated: true)
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(toggleEditMode))
   }
}


extension AccessoryViewViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 5
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
    switch indexPath.row {
    case 0:
        cell.textLabel?.text = "Disclosure Indicator"
        cell.accessoryType = .disclosureIndicator
    case 1:
        cell.accessoryType = .detailButton
        cell.textLabel?.text = "Detail Button"
    case 2:
        cell.accessoryType = .checkmark
        cell.textLabel?.text = "Check Mark"
    case 3:
        cell.accessoryType = .detailDisclosureButton
        cell.textLabel?.text = "Detail Disclosure"
    case 4:
        return tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
    default:
        cell.accessoryType = .none
        cell.textLabel?.text = "None"
    }
      
    
      return cell
   }
}

extension AccessoryViewViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "pushSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "modalSegue", sender: nil)
        
    }
}





