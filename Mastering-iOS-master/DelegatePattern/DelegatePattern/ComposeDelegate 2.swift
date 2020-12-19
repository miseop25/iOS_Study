//
//  ComposeDelegate.swift
//  DelegatePattern
//
//  Created by Minseop Kim on 2020/05/06.
//  Copyright © 2020 Keun young Kim. All rights reserved.
//

import UIKit

protocol ComposeDelegate {
    func composer(_ vc: UIViewController, didInput value: String?)
    func composerDidCancel(_ vc: UIViewController)
}
