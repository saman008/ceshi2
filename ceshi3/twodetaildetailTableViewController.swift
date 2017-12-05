//
//  twodetaildetailTableViewController.swift
//  ceshi3
//
//  Created by Zhaokunpeng on 2017/12/4.
//  Copyright © 2017年 冷轶. All rights reserved.
//

import UIKit

class twodetaildetailTableViewController: UITableViewController {

    var aaa:String?
    var bbb:String?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "详情的详情"
        
        if let a = aaa,let b = bbb{
            print(b)
        }
        
    }
    
}

extension twodetaildetailTableViewController{
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let VC = webViewController()
        
        
        self.navigationController?.pushViewController(VC, animated: true)
        
    }
    
}
