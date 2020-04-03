//
//  PoPUPViewController.swift
//  practicePopupView
//
//  Created by IJ . on 2020/03/28.
//  Copyright © 2020 jun. All rights reserved.
//

import UIKit

class PoPUPViewController: UIViewController {

    @IBOutlet weak var testView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        testView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector(("backgroundTap:"))))
      
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func backgroundTap(_ sender: UITapGestureRecognizer){
        self.dismiss(animated: true, completion: nil)
        print(11111)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first?.view == testView {
            return
        }
         self.dismiss(animated: true, completion: nil)
    }
    
}
