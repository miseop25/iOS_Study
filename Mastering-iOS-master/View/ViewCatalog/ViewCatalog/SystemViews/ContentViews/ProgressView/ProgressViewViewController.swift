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

class ProgressViewViewController: UIViewController {
   
    @IBOutlet weak var update: UIButton!
    
    @IBOutlet weak var progressOutlat: UIProgressView!
    
    
    @IBAction func updateAction(_ sender: Any) {
        progressOutlat.setProgress(progressOutlat.progress + 0.2, animated: true)
    }
    
    @IBAction func resetBut(_ sender: Any) {
        progressOutlat.setProgress(0.0, animated: true)
    }
    
    override func viewDidLoad() {
      super.viewDidLoad()
      
        progressOutlat.progress = 0.0
        
        progressOutlat.trackTintColor = UIColor.black
        progressOutlat.progressTintColor = UIColor.red
        
        
   }
}
