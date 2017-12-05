//
//  twoTableViewController.swift
//  ceshi3
//
//  Created by Zhaokunpeng on 2017/12/1.
//  Copyright © 2017年 冷轶. All rights reserved.
//

import UIKit

class twoTableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "测试安全区域"
        
        tableView.register(UINib.init(nibName: "twoTableViewCell", bundle: nil), forCellReuseIdentifier: "twoTableViewCell")
        //tableView.contentInset = UIEdgeInsetsMake(0, 0, 200, 0)
        
        //tableView.rowHeight = 100
//        tableView.rowHeight = UITableViewAutomaticDimension
//        tableView.estimatedRowHeight = 300
        
    }

    

}

extension twoTableViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 30
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "twoTableViewCell", for: indexPath) as! twoTableViewCell
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let twoVC = twoDetailViewController()
        
        twoVC.hidesBottomBarWhenPushed = true
        
        self.navigationController?.pushViewController(twoVC, animated: true)
        
        
    }
    
    
}
