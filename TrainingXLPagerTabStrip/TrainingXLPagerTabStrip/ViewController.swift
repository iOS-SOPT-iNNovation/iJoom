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
    
    //buttonBarView , (스크롤뷰 만들고,오토레이아웃잡고, 컨테이너뷰로만 연결해주면 끝)containerview 레퍼러싱아웃렛연결필수
    //
    
    override func viewDidLoad() {
        self.configureButtonBar()
        super.viewDidLoad()
        
        //view.bringtoSubviewfront(viewpager)
        //self.view.bringSubviewToFront(buttonBarView)
        
        //        self.settings.style.buttonBarItemBackgroundColor = UIColor.white
//        self.settings.style.buttonBarItemTitleColor = UIColor.init(red: 213.0/255.0, green: 213.0/255.0, blue: 213.0/255.0, alpha: 0)
        //        //선택된거 검은색 없음
//        self.settings.style.buttonBarBackgroundColor = UIColor.white
//        UIColor.init(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1)
//        self.settings.style.selectedBarBackgroundColor = UIColor.init(red: 19.0/255.0, green: 139.0/255.0, blue: 255.0/255.0, alpha: 1)
        //        self.settings.style.selectedBarHeight = 2.0
        //
        //        self.settings.style.buttonBarHeight = 60
        //
        //        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
        //            guard changeCurrentIndex == true else { return }
        //
        //            oldCell?.label.textColor = UIColor.init(red: 213.0/255.0, green: 213.0/255.0, blue: 213.0/255.0, alpha: 1)
        //            newCell?.label.textColor = UIColor.black
        //
        
        //        }
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child1 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChildVC") as! ChildViewController
        child1.childNumber = "One"
        
        let child2 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChildVC") as! ChildViewController
        child2.childNumber = "Two"
        
        return [child1, child2]
    }
    
    
    func configureButtonBar() {
        // Sets the background colour of the pager strip and the pager strip item
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        
        // Sets the pager strip item font and font color
        settings.style.buttonBarItemFont = UIFont(name: "Helvetica", size: 16.0)!
        settings.style.buttonBarItemTitleColor = .gray
        
        // Sets the pager strip item offsets
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        // Sets the height and colour of the slider bar of the selected pager tab
        settings.style.selectedBarHeight = 3.0
        settings.style.selectedBarBackgroundColor = .orange
        
        // Changing item text color on swipe
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .gray
            newCell?.label.textColor = .orange
        }
    }
    
    
}

