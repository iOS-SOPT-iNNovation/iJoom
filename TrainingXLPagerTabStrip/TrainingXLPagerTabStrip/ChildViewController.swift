//
//  ChildViewController.swift
//  TrainingXLPagerTabStrip
//
//  Created by IJ . on 2020/04/03.
//  Copyright © 2020 jun. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class ChildViewController: UIViewController, IndicatorInfoProvider {
    
    var childNumber: String = ""
    
    
    @IBOutlet weak var childNameLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        childNameLabel.text = childNumber
         
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
          return IndicatorInfo(title: "\(childNumber)")
      }
    

    
}
