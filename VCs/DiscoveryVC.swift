//
//  DiscoveryVC.swift
//  LittlePink-Git
//
//  Created by Chloe Lauren on 12/10/24.
//

import UIKit
import XLPagerTabStrip

class DiscoveryVC: ButtonBarPagerTabStripViewController,IndicatorInfoProvider {

    override func viewDidLoad() {
        settings.style.selectedBarHeight = 0
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarItemFont = .systemFont(ofSize: 14)
        settings.style.buttonBarHeight = 34
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        containerView.bounces = false // 最左右页面不可弹性滑动        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            
            oldCell?.label.textColor = .secondaryLabel
            newCell?.label.textColor = .label
            
            // 不使用缩放效果，字保持一样大
//            if animated {
//                UIView.animate(withDuration: 0.1, animations: { () -> Void in
//                    newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//                    oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
//                })
//            }
//            else {
//                newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//                oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
//            }
        }
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        var vcs: [UIViewController] = []
        for channel in kChannels { // 生成发现页的子视图，很多个主题分别的瀑布流
            let vc = storyboard!.instantiateViewController(withIdentifier: kWaterfallVCID) as! WaterfallVC
            vc.channel = channel
            vcs.append(vc)
        }
        return vcs
        
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        IndicatorInfo(title: "发现")
    }

}
