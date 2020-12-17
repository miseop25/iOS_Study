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

class SwipeActionViewController: UIViewController {
   
   @IBOutlet weak var listTableView: UITableView!
   
   var list = [("Always laugh when you can. It is cheap medicine.", "Lord Byron"), ("I probably hold the distinction of being one movie star who, by all laws of logic, should never have made it. At each stage of my career, I lacked the experience.", "Audrey Hepburn"), ("Sometimes when you innovate, you make mistakes. It is best to admit them quickly, and get on with improving your other innovations.", "Steve Jobs")]
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
   }
}


extension SwipeActionViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return list.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      
      cell.textLabel?.text = list[indexPath.row].0
      cell.detailTextLabel?.text = list[indexPath.row].1
      
      return cell
   }
}


@available(iOS 11.0, *)
extension SwipeActionViewController: UITableViewDelegate {
    
//    왼쪽으로 밀었을 경우 생겨나게 된다.
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let unreadAction = UIContextualAction(style: .normal, title: "Unread") { (action, view, completion) in
            
//            크로저에서 기능을 수행하고 마지막으로 completion 을 호출해야 한다.
//            기능을 정상적으로 수행했다면 true를 리턴하고 아니면 false 를 리턴해야 한다.
            completion(true)
        }
        
        unreadAction.backgroundColor = UIColor.systemBlue
        unreadAction.image = UIImage(named: "mail")
        let configuration = UISwipeActionsConfiguration(actions: [unreadAction])
        return configuration
    }
//   이미지와 타이틀을 함께 표시할려면 충분한 높이가 확보되어야 한다.
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delectAction = UIContextualAction(style: .destructive, title: "Delect") { (action, view, completion) in
            self.list.remove(at: indexPath.row)
            self.listTableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        delectAction.image = UIImage(named: "trash")
        
        let flagAction = UIContextualAction(style: .normal, title: "Falg") { (action, view, completion) in
            completion(true)
        }
        flagAction.image = UIImage(named: "flag")
        flagAction.backgroundColor = UIColor.systemOrange
        
        let menuAction = UIContextualAction(style: .normal, title: "menu") { (action, view, complection) in
            complection(true)
        }
        menuAction.image = UIImage(named: "more")
        
        
//        row action과 마찬가지로 배열에 추가된 순서대로 셀 오른쪽에서부터 생성된다.
        let configuration = UISwipeActionsConfiguration(actions: [delectAction, flagAction, menuAction])
        
//        이 속성을 True로 했을때 셀전체를 스와이프 했을때 첫번째 액션이 수행된다.
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
        
    }
    

}

extension SwipeActionViewController {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        print(indexPath.row)
        return UITableViewAutomaticDimension
    }
}














