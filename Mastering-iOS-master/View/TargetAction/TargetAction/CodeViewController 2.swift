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

class CodeViewController: UIViewController {
   
   @IBOutlet weak var btn: UIButton!
   
   @IBOutlet weak var slider: UISlider!
    
    func action() {
        
    }
    
    @objc func action(_ sender: Any) {
        
    }
    
    func action(_ sender: Any, forEvent event: UIEvent) {
        
    }
    
    @objc func sliderAction(_ sender: Any) {
        
    }
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
        
    let sel = #selector(action(_:))
    let sliderSel = #selector(sliderAction(_:))
    
    btn.addTarget(self, action: sel, for: .touchUpInside)
    slider.addTarget(self, action: sliderSel, for: .valueChanged)
    
    
      
   }
}
