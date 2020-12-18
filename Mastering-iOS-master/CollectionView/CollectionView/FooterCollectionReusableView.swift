//
//  FooterCollectionReusableView.swift
//  CollectionView
//
//  Created by Minseop Kim on 2020/12/18.
//  Copyright © 2020 Keun young Kim. All rights reserved.
//

import UIKit

class FooterCollectionReusableView: UICollectionReusableView {

    var sectionFooterLabel: UILabel!
    
    private func setup() {
        let lb1 = UILabel(frame: bounds)
        lb1.translatesAutoresizingMaskIntoConstraints = false
        lb1.font = UIFont.boldSystemFont(ofSize: 20)
        lb1.textColor = UIColor.black
        addSubview(lb1)
        
        if #available(iOS 11.0, *) {
            lb1.leadingAnchor.constraintEqualToSystemSpacingAfter(leadingAnchor, multiplier: 1.0 ).isActive = true
        } else {
            // Fallback on earlier versions
            lb1.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        }
        lb1.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        sectionFooterLabel = lb1
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
}
