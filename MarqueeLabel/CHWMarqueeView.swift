//
//  CHWMarqueeView.swift
//  MarqueeLabel
//
//  Created by Loveway on 15/8/3.
//  Copyright (c) 2015年 Henry·Cheng. All rights reserved.
//

import UIKit

class CHWMarqueeView: UIView {
    
    private var marqueeTitle:String?
    private var mark1:CGRect!
    private var mark2:CGRect!
//    var bgColor: UIColor?
//    var textColor: UIColor?
    private var labArr = [UILabel]()
    private var isStop = false
    private var timeInterval1: NSTimeInterval!
    
    convenience init(frame: CGRect, title: String) {
        
        self.init(frame: frame)
        marqueeTitle = " \(title) "
        self.backgroundColor = UIColor.blackColor()
        self.clipsToBounds = true
        timeInterval1 = NSTimeInterval(count(marqueeTitle!)/5)
        
        let lab = UILabel()
        lab.frame = CGRectZero
        lab.textColor = UIColor.redColor()
        lab.font = UIFont.boldSystemFontOfSize(14.0)
        lab.text = marqueeTitle
        
        //计算textLab的大小
        let sizeOfText = lab.sizeThatFits(CGSizeZero)
        mark1 = CGRectMake(0, 0, sizeOfText.width, self.bounds.size.height)
        mark2 = CGRectMake(mark1.origin.x+mark1.size.width, 0, sizeOfText.width, self.bounds.size.height)
        lab.frame = mark1
        self.addSubview(lab)
        labArr.append(lab)
        
        let useReserve = sizeOfText.width > frame.size.width ? true : false
        
        if useReserve == true {
            
            let reserveTextLb = UILabel(frame: mark2)
            reserveTextLb.textColor = UIColor.redColor()
            reserveTextLb.font = UIFont.boldSystemFontOfSize(14.0)
            reserveTextLb.text = marqueeTitle;
            self.addSubview(reserveTextLb)
            
            labArr.append(reserveTextLb)
            
            self.labAnimation()
        }


    }
    
    //跑马灯动画
    func labAnimation() {
        if (!isStop) {
           let lbindex0 = labArr[0]
           let lbindex1 = labArr[1]

            UIView.transitionWithView(self, duration: timeInterval1, options: UIViewAnimationOptions.CurveLinear, animations: {
                
                lbindex0.frame = CGRectMake(-self.mark1.size.width, 0, self.mark1.size.width, self.mark1.size.height)
                lbindex1.frame = CGRectMake(lbindex0.frame.origin.x+lbindex0.frame.size.width, 0, lbindex1.frame.size.width, lbindex1.frame.size.height)
                
                }, completion: { finished in
                    lbindex0.frame = self.mark2
                    lbindex1.frame = self.mark1
                    self.labArr[0] = lbindex1
                    self.labArr[1] = lbindex0
                    self.labAnimation()
            })

        } else {

            self.layer.removeAllAnimations()
        }

    }
    
    func start() {
        isStop = false
        let lbindex0 = labArr[0]
        let lbindex1 = labArr[1]

        lbindex0.frame = mark2;
        lbindex1.frame = mark1;
        self.labArr[0] = lbindex1
        self.labArr[1] = lbindex0
        self.labAnimation()

    }
    
    func stop() {
        isStop = true
        self.labAnimation()
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
