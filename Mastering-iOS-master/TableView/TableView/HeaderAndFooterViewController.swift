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

class SectionHeaderAndFooterViewController: UIViewController {
   
   @IBOutlet weak var listTableView: UITableView!
   
   let list = Region.generateData()
   
    override func viewDidLoad() {
        super.viewDidLoad()
//        header를 커스텀마이징 할때는 두가지 방법이 있다.
//        1. 직접 클래스를 호출해서 구성하는 방법
//        2. nib 파일을 통해서 구성하는 방법이 있다.
        let headerNib = UINib(nibName: "customHeader", bundle: nil)
        
        listTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "customHeader")
    
    
      
   }
}


extension SectionHeaderAndFooterViewController: UITableViewDataSource {
   func numberOfSections(in tableView: UITableView) -> Int {
      return list.count
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return list[section].countries.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      
      let target = list[indexPath.section].countries[indexPath.row]
      cell.textLabel?.text = target
      
      return cell
   }

    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return list[section].title
//    }
    
    
}

extension SectionHeaderAndFooterViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "customHeader") as! CustomHeaderView
        
        headerView.titleLabel.text = list[section].title
        headerView.countLabel.text = "\(list[section].countries.count)"
//        headerView?.textLabel?.text = list[section].title
//        headerView?.detailTextLabel?.text = "Lorem Ipsum" // 이 레이블은 그룹스타일에서만 적용됨
//        //        headerView?.backgroundColor = UIColor.darkGray
//        //        백그라운드를 직접 지정하지 않고 새로운 view를 하나 생성한 후 진행하라고 컴파일러가 함
//        let v = UIView(frame: .zero)
//        v.backgroundColor = UIColor.darkGray
//        v.isUserInteractionEnabled = false
//        //        터치를 진행하지 않을경우에는 위 속성을 false로 지정하는 것이 좋다.
//        headerView?.backgroundView = v

        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

//        if let headerView = view as? UITableViewHeaderFooterView {
//            
//            headerView.textLabel?.textColor = UIColor.white
//            headerView.textLabel?.textAlignment = .center
//            
//            headerView.detailTextLabel?.textColor = UIColor.white
//            headerView.detailTextLabel?.textAlignment = .center
//        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        헤더를 표시하기 전에 호츌
//        고정된 값을 리턴할 수도 있고 오토메틱도 설정 할 수 있음
        return 80
    }
  
}














