//
//  webViewController.swift
//  ceshi3
//
//  Created by Zhaokunpeng on 2017/12/4.
//  Copyright © 2017年 冷轶. All rights reserved.
//

import UIKit
import WebKit
class webViewController: UIViewController {

    var wkWebView:WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        wkWebView = WKWebView.init(frame: self.view.bounds)
        
        self.view.addSubview(wkWebView)
        
        self.wkWebView.load(URLRequest.init(url: URL.init(string: "https://www.baidu.com/")!))
        
    }


    
}
