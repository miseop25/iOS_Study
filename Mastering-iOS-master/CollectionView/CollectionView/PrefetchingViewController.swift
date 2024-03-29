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

class PrefetchingViewController: UIViewController {
   
   @IBOutlet weak var listCollectionView: UICollectionView!
   
   lazy var refreshControl: UIRefreshControl = { [weak self] in
      let control = UIRefreshControl()
    control.tintColor = self?.view.tintColor
      return control
      }()
   
   @objc func refresh() {
      DispatchQueue.global().async { [weak self] in
         guard let strongSelf = self else { return }
         strongSelf.list = Landscape.generateData()
         strongSelf.downloadTasks.forEach { $0.cancel() }
         strongSelf.downloadTasks.removeAll()
         Thread.sleep(forTimeInterval: 2)
         
         DispatchQueue.main.async {
            strongSelf.listCollectionView.reloadData()
            strongSelf.listCollectionView.refreshControl?.endRefreshing()
         }
      }
   }
   
   var list = Landscape.generateData()
   var downloadTasks = [URLSessionTask]()
   
   override func viewDidLoad() {
      super.viewDidLoad()
    listCollectionView.prefetchDataSource = self
    
    listCollectionView.refreshControl = refreshControl
    refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    
      
   }
}
extension PrefetchingViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
//        미리 준비해야 하는 셀을 판단하고 이 메소드를 호출한다.
        for indexPath in indexPaths {
            downloadImage(at: indexPath.item)
            
        }
        print(#function, indexPaths)
    }
    
    
}


extension PrefetchingViewController: UICollectionViewDataSource {
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return list.count
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
      
      if let imageView = cell.viewWithTag(100) as? UIImageView {
         if let image = list[indexPath.row].image {
            imageView.image = image
         } else {
            imageView.image = nil
            downloadImage(at: indexPath.row)
         }
      }
      
      return cell
   }
}


extension PrefetchingViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        이 메소드는 셀이 화면에 표시되기 직전에 표시된다.
        if let imageView = cell.viewWithTag(100) as? UIImageView {
           if let image = list[indexPath.row].image {
              imageView.image = image
           } else {
              imageView.image = nil
           }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
//        프리페칭 대상에서 제외된 셀이 있을때마다 호출된다.
        print(#function, indexPaths)
        for indexPath in indexPaths {
            cancelDownload(at: indexPath.item)
        }
    }
    
    
    
    
}


extension PrefetchingViewController {
   func downloadImage(at index: Int) {
      guard list[index].image == nil else {
//        이미 다운로드 한 경우를 방지
         return
      }
      
      let targetUrl = list[index].url
      guard !downloadTasks.contains(where: { $0.originalRequest?.url == targetUrl }) else {
//        중복 다운로드 방지
         return
      }
      
      print(#function, index)
      
      let task = URLSession.shared.dataTask(with: targetUrl) { [weak self] (data, response, error) in
         if let error = error {
            print(error.localizedDescription)
            return
         }
         
         if let data = data, let image = UIImage(data: data), let strongSelf = self {
            strongSelf.list[index].image = image
            let reloadTargetIndexPath = IndexPath(row: index, section: 0)
            DispatchQueue.main.async {
               if strongSelf.listCollectionView.indexPathsForVisibleItems.contains(reloadTargetIndexPath) == .some(true) {
                  strongSelf.listCollectionView.reloadItems(at: [reloadTargetIndexPath])
               }
            }
            
            strongSelf.completeTask()
         }
      }
      task.resume()
      downloadTasks.append(task)
   }
   
   func completeTask() {
      downloadTasks = downloadTasks.filter { $0.state != .completed }
   }
   
   func cancelDownload(at index: Int) {
      let targetUrl = list[index].url
      guard let taskIndex = downloadTasks.index(where: { $0.originalRequest?.url == targetUrl }) else {
         return
      }
      let task = downloadTasks[taskIndex]
      task.cancel()
      downloadTasks.remove(at: taskIndex)
   }
}




