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

class EditModeViewController: UIViewController {
   
   var editingSwitch: UISwitch!
   @IBOutlet weak var listTableView: UITableView!
   
   var productList = ["iMac Pro", "iMac 5K", "Macbook Pro", "iPad Pro", "iPhone X", "Mac mini", "Apple TV", "Apple Watch"]
   var selectedList = [String]()
   
   @objc func toggleEditMode(_ sender: UISwitch) {
    listTableView.setEditing(sender.isOn, animated: true)
      
   }
   
   @objc func emptySelectedList() {
    
    productList.append(contentsOf: selectedList)
    selectedList.removeAll()
    productList =  productList.sorted()
    
//    배치방식으로 진행하는 것은 비긴 엔드가 필요 없다.
//    listTableView.beginUpdates()
    listTableView.reloadSections(IndexSet(integersIn: 0...1), with: .automatic)
//    listTableView.endUpdates()
      
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      editingSwitch = UISwitch(frame: .zero)
      editingSwitch.addTarget(self, action: #selector(toggleEditMode(_:)), for: .valueChanged)
    
    editingSwitch.isOn = listTableView.isEditing
      
      let deleteButton = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(emptySelectedList))
      deleteButton.tintColor = UIColor.red
      
      navigationItem.rightBarButtonItems = [deleteButton, UIBarButtonItem(customView: editingSwitch)]
   }
}


extension EditModeViewController: UITableViewDataSource {
   func numberOfSections(in tableView: UITableView) -> Int {
      return 2
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      switch section {
      case 0:
         return selectedList.count
      case 1:
         return productList.count
      default:
         return 0
      }
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      
      switch indexPath.section {
      case 0:
         cell.textLabel?.text = selectedList[indexPath.row]
      case 1:
         cell.textLabel?.text = productList[indexPath.row]
      default:
         break
      }
      
      return cell
   }
   
   func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      switch section {
      case 0:
         return "Selected List"
      case 1:
         return "Product List"
      default:
         return nil
      }
   }
    
//    true를 리턴하면 편집하여 삭제할 수 있지만 False를 리턴할경우 삭제하지 못한다.
//    특정셀을 편집하지 못하도록 할때에 이 기능을 사용한다. 모든셀을 편집할 수 있다면 직접 구현할 필요는 없다.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        if indexPath.row == 0 {
//            return false
//        }
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        두번째 파라미터를 통해서 어떤 버튼을 선택했는지 알 수 있다.
//        실제 삭제나 추가는 테이블뷰가 자동으로 처리할 수 없기 때문에 모든 부분은 직접 구현해야 한다.
        switch editingStyle {
        case .insert:
            let target = productList[indexPath.row]
            let insertIndexPath = IndexPath(row: selectedList.count, section: 0)
            selectedList.append(target)
            productList.remove(at: indexPath.row)
            
            if #available(iOS 11.0, *) {
                listTableView.performBatchUpdates({
                    [weak self] in
                    self?.listTableView.insertRows(at: [insertIndexPath], with: .automatic)
                    self?.listTableView.deleteRows(at: [indexPath], with: .automatic)
                }, completion: nil)
            } else {
//            첫번째 파라미터에 어디에 추가할 것인지, 두번째 파라미터는 애니메이션 효과이다.
//            테이블뷰가 인덱스가 변경되면 에러가 발생한다 - 삭제했을때 충돌발생, 실제 데이터 숫자와 셀숫자가 일치하도록
//            구현해야 한다. -> 비긴업데이트, 엔드업데이트 진행해야 한다. 배치방식으로 실행
                listTableView.beginUpdates()
                listTableView.insertRows(at: [insertIndexPath], with: .automatic)
                listTableView.deleteRows(at: [indexPath], with: .automatic)
                listTableView.endUpdates()
            }
            
            

        case .delete:
            let target = selectedList[indexPath.row]
            let insertIndexPath = IndexPath(row: productList.count, section: 1)
            
            productList.append(target)
            selectedList.remove(at: indexPath.row)
            
            if #available(iOS 11.0, *) {
                listTableView.performBatchUpdates({
                    [weak self] in
                    self?.listTableView.deleteRows(at: [indexPath], with: .automatic)
                    self?.listTableView.insertRows(at: [insertIndexPath], with: .automatic)
                }, completion: nil)
            } else {
                // Fallback on earlier versions
                listTableView.beginUpdates()
                listTableView.insertRows(at: [insertIndexPath], with: .automatic)
                listTableView.deleteRows(at: [indexPath], with: .automatic)
                listTableView.endUpdates()
            }
        default:
            break
        }
    }
}


extension EditModeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        switch indexPath.section {
        case 0:
            return .delete
        case 1:
            return .insert
        default:
//            순서변경을 진해할 때 삭제버튼이나 추가버튼을 비활성화 하기 위해서 진행한다.
            return .none
        }
    }
    
//    스와이프 인덱스가 작동할때 시작한다.
    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        editingSwitch.setOn(true, animated: true)
    }
//    스와이프 딜리트 모드가 종료될때 진행된다.
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        editingSwitch.setOn(false, animated: true)
    }
    
    
//    스와이프 딜리트 할때 뜨는 언어를 설정할 수 있다.
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제할거지롱"
    }
    
    
}


















