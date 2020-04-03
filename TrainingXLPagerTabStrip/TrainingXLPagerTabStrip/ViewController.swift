//
//  ViewController.swift
//  TrainingXLPagerTabStrip
//
//  Created by IJ . on 2020/04/03.
//  Copyright © 2020 jun. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ViewController: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        self.settings.style.buttonBarItemBackgroundColor = UIColor.white
                self.settings.style.buttonBarItemTitleColor = UIColor.init(red: 213.0/255.0, green: 213.0/255.0, blue: 213.0/255.0, alpha: 1)
                //선택된거 검은색 없음
                self.settings.style.buttonBarBackgroundColor = UIColor.white
        //            UIColor.init(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1)
                
                self.settings.style.selectedBarBackgroundColor = UIColor.init(red: 19.0/255.0, green: 139.0/255.0, blue: 255.0/255.0, alpha: 1)
                self.settings.style.selectedBarHeight = 2.0
                
        self.settings.style.buttonBarHeight = 130
                
                changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
                    guard changeCurrentIndex == true else { return }
                    
                    oldCell?.label.textColor = UIColor.init(red: 213.0/255.0, green: 213.0/255.0, blue: 213.0/255.0, alpha: 1)
                    newCell?.label.textColor = UIColor.black
                    
                   
                }
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child1 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChildVC") as! ChildViewController
           child1.childNumber = "One"

           let child2 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChildVC") as! ChildViewController
           child2.childNumber = "Two"

           return [child1, child2]
    }

}

