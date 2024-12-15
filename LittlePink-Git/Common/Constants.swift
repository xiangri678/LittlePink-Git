//
//  Constants.swift
//  LittlePink-Git
//
//  Created by Chloe Lauren on 12/10/24.
//

import UIKit

// 因为页面都是在SB创建的，所以在代码中找到各个对象的方法就是在SB里设ID，然后代码中引用ID
// MARK: SB
let kFollowVCID = "FollowVCID"
let kNearByVCID = "NearByVCID"
let kDiscoveryVCID = "DiscoveryVCID"
let kWaterfallVCID = "WaterfallVCID"

// MARK: Waterfall
let kWaterfallCellVCID = "WaterfallCellID"
let kWaterfallPadding: CGFloat = 4 // 多次使用该间距值，所以定义为常量

let kChannels = ["推荐","旅行","娱乐","才艺","彩妆","白富美","美食","萌宠"] // 暂时写成常量，后面再改成从服务器获取
