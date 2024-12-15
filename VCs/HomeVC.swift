//
//  HomeVC.swift
//  LittlePink-Git
//
//  Created by Chloe Lauren on 12/10/24.
//

import UIKit
import XLPagerTabStrip

class HomeVC: ButtonBarPagerTabStripViewController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        // 1. 整体的bar，在SB里设
        
        // 2. 自定义selectedBar 下方的条
        settings.style.selectedBarBackgroundColor = UIColor(named: "main")!
        settings.style.selectedBarHeight = 3
        
        // 3. 自定义buttonBarItem 导航栏内的、文本或图片形式的按钮
        settings.style.buttonBarItemBackgroundColor = .clear// 这两种颜色可以自动适配深浅色模式
        settings.style.buttonBarItemFont = .systemFont(ofSize: 16)
        settings.style.buttonBarItemTitleColor = .label
        
        // 包的要求：配置完成后再加载 viewDidLoad
        super.viewDidLoad()

        containerView.bounces = false // 最左右页面不可弹性滑动
        // Do any additional setup after loading the view.
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }

            oldCell?.label.textColor = .secondaryLabel
            newCell?.label.textColor = .label

            // 小红书可能没有下面这个缩放效果
            if animated {
                UIView.animate(withDuration: 0.1, animations: { () -> Void in
                    newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                })
            }
            else {
                newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        }
//        DispatchQueue.main.async {
//            self.moveToViewController(at: 1, animated: false) // 默认选中第二个页面 在GH的issue中看到，必须主线程执行才有效！
//        }
    }
    

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        // 找到并关联上SB里定义的VC们。因为确定在SB里创建了，不会崩溃，所以直接强制解包 ！
        let followVC = storyboard!.instantiateViewController(withIdentifier: kFollowVCID)
        let nearByVC = storyboard!.instantiateViewController(withIdentifier: kNearByVCID)
        let discoveryVC = storyboard!.instantiateViewController(withIdentifier: kDiscoveryVCID)
        
        return [discoveryVC, nearByVC, followVC]
    }

}
