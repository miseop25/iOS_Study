//
//  ViewController.swift
//  HelloXcode
//
//  Created by Minseop Kim on 2020/05/03.
//  Copyright © 2020 Minseop Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var btn: UIButton!
    
    @IBAction func updateLabel(_ sender: Any) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn.backgroundColor = UIColor.red

    }
    

}
