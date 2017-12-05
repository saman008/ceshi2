//
//  ViewController.swift
//  ceshi3
//
//  Created by 冷轶 on 2017/11/16.
//  Copyright © 2017年 冷轶. All rights reserved.
//

import UIKit

class ViewController: UIViewController,XYMenuAnimateViewDelegate {
    
    
    @IBOutlet weak var pubBtn: UIButton!
    
        let buttonview = XYMenuAnimateView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height:400))
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        self.view.backgroundColor = UIColor.white
        
        self.pubBtn.addTarget(self, action: #selector(Btn), for: UIControlEvents.touchUpInside)
        
        self.addbulr()
        self.initsubview()
    }
    
    @objc func Btn(){
        //buttonview.show()
        let array = ["1","2","3","4"]
        ChatPickUIView.init(array, { (i) in
            
            
            
        }, 0)
        
    }

    func addbulr(){
        let effect = UIBlurEffect.init(style: UIBlurEffectStyle.light)
        
        let effectview = UIVisualEffectView.init(effect: effect)
        
        effectview.frame = self.view.bounds
        
        self.view.addSubview(effectview)
        self.view.sendSubview(toBack: effectview)
    }
    
    func initsubview(){
        

        
        let textArr = ["文字","图片","视频","语音","投票","签到"]
        
        let imgArr = NSMutableArray()
        for i in 0..<textArr.count{
            let imggeName = "publish_\(i)"
            
            imgArr.add(imggeName)
            
        }
        buttonview.textArray = textArr
        buttonview.imageNameArray = imgArr as! [String]
        buttonview.delegate = self
        buttonview.show()
        self.view.addSubview(buttonview)
    }

    func menuAnimateViewButton(_ button: UIButton!, andIndex index: Int) {
        
        print(index)
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        buttonview.close {
            
            self.dismiss(animated: true, completion: nil)
            
        }
    }

//    static func showStringPicker(_ title: String, stringsArray: [Any], defaultSelected: Int, doneBlock: @escaping(_ index: Int , _ values: String) -> (), origin: UIView) {
//
//        let acp = ActionSheetStringPicker(title: title, rows: stringsArray, initialSelection: defaultSelected, doneBlock: { (picker, indexs, values) in
//            doneBlock(indexs , values as! String)
//        }, cancel: { (ActionSheetStringPicker) in
//            return
//        }, origin: origin)
//
//        acp?.setTextColor(UIColor.black)
//        acp?.pickerBackgroundColor = UIColor.white
//
//        let doneButton = UIButton(type: .custom)
//        doneButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
//        doneButton.setTitle("完成", for: .normal)
//        doneButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
//        doneButton.setTitleColor(UIColor.black, for: .normal)
//        acp?.setDoneButton(UIBarButtonItem.init(customView: doneButton))
//
//        let cancelButton = UIButton(type: .custom)
//        cancelButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
//        cancelButton.setTitle("返回", for: .normal)
//        cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
//        cancelButton.setTitleColor(UIColor.black, for: .normal)
//        acp?.setCancelButton(UIBarButtonItem.init(customView: cancelButton))
//
//        acp?.show()
//
//    }
    
}

