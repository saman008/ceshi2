//
//  ChatPickUIView.swift
//  sschat
//
//  Created by cifer on 2017/11/16.
//  Copyright © 2017年 韩双. All rights reserved.
//

import UIKit

class ChatPickUIView: UIView {

    var pickerDataArray:[Any] = [6, 7, 7.5, 8, 8.5]
    var pickerDataArray1:[Any] = [6, 7, 7.5, 8, 8.5]
    var pickerView = UIPickerView()
    var callBack:((_ index:Any)-> ())? = nil
    var selectedIndex = 0
    
    convenience init(_ pickerDataArray:[Any],_ callBack:((_ index:Any)-> ())?,_ selectedIndex:Int?)  {
        self.init(frame: CGRect.zero)
        if selectedIndex != nil {
            self.selectedIndex = selectedIndex!
            if selectedIndex!>=pickerDataArray.count {
                return
            }
        }
        self.pickerDataArray = pickerDataArray
        self.callBack = callBack
        self.textCountAction()
    }
    
}

//Mark: 点击事件
extension ChatPickUIView {

    //调用显示pickerView的方法

    func showPickerView(){
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
    
    @objc func hidePickerView() {
        self.removeFromSuperview()
    }
    
    
    @objc func selectedPickerView() {
        var row = 0
        // 得到当前的pickView显示的是第几行
        row = self.pickerView.selectedRow(inComponent: 0)
        self.callBack?(row)
        self.hidePickerView()
    }
    
    // 页码按钮
    func textCountAction() {
        //创建一个透明的UIView,添加到UIWindow上
        self.frame = UIScreen.main.bounds
        self.backgroundColor = UIColor.clear
        UIApplication.shared.keyWindow?.addSubview(self)
        
        //创建一个半透明的UIView,添加到pickerMaskView上
        let maskView = UIView.init(frame: self.bounds)
        maskView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.2)
        maskView.isUserInteractionEnabled = true
        self.addSubview(maskView)
        //maskView上添加手势的点击事件,点击maskView，隐藏pickView
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(hidePickerView))
        maskView.addGestureRecognizer(tap)
        
        //创建可以添加PickView的UIView,添加到pickerMaskView上
        let operationView = UIView.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.height-162-30, width: UIScreen.main.bounds.width, height: 30))
        operationView.backgroundColor = UIColor.gray
        self.addSubview(operationView)
        
        //将取消按钮以及确定按钮添加到operationView上
        let cancelBtn = UIButton.init(type: .custom)
        cancelBtn.frame = CGRect.init(x: 10, y: 5, width: 40, height: 20)
        cancelBtn.setTitle("取消", for: .normal)
        cancelBtn.addTarget(self, action: #selector(hidePickerView), for: .touchUpInside)
        operationView.addSubview(cancelBtn)
        
        let okBtn = UIButton.init(type: .custom)
        okBtn.frame = CGRect.init(x: UIScreen.main.bounds.width-50, y: 5, width: 40, height: 20)
        okBtn.setTitle("确定", for: .normal)
        okBtn.addTarget(self, action: #selector(selectedPickerView), for: .touchUpInside)
        operationView.addSubview(okBtn)
        
        self.pickerView = UIPickerView.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.height-162, width: UIScreen.main.bounds.width, height: 162))
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        //设置pickerView的列数为一列显示
        self.pickerView.selectRow(self.selectedIndex, inComponent: 0, animated: true)
        self.pickerView.backgroundColor = UIColor.white
        self.addSubview(self.pickerView)
        
    }
}

extension ChatPickUIView: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 2{
            return self.pickerDataArray1.count
        }
        
        return self.pickerDataArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 2{
            return "\(self.pickerDataArray1[row])"
        }
        
        return "\(self.pickerDataArray[row])"
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
}
