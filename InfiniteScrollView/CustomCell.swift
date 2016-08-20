//
//  CustomCell.swift
//  InfiniteScrollView
//
//  Created by naru on 2016/07/18.
//  Copyright © 2016年 naru. All rights reserved.
//

import UIKit

class CustomCell: RepetitiousCollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.label)
    }
    
    required internal init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var label: UILabel = {
        let frame : CGRect = CGRect(x: 1.0, y: 1.0, width: self.contentView.frame.size.width - 2.0, height: self.contentView.frame.size.height - 2.0)
        let label: UILabel = UILabel(frame: frame)
        label.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        label.font = UIFont.systemFontOfSize(60.0, weight: UIFontWeightUltraLight)
        label.textColor = UIColor.whiteColor()
        label.textAlignment = .Center
        return label
    }()
}
