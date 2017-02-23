//
//  ViewController.swift
//  DNPopoverPresentationController
//
//  Created by mainone on 2017/2/23.
//  Copyright © 2017年 mainone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var popButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
         self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(itemClick(_:)))
        
        
    }
    
    func itemClick(_ itemBar: UIBarButtonItem) {
        self.popView(true, customView: view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnClick(_ sender: UIButton) {
        self.popView(false, customView: popButton)
    }

}

extension ViewController: UIPopoverPresentationControllerDelegate {
    
    func popView(_ isitemBar: Bool, customView: UIView) {
        let view = DNPopViewController()
        // popover视图的大小
        view.preferredContentSize = CGSize(width: CGFloat(300), height: CGFloat(200))
        // 样式
        view.modalPresentationStyle = .popover
        // 如果没有这句，pop不会被初始化
        let pop: UIPopoverPresentationController? = view.popoverPresentationController
        // 背景色
        pop?.backgroundColor = UIColor.red
        // 设置代理
        pop?.delegate = self
        // 弹出的方向
        pop?.permittedArrowDirections = .up
        
        if !isitemBar {
            // 设置要弹出视图的参照View
            pop?.sourceView = customView;
            // 弹出位置偏移
            pop?.sourceRect = CGRect(x: customView.frame.size.width / 2, y: 30, width: 0, height: 0)
        } else {
            // itemBar上显示
            pop?.barButtonItem = navigationItem.leftBarButtonItem
        }
        
        //导航栏右侧的按钮
        self.present(view, animated: true, completion: { _ in })
        //present即可
    }
    
    // 没有设置这个出现一个大黑屏
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
}


