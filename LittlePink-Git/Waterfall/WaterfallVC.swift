//
//  WaterfallVC.swift
//  LittlePink-Git
//
//  Created by Chloe Lauren on 12/15/24.
//

import CHTCollectionViewWaterfallLayout
import UIKit
import XLPagerTabStrip

//private let reuseIdentifier = "Cell"  // SB 直接注册，不再手动注册

class WaterfallVC: UICollectionViewController {
    var channel = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout =
            collectionView.collectionViewLayout
            as! CHTCollectionViewWaterfallLayout  //  用 as! 专门指定为包的类型，才能在下面修改包定义的一些属性
        layout.columnCount = 2  // 2列
        layout.minimumColumnSpacing = kWaterfallPadding  // 列间距
        layout.minimumInteritemSpacing = kWaterfallPadding  // 行间距
        layout.sectionInset = UIEdgeInsets(
            top: 0, left: kWaterfallPadding,
            bottom: kWaterfallPadding, right: kWaterfallPadding)  // 和屏幕边缘的边距
        layout.itemRenderDirection = .shortestFirst  // 优先补全短的列

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(
        _ collectionView: UICollectionView, numberOfItemsInSection section: Int
    ) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 13
    }

    override func collectionView(
        _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        // Configure the cell
        let cell =
            collectionView.dequeueReusableCell(
                withReuseIdentifier: kWaterfallCellVCID, for: indexPath)
            as! WaterfallCell
        cell.imageview.image = UIImage(named: "\(indexPath.item + 1)")

        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {

    }
    */

}

// MARK: - CHTCollectionViewDelegateWaterfallLayout
extension WaterfallVC: CHTCollectionViewDelegateWaterfallLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        // 先去找到数据源，再取得它的CGSize，最后返回即可
        UIImage(named: "\(indexPath.item + 1)")!.size  // 强制解包，仅供暂时演示没问题

    }
}

// MARK: - XLPagerTabStrip
extension WaterfallVC: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController)
        -> IndicatorInfo
    {
        IndicatorInfo(title: channel)
    }
}
