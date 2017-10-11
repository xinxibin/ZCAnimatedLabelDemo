# ZCAnimatedLabelDemo

简单实用：

```swift
	// 创建
   self.label = ZCTransparencyLabel(frame: CGRect(x: 15, y: 100, width: self.view.frame.size.width - 30, height: 300))
        imageView?.addSubview(self.label)
        
        UIView.animate(withDuration: 10, animations:{
        	// 开始动画
            self.animateLabelAppear()
        }) { (_) in
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

```