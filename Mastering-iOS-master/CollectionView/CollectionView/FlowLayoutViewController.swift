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

class FlowLayoutViewController: UIViewController {
   
   @IBOutlet weak var listCollectionView: UICollectionView!
   
   let list = MaterialColorDataSource.generateMultiSectionData()
   
   @objc func toggleScrollDirection() {
    guard let layout = listCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return}
    
//    애니메이션 효과 부여
    listCollectionView.performBatchUpdates( {
        layout.scrollDirection = layout.scrollDirection == .vertical ? .horizontal : .vertical }, completion: nil)

   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(toggleScrollDirection))
        
    if let layout = listCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
    }
      
   }
}


extension FlowLayoutViewController: UICollectionViewDataSource {
   func numberOfSections(in collectionView: UICollectionView) -> Int {
      return list.count
   }
   
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return list[section].colors.count
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
      cell.contentView.backgroundColor = list[indexPath.section].colors[indexPath.row]
      
      return cell
   }
}

extension FlowLayoutViewController: UICollectionViewDelegateFlowLayout {
    
//    컬렉션 뷰가 셀을 리턴하기 전에 크기를 설정하기 위해 호출된다. 여기에서의 설정값은 앞에서 미리 설정해 놓은 값보다 우선순위가 높다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return CGSize.zero
        }
        
        
        
        var bounds = collectionView.bounds
        bounds.size.height += bounds.origin.y
        
        var width = bounds.width - (layout.sectionInset.left + layout.sectionInset.right)
        var heigth = bounds.height - (layout.sectionInset.top + layout.sectionInset.bottom)
        
        switch layout.scrollDirection {
        case .vertical:
            heigth = (heigth - (layout.minimumLineSpacing*4) ) / 5
            if indexPath.item > 0 {
                width = (width - (layout.minimumInteritemSpacing * 2)) / 3
            }
        case .horizontal :
            width = (width - (layout.minimumLineSpacing * 2)) / 3
            if indexPath.item > 0 {
                heigth = (heigth - (layout.minimumInteritemSpacing * 4))/5
            }
        }
        
        return CGSize(width: width.rounded(.down), height: heigth.rounded(.down))
        
    }
    
////    셀 여백값이 필요할 때 마다 이 메소드를 호출한다
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 5
//    }
//
////    라인 여백이 필요할 때 마다 이 메소드를 호출, 별도로 라인 여뱍을 줄 수 있다.
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 5
//    }
//
////    이 메소드는 세션 여백을 설정하는 메소드
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
//    }
    
    
}
















