//
//  MyViewController.swift
//  VC
//
//  Created by Minseop Kim on 2021/01/06.
//  Copyright © 2021 Keun young Kim. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func fromCode(_ sender: Any) {
        let vc = CustomNibViewController(nibName: "CustomNibViewController", bundle: nil)
//        vc.view.backgroundColor = UIColor.red
        
        navigationController?.pushViewController(vc, animated: true)
    }
    

}
