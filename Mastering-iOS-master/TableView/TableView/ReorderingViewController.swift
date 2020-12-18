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

class ReorderingViewController: UIViewController {
   
   var firstList = [String]()
   var secondList = [String]()
   var thirdList = ["iMac Pro", "iMac 5K", "Macbook Pro", "iPad Pro", "iPad", "iPad mini", "iPhone 8", "iPhone 8 Plus", "iPhone SE", "iPhone X", "Mac mini", "Apple TV", "Apple Watch"]
   
   @IBOutlet weak var listTableView: UITableView!
   
   @objc func reloadTableView() {
      listTableView.reloadData()
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      listTableView.setEditing(true, animated: false)
      
      navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reload", style: .plain, target: self, action: #selector(reloadTableView))
   }   
}


extension ReorderingViewController: UITableViewDataSource {
   func numberOfSections(in tableView: UITableView) -> Int {
      return 3
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      switch section {
      case 0:
         return firstList.count
      case 1:
         return secondList.count
      case 2:
         return thirdList.count
      default:
         return 0
      }
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      
      switch indexPath.section {
      case 0:
         cell.textLabel?.text = firstList[indexPath.row]
      case 1:
         cell.textLabel?.text = secondList[indexPath.row]
      case 2:
         cell.textLabel?.text = thirdList[indexPath.row]
      default:
         break
      }
      
      return cell
   }
   
   func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      switch section {
      case 0:
         return "First Section"
      case 1:
         return "Second Section"
      case 2:
         return "Third Section"
      default:
         return nil
      }
   }
    

//    편집모드에서 셀의 순서를 바꾸는 것은 기본적으로 비활성화 되어있다.
//    여기에서 true를 리턴하면 모든 셀의 위치를 변경 가능하다
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
//        여기에서 false를 리턴하면 편집모드일때 좌측의 여백이 사라지게 됨
        return false
    }
    
    
//    이 메소드에서 실제 데이터를 이동시키는 메소드를 구현해야 한다. 이것만 만들면 옆에 석삼짜(reording 컨트롤만 생김)
//    이동하긴 하나 셀이동과 애니메이션만 되고 다시 로드하면 원상복귀된다.
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var target: String? = nil
        
        switch sourceIndexPath.section {
        case 0:
            target = firstList.remove(at: sourceIndexPath.row)
        case 1:
            target = secondList.remove(at: sourceIndexPath.row)
        case 2:
            target = thirdList.remove(at: sourceIndexPath.row)
        default:
            break
        }
        guard let item = target else {return}
        
        switch destinationIndexPath.section {
        case 0:
            firstList.insert(item, at: destinationIndexPath.row)
        case 1:
            secondList.insert(item, at: destinationIndexPath.row)
        case 2:
            thirdList.insert(item, at: destinationIndexPath.row)
        default:
            break
        }
    }
    
    
}


extension ReorderingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
//        단순히 none만 리턴하면 옆에 여백이 생겨버림 -> data socurce 익스텐션에 메소드를 추가해서 해결가능
        return .none
    }
    
    func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
//        두번째 파라미터를 리턴하면 이동하지 못하고 그대로 들어오게 된다. 시작 인덱스를 리턴하기 때문에
        if proposedDestinationIndexPath.section == 0 {
            return sourceIndexPath
        }
        return proposedDestinationIndexPath
    }
}
