//
//  ViewController.swift
//  TestDemo
//
//  Created by Xinxibin on 2017/8/31.
//  Copyright © 2017年 xiaoxin. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var label: ZCAnimatedLabel!
    
    var imageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("viewDidLoad \(Date())");

        
        imageView = UIImageView(image: UIImage(named: "launchScreen"));
        imageView?.frame = self.view.bounds
        self.view.addSubview(imageView!)
        
        self.label = ZCTransparencyLabel(frame: CGRect(x: 15, y: 100, width: self.view.frame.size.width - 30, height: 300))
        imageView?.addSubview(self.label)
        
        UIView.animate(withDuration: 10, animations: {
            self.animateLabelAppear()
        }) { (_) in
//            self.imageView?.removeFromSuperview()
        }
//        Thread.sleep(forTimeInterval: 1.0) //延长3秒
        
        
    }
    @IBAction func onBtnClick(_ sender: UIButton) {
        animateLabelAppear()
    }
    
    func animateLabelAppear() {
        
        self.label.startDisappearAnimation()
        self.label.animationDuration = 0.8
        self.label.animationDelay = 0.15
        
        self.label.text = "hen lilacs last in the door-yard bloom’d,\n当紫丁香最近在庭园中开放的时候，\nAnd the great star early droop’d in the western sky in the night,\n那颗硕大的星星在西方的夜空陨落了，\nI mourn’d—and yet shall mourn with ever-returning spring.\n我哀悼着，并将随着一年一度的春光永远";
        let style = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        style.lineSpacing = 5
        style.alignment = .center
        
        let mutableString = NSMutableAttributedString(string: self.label.text, attributes:
            [NSParagraphStyleAttributeName : style,
             NSForegroundColorAttributeName : UIColor.black,
             NSFontAttributeName : UIFont.systemFont(ofSize: 20)])
        mutableString.addAttributes([NSForegroundColorAttributeName:#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)], range: NSMakeRange(0, self.label.text.characters.count))
        mutableString.addAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 20)], range: NSMakeRange(0, 3))
        mutableString.addAttributes([NSForegroundColorAttributeName:UIColor.red], range: NSMakeRange(3, 10))
        mutableString.addAttributes([NSForegroundColorAttributeName:UIColor.blue], range: NSMakeRange(0, 3))

        self.label.attributedString = mutableString;
        self.label.startAppearAnimation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

