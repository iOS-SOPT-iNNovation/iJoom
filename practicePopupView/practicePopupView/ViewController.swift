//
//  ViewController.swift
//  practicePopupView
//
//  Created by IJ . on 2020/03/28.
//  Copyright © 2020 jun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var popUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpPopUpButton(_ sender: Any) {
        
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "PopUPVC") as? PoPUPViewController else { return  }
       // nextVC.view.backgroundColor = .green
        nextVC.modalPresentationStyle = .overCurrentContext //.overCurrentContext
       // nextVC.view.alpha = 0.3
           self.present(nextVC, animated: true)
        //self.navigationController?.present(nextVC, animated: false, completion: nil)
        
    }
    
}

