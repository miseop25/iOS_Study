//
//  SampleVC.swift
//  xibTestProject
//
//  Created by Minseop Kim on 2021/07/21.
//

import UIKit


let nameList = ["김민섭", "주성민", "노준호", "석상우", "두글", "한", "네글자다", "다섯글자다"]
let colorList = [UIColor.blue, UIColor.orange ,UIColor.green, UIColor.systemPink,UIColor.blue, UIColor.orange ,UIColor.green, UIColor.systemPink]

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
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        self.TestCollectionView.collectionViewLayout = flowLayout
    }
}

extension SampleVC : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = TestCollectionView.dequeueReusableCell(withReuseIdentifier: "MyTestCell", for: indexPath) as? MyTestCell else
        {
            return UICollectionViewCell()
        }
        
        cell.personName.text = nameList[indexPath.row]
        cell.personName.textAlignment = .center
        cell.personName.textColor = .white
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        
        cell.backgroundColor =  colorList[indexPath.row]
        return cell
    }
    
    
    
}

extension SampleVC : UICollectionViewDelegate
{
    
    
}
