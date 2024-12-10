//
//  HomeVC.swift
//  LittlePink-Git
//
//  Created by Chloe Lauren on 12/10/24.
//

import UIKit
import XLPagerTabStrip

class HomeVC: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        // 找到，关联上SB里定义的VC们。因为确定在SB里创建了，不会崩溃，所以直接改！
        let followVC = storyboard!.instantiateViewController(withIdentifier: kFollowVCID)
        let nearByVC = storyboard!.instantiateViewController(withIdentifier: kNearByVCID)
        let discoveryVC = storyboard!.instantiateViewController(withIdentifier: kDIscoveryVCID)
        
        return [followVC, nearByVC, discoveryVC]
    }

}
