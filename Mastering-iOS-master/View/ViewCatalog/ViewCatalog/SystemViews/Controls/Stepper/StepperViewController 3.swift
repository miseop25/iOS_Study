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

class StepperViewController: UIViewController {
   
   @IBOutlet weak var valueLabel: UILabel!
   @IBOutlet weak var valueStepper: UIStepper!
   @IBOutlet weak var autorepeatSwitch: UISwitch!
   @IBOutlet weak var continuousSwitch: UISwitch!
   @IBOutlet weak var wrapSwitch: UISwitch!
   
   @IBAction func toggleAutorepeat(_ sender: UISwitch) {
    valueStepper.autorepeat = sender.isOn
   }
   
   @IBAction func toggleContinuous(_ sender: UISwitch) {
    valueStepper.isContinuous = sender.isOn
   }
   
   @IBAction func toggleWrap(_ sender: UISwitch) {
    valueStepper.wraps = sender.isOn
   }
   
    @IBAction func valueChanged(_ sender: UIStepper) {
        valueLabel.text = "\(sender.value)"
    }
    
   
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
    autorepeatSwitch.isOn = valueStepper.autorepeat
    wrapSwitch.isOn = valueStepper.wraps
    continuousSwitch.isOn = valueStepper.isContinuous
      
   }
}











