//
//  SampleVC.swift
//  xibTestProject
//
//  Created by Minseop Kim on 2021/07/21.
//

import UIKit

class SampleVC : UIViewController
{
    @IBOutlet weak var MyButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        MyButton.setTitle("TEST BUTTON", for: .normal)
    }
}

