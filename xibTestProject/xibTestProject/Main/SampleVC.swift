//
//  SampleVC.swift
//  xibTestProject
//
//  Created by Minseop Kim on 2021/07/21.
//

import UIKit


let nameList = ["김민섭", "주성민", "노준호", "석상우"]
let colorList = [UIColor.blue, UIColor.orange ,UIColor.green, UIColor.systemPink]

class SampleVC : UIViewController
{
    @IBOutlet weak var MyButton: UIButton!
    @IBOutlet weak var TestCollectionView: UICollectionView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        MyButton.setTitle("TEST BUTTON", for: .normal)
        TestCollectionView.delegate = self
        TestCollectionView.dataSource = self
        TestCollectionView.register(UINib(nibName: "MyTestCell", bundle: .main), forCellWithReuseIdentifier: "MyTestCell")
        setUpFlowLayout()
    }
    
    private func setUpFlowLayout()
    {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets.zero
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10
        
        let halfWidth = UIScreen.main.bounds.width / 4
        flowLayout.itemSize = CGSize(width: halfWidth * 0.9, height: halfWidth * 0.9)
        self.TestCollectionView.collectionViewLayout = flowLayout
    }
}

extension SampleVC : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = TestCollectionView.dequeueReusableCell(withReuseIdentifier: "MyTestCell", for: indexPath) as? MyTestCell else
        {
            return UICollectionViewCell()
        }
        
        cell.personName.text = nameList[indexPath.row]
        cell.backgroundColor =  colorList[indexPath.row]
        return cell
    }
    
    
    
}

extension SampleVC : UICollectionViewDelegate
{
    
    
}
