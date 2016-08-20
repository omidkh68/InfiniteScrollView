//
//  ViewController.swift
//  InfiniteScrollView
//
//  Created by naru on 2016/07/14.
//  Copyright © 2016年 naru. All rights reserved.
//

import UIKit

class ViewController: UIViewController, RepetitiousCollectionViewDataSource, RepetitiousCollectionViewDelegate {

    // MARK: Constants
    
    private struct Constants {
        static let NumberOfContents: Int = 20
        static let ItemSize: CGSize = CGSizeMake(120.0, 120.0)
        static let ScrollViewSize: CGSize = CGSize(width: UIScreen.mainScreen().bounds.size.width, height: Constants.ItemSize.height)
    }
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(self.scrollView)
        
        self.scrollView.dataSource = self
        self.scrollView.delegate = self
        self.scrollView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Element
    
    private lazy var scrollView: RepetitiousCollectionView = {
        let size: CGSize = Constants.ScrollViewSize
        let frame: CGRect = CGRect(x: 0.0, y: (UIScreen.mainScreen().bounds.size.height - size.height)/2.0, width: size.width, height: size.height)
        let scrollView: RepetitiousCollectionView = RepetitiousCollectionView(frame: frame)
        scrollView.backgroundColor = UIColor.whiteColor()
        scrollView.allowsMultipleSelection = true
        scrollView.registerClass(class: CustomCell.self, forCellReuseIdentifier: "cell")
        scrollView.autoresizingMask = [.FlexibleTopMargin, .FlexibleBottomMargin, .FlexibleWidth]
//        scrollView.cellTransform = { (range: CGFloat) -> CGAffineTransform in
//            let scale: CGFloat = exp(-pow(abs(range/(self.scrollView.frame.size.width/1.8)), 2.0))
//            return CGAffineTransformMakeScale(scale, scale)
//        }
//        scrollView.cellAlpha = { (range: CGFloat) -> CGFloat in
//            let alpha: CGFloat = 1.0 - abs(range/(self.scrollView.frame.size.width/1.8))
//            return alpha
//        }
        return scrollView
    }()
    
    let contents: [String] = {
        return (0..<Constants.NumberOfContents).map { (num: Int) -> String in
            return "\(num)"
        }
    }()
    
    let colors: [UIColor] = {
        return (0..<Constants.NumberOfContents).map { (num: Int) -> UIColor in
            let ratio: CGFloat = CGFloat(num)/CGFloat(Constants.NumberOfContents - 1)
            let red: CGFloat = 1.0 - ratio
            let green: CGFloat = (0.5 - abs(ratio - 0.5))*2.0
            let blue: CGFloat = ratio
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }()
    
    // MARK: Delegate, Data Source
    
    func repetitiousCollectionViewNumberOfItems(repetitiousCollectionView: RepetitiousCollectionView) -> Int {
        return Constants.NumberOfContents
    }
    
    func repetitiousCollectionView(repetitiousCollectionView: RepetitiousCollectionView, lengthOfItemAtIndex index: Int) -> CGFloat {
        return Constants.ItemSize.width
    }
    
    func repetitiousCollectionView(repetitiousCollectionView: RepetitiousCollectionView, cellAtIndex index: Int) ->  RepetitiousCollectionViewCell {
        let cell: CustomCell = repetitiousCollectionView.dequeueReusableCellWithIdentifier("cell") as! CustomCell
        self.configulerCell(cell, atIndex: index)
        return cell
    }
    
    func configulerCell(cell: CustomCell, atIndex index: Int) {
        cell.label.text = self.contents[index]
        cell.label.backgroundColor = self.colors[index]
    }
    
    func repetitiousCollectionView(repetitiousCollectionView: RepetitiousCollectionView, willDisplayCell cell: RepetitiousCollectionViewCell, forItemAtIndex index: Int) {
        
    }
    
    func repetitiousCollectionView(repetitiousCollectionView: RepetitiousCollectionView, didEndDisplaying cell: RepetitiousCollectionViewCell, forItemAtIndex index: Int) {
        
    }
    
    func repetitiousCollectionView(repetitiousCollectionView: RepetitiousCollectionView, didFocusCell cell: RepetitiousCollectionViewCell, forItemAtIndex index: Int) {
        debugPrint("Did Focus Cell at \(index)")
    }
}

