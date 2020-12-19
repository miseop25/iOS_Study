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

class SelectionViewController: UIViewController {
   
   lazy var list: [MaterialColorDataSource.Color] = {
      (0...2).map { _ in
         return MaterialColorDataSource.generateSingleSectionData() }.reduce([], +)
   }()
   
   lazy var checkImage: UIImage? = UIImage.init(named: "checked")
   
   @IBOutlet weak var listCollectionView: UICollectionView!
   
   func selectRandomItem() {
    let item = Int(arc4random_uniform(UInt32(list.count)))
    let targetIndexPath = IndexPath(item: item, section: 0)
    
    listCollectionView.selectItem(at: targetIndexPath, animated: true, scrollPosition: .centeredHorizontally)
    view.backgroundColor = list[targetIndexPath.item].color
    
   }
   
   func reset() {
//    listCollectionView.deselectItem(at: <#T##IndexPath#>, animated: <#T##Bool#>)
    listCollectionView.selectItem(at: nil, animated: true, scrollPosition: .left)
    let firstIndexPath = IndexPath(item: 0, section: 0)
    listCollectionView.scrollToItem(at: firstIndexPath, at: .left, animated: true)
    view.backgroundColor = UIColor.white
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showMenu))
      
    listCollectionView.allowsSelection = true //  선택 모드는 이 속성을 통해서 선택 가능
    listCollectionView.allowsMultipleSelection = false // 멀티 셀렉션 모드를 사용할때 사용한다.
    
    
    
      
   }
}



extension SelectionViewController: UICollectionViewDataSource {
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return list.count
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
      cell.contentView.backgroundColor = list[indexPath.row].color
      
      return cell
   }
}







extension SelectionViewController {
   @objc func showMenu() {
      let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
      
      let randomAction = UIAlertAction(title: "Select Random Item", style: .default) { [weak self] (action) in
         self?.selectRandomItem()
      }
      actionSheet.addAction(randomAction)
      
      let resetPositionAction = UIAlertAction(title: "Reset", style: .default) { [weak self] (action) in
         self?.reset()
      }
      actionSheet.addAction(resetPositionAction)
      
      let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
      actionSheet.addAction(cancelAction)
      
      present(actionSheet, animated: true, completion: nil)
   }
}


extension SelectionViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 셀이 선택된 이후에 호출된다. 선택된 셀의 위치는 indexPath를 통해 확인 가능하다.
        let color = list[indexPath.item].color
        view.backgroundColor = color
        print("#1", indexPath, #function)
        
//        if let cell = collectionView.cellForItem(at: indexPath){
//            if let imageView = cell.contentView.viewWithTag(100) as? UIImageView{
//                imageView.image = checkImage
//            }
//        }
//        하이라이트드 이미지를 활용하면 위 주석친 코드와 동일한 결과를 얻을 수 있긴함
        
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
//        셀이 선택될때 실행된다. true 리턴시 선택되어 작동하는 방식이다.
        print("#2", indexPath, #function)
        guard let list = collectionView.indexPathsForSelectedItems else {
            return true
        }
        return !list.contains(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
//        선택되어 있는 셀을 선택 해제 하기 전에 호출된다. true 리턴이 선택이 해제된다.
            
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        실제로 선택이 해제된 후에 호출된다. 선택이 해제된 후 UI를 업데이트 할때 활용 할 수 있다.
//        if let cell = collectionView.cellForItem(at: indexPath){
//            if let imageView = cell.contentView.viewWithTag(100) as? UIImageView{
//                imageView.image = nil
//            }
//        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
//        셀을 강조하기 전에 호출된다. true를 리턴하면 셀이 강조된다
//        셀이 강조될 수 없으면 선택할 수도 없다.
        print("#3", indexPath, #function)
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
//        셀이 강조된 이후에 호출된다.
        print("#4", indexPath, #function)
        
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.layer.borderWidth = 6
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
//        셀 강조가 해제된 이후에 호출된다.
        print("#5", indexPath, #function)
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.layer.borderWidth = 0.0
            
        }
    }

    
    
    
}









