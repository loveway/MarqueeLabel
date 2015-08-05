//
//  ViewController.swift
//  MarqueeLabel
//
//  Created by Loveway on 15/8/3.
//  Copyright (c) 2015年 Henry·Cheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var marquee: CHWMarqueeView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        let string = "弃我去者，昨日之日不可留；乱我心者，今日之日多烦忧。"
         marquee = CHWMarqueeView(frame: CGRectMake(10, 64, self.view.bounds.size.width-20, 44), title: string)
        self.view.addSubview(marquee!)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

