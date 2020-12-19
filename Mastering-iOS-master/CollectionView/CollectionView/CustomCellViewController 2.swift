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
   
   let list = MaterialColorDataSource.generateSingleSectionData()
   
   @IBOutlet weak var listCollectionView: UICollectionView!
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? UICollectionViewCell else {
            return
        }
        guard let indexPath = listCollectionView.indexPath(for: cell) else {
            return
        }
        let target = list[indexPath.item]
        segue.destination.view.backgroundColor = target.color
        segue.destination.title = target.title
    }
    
   
   override func viewDidLoad() {
      super.viewDidLoad()
//    listCollectionView.visibleCells 현재 컬렉션 뷰에 있는 셀 목록을 배열로 return
//    listCollectionView.cellForItem(at: 0) // 특정 위치에 있는 셀을 리턴
//    listCollectionView.indexPath(for: <#T##UICollectionViewCell#>)// 셀 위치를 확인할때
    
      
   }
}

extension CustomCellViewController: UICollectionViewDataSource {
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return list.count
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ColorCollectionViewCell
    
    let target = list[indexPath.item]
    cell.colorView.backgroundColor = target.color
    cell.hexLevel.text = target.hex
    cell.nameLabel.text = target.title
      
      return cell
   }
}

extension CustomCellViewController: UICollectionViewDelegateFlowLayout {
    //    컬렉션 뷰가 셀을 리턴하기 전에 크기를 설정하기 위해 호출된다. 여기에서의 설정값은 앞에서 미리 설정해 놓은 값보다 우선순위가 높다.
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else {
                return CGSize.zero
            }
            
            var bounds = collectionView.bounds
            bounds.size.height += bounds.origin.y
            
            var width = bounds.width - (layout.sectionInset.left + layout.sectionInset.right)
            var heigth = bounds.height - (layout.sectionInset.top + layout.sectionInset.bottom)
            
            switch UIDevice.current.orientation.isLandscape {
            case true:
                heigth = (heigth - (layout.minimumLineSpacing*4) ) / 3
                width = (width - (layout.minimumInteritemSpacing * 2)) / 3
            case false :
                heigth = (heigth - (layout.minimumLineSpacing*4) ) / 6
                width = (width - (layout.minimumInteritemSpacing * 2)) / 2
            }
            
            return CGSize(width: width.rounded(.down), height: heigth.rounded(.down))
            
        }
        
    
}
