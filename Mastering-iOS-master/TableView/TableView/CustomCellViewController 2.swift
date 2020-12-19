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


class CustomCellViewController: UIViewController {
   
    @IBOutlet weak var listTableView: UITableView!
    
    
    let list = WorldTime.generateData()
   
   override func viewDidLoad() {
      super.viewDidLoad()
    
    let cellNib = UINib(nibName: "sharedCustomCell", bundle: nil)
    listTableView.register(cellNib, forCellReuseIdentifier: "sharedCustomCell")
      
   }
}



extension CustomCellViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return list.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "sharedCustomCell", for: indexPath) as! TimeTableViewCell

      let target = list[indexPath.row]
    //    View Tagging 방식으로 진행할 경우 뭐가 뭔지 잘 모를수 있다. -> 복잡해진다. 아울렛을 이용하는 방식으로 진행
    //    if let dateLabel = cell.viewWithTag(100) as? UILabel {
    //        dateLabel.text = "\(target.date) \(target.hoursFromGMT)HRS"
    //    }
    //    if let locationLabel = cell.viewWithTag(200) as? UILabel {
    //        locationLabel.text = target.location
    //    }
    //    if let timeLabel = cell.viewWithTag(300) as? UILabel {
    //        timeLabel.text = target.time
    //
    //    }
    
//    새로운 클래스를 생성하고 아울렛을 연결해 주어야해서 번거롭지만 더 복잡해질 경우에는 이게 더 용이하다.
    cell.dateLabel.text = "\(target.date), \(target.hoursFromGMT)HRS"
    cell.locationLabel.text = target.location
    cell.timeLabel.text = target.time
    
    



      return cell
   }
}
