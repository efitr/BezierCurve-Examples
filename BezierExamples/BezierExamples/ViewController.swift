//
//  ViewController.swift
//  BezierExamples
//
//  Created by Egon Fiedler on 9/24/18.
//  Copyright © 2018 App Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpBezierLayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createBezierPath() -> UIBezierPath {
        let bezierPath = UIBezierPath()
        let startingPoint = CGPoint(x: self.view.bounds.minX, y: self.view.bounds.midY)
        bezierPath.move(to: startingPoint)
        let controlPoint1 = CGPoint(x: self.view.bounds.midX / 2, y: startingPoint.y)
        let controlPoint2 = CGPoint(x: self.view.bounds.midX / 2, y: self.view.bounds.height / 2 + 100)
        let midPoint = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY + 100)
        bezierPath.addCurve(to: midPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        
        let endPoint = CGPoint(x: self.view.bounds.maxX, y: self.view.bounds.midY - 50)
        let controlPoint3 = CGPoint(x: self.view.bounds.maxX - (self.view.bounds.midX / 2), y: startingPoint.y + 100)
        let controlPoint4 = CGPoint(x: self.view.bounds.maxX - (self.view.bounds.midX / 2) - 50, y: startingPoint.y - 100)
        bezierPath.addCurve(to: endPoint, controlPoint1: controlPoint3, controlPoint2: controlPoint4)
        let bottomEndPoint = CGPoint(x: self.view.bounds.maxX , y: self.view.bounds.maxY)
        bezierPath.addLine(to: bottomEndPoint)
        let bottomBeginPoint = CGPoint(x: self.view.bounds.minX, y: self.view.bounds.maxY)
        bezierPath.addLine(to: bottomBeginPoint)
        bezierPath.close()
        
        return bezierPath
    }
    
    func createBezierPath2() -> UIBezierPath {
        let bezierPath = UIBezierPath()
        let startingPoint = CGPoint(x: self.view.bounds.minX, y: self.view.bounds.midY)
        bezierPath.move(to: startingPoint)
        let controlPoint1 = CGPoint(x: self.view.bounds.midX / 2, y: startingPoint.y)
        let controlPoint2 = CGPoint(x: self.view.bounds.midX / 2, y: self.view.bounds.height / 2 + 130)
        let midPoint = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY + 130)
        bezierPath.addCurve(to: midPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        let endPoint = CGPoint(x: self.view.bounds.maxX, y: self.view.bounds.midY - 20)
        let controlPoint3 = CGPoint(x: self.view.bounds.maxX - (self.view.bounds.midX / 2), y: startingPoint.y + 130)
        let controlPoint4 = CGPoint(x: self.view.bounds.maxX - (self.view.bounds.midX / 2) - 10, y: startingPoint.y - 70)
        bezierPath.addCurve(to: endPoint, controlPoint1: controlPoint3, controlPoint2: controlPoint4)
        let bottomEndPoint = CGPoint(x: self.view.bounds.maxX , y: self.view.bounds.maxY)
        bezierPath.addLine(to: bottomEndPoint)
        let bottomBeginPoint = CGPoint(x: self.view.bounds.minX, y: self.view.bounds.maxY)
        bezierPath.addLine(to: bottomBeginPoint)
        bezierPath.close()
        
        return bezierPath
    }
    
    func setUpBezierLayer() {
        let bezierLayer = CAShapeLayer()
        let circleLayer = CAShapeLayer()
        bezierLayer.path = createBezierPath().cgPath
        bezierLayer.fillColor = UIColor.orange.cgColor
        self.view.layer.addSublayer(bezierLayer)
        let bezierLayer2 = CAShapeLayer()
        bezierLayer2.path = createBezierPath2().cgPath
        bezierLayer2.fillColor = UIColor.blue.cgColor
        self.view.layer.addSublayer(bezierLayer2)
        
        
        let circleX = (self.view.bounds.width / 2) + self.view.bounds.width / 4
        let circleY = CGFloat(50)
        let rect = CGRect(x: circleX, y: circleY, width: 75, height: 75)
        let circlePath = UIBezierPath(roundedRect: rect, cornerRadius: rect.height / 2).cgPath
        circleLayer.path = circlePath
        circleLayer.fillColor = UIColor.orange.cgColor
        self.view.layer.addSublayer(circleLayer)
    }

}

