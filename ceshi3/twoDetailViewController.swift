//
//  twoDetailViewController.swift
//  ceshi3
//
//  Created by Zhaokunpeng on 2017/12/4.
//  Copyright © 2017年 冷轶. All rights reserved.
//

import UIKit

class twoDetailViewController: UIViewController {

    var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()


        self.title = "详情"
        
        tableView = UITableView.init(frame: self.view.bounds)
        
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        
        tableView.rowHeight = 200
        self.view.addSubview(tableView)
    }

    

}

extension twoDetailViewController:UITableViewDelegate,UITableViewDataSource{
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        cell.textLabel?.text = "测试数据\(indexPath.row)"
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let twodetaildetailVC  = UIStoryboard.init(name: "twodetaildetailSB", bundle: nil).instantiateViewController(withIdentifier: "twodetaildetailVC") as! twodetaildetailTableViewController
        
        
        twodetaildetailVC.hidesBottomBarWhenPushed = true
        
        self.navigationController?.pushViewController(twodetaildetailVC, animated: true)
        
    }
    
    
}
