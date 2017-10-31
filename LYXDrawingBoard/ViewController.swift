//
//  ViewController.swift
//  LYXDrawingBoard
//
//  Created by liuyunxin on 2017/8/1.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var drawingBoardView: LYXDrawingBoardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置默认颜色为第一个
        self.drawingBoardView.lineColor = UIColor.blue
        //设置最小线宽为3
        self.drawingBoardView.lineWidth = 3.0
    }
    
    
    @IBAction func changeColorAction(_ sender: UIButton) {
        
      self.drawingBoardView.lineColor = sender.backgroundColor
    }
    
    @IBAction func changeLineWidth(_ sender: UISlider) {
       
        self.drawingBoardView.lineWidth = 3.0 + CGFloat(sender.value * Float(10))
        
    }
    @IBAction func drawingAgain(_ sender: UIButton) {
       
        self.drawingBoardView.lins.removeAll()
        self.drawingBoardView.setNeedsDisplay()
        
    }
    @IBAction func drawingBack() {
        if self.drawingBoardView.lins.count > 0 {
            self.drawingBoardView.lins.remove(at: self.drawingBoardView.lins.count - 1)
            self.drawingBoardView.setNeedsDisplay()
        }
        
    }
    @IBAction func eraser(_ sender: UIButton) {
        
        self.drawingBoardView.lineColor = UIColor.white
        self.drawingBoardView.lineWidth = 20
        
    }
    @IBAction func saveToAlbum(_ sender: UIButton) {
        
        //要在info.plsit中配置访问相册权限
        
        UIGraphicsBeginImageContextWithOptions(self.drawingBoardView.bounds.size, false, 0.0)
        
        self.drawingBoardView.layer.render(in: UIGraphicsGetCurrentContext()!)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(image!, self, nil, nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
