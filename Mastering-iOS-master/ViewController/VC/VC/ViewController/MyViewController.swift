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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func fromCode(_ sender: Any) {
        let vc = CustomNibViewController(nibName: "CustomNibViewController", bundle: nil)
//        vc.view.backgroundColor = UIColor.red
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
