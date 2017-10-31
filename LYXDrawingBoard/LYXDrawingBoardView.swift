//
//  LYXDrawingBoardView.swift
//  LYXDrawingBoard
//
//  Created by liuyunxin on 2017/8/1.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit

class LYXDrawingBoardView:UIView{
    
    var lineColor :UIColor?
    var lineWidth :CGFloat?
    lazy var lins:[LYXBezierPath] = {
        return []
    }()
    
    
    override func draw(_ rect: CGRect) {
        
        if self.lins.count > 0 {
            for line in self.lins {
                line.lineCapStyle = CGLineCap.round
                line.lineJoinStyle = .round
                line.bezierPathColor?.setStroke()
                line.stroke()
            }
        }
    }
}


extension LYXDrawingBoardView{
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let line:LYXBezierPath = LYXBezierPath()
        line.lineWidth = self.lineWidth!
        line.bezierPathColor = self.lineColor!
        self.lins.append(line)
        let touch:UITouch = touches.first!
        line.startPoint = touch.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let line = self.lins.last!
        line.startPoint = touches.first?.previousLocation(in: self)
        line.lastPoint = touches.first?.location(in: self)
        line.move(to: line.startPoint!)
        line.addLine(to: line.lastPoint!)
        line.lineCapStyle = CGLineCap.round
        line.lineJoinStyle = .round
        line.bezierPathColor?.setStroke()
        line.stroke()
        self.setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
}
