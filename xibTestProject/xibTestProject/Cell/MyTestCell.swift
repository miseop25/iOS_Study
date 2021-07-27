//
//  MyTestCell.swift
//  xibTestProject
//
//  Created by Minseop Kim on 2021/07/24.
//

import UIKit

class MyTestCell: UICollectionViewCell {

    @IBOutlet weak var personName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 2
        
        personName.heightAnchor.constraint(equalToConstant:  CGFloat(20)).isActive = true
        
    }

}
