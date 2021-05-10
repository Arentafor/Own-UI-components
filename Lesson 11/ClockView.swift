//
//  ClockView.swift
//  Lesson 11
//
//  Created by Виталий Крюков on 27.04.2021.
//

import UIKit

@IBDesignable class ClockView: UIView {

    var isSetuped = false
    
    var markerSize = 4
    var markerLenth = 12
    var markerColor = UIColor.black
    
    @IBInspectable var hourLineSize = 5
    var hourLineOffSet = 65
    @IBInspectable var hourLineColor = UIColor.black
    
    
    @IBInspectable var minLineSize = 5
    var minLineOffSet = 30
    @IBInspectable var minLineColor = UIColor.black
    
    @IBInspectable var secLineSize = 2
    var secLineOffSet = 10
    @IBInspectable var secLineColor = UIColor.orange
    
    var roundedColor = UIColor.black
    
    var hours:CGFloat = 5 {
        didSet {updateHours() }}
    
    var mins:CGFloat = 4 {
        didSet {updateMins() }}

    var secs:CGFloat = 7 {
        didSet {updateSecs() }}

    
    
    private let topMarker = UIView()
    private let leftMarker = UIView()
    private let rightMarker = UIView()
    private let bottomMarker = UIView()
    
    private let hourLine = UIView()
    private let minLine = UIView()
    private let secLine = UIView()
    
    private let rounded = UIView()
    
    
    
 
    override func layoutSubviews() {
        super.layoutSubviews()
        
        hourLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        minLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        secLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        
       


        
        let w = frame.size.width
        let h = frame.size.height
        
        hourLine.frame = CGRect(x: (Int(w) / 2) - (hourLineSize / 2), y: hourLineOffSet, width: hourLineSize, height: Int(h)/2-hourLineOffSet)
        minLine.frame = CGRect(x: (Int(w) / 2) - (hourLineSize / 2), y: minLineOffSet, width: minLineSize, height: Int(h)/2-minLineOffSet)
        secLine.frame = CGRect(x: (Int(w) / 2) - (hourLineSize / 2), y: secLineOffSet, width: secLineSize, height: Int(h)/2-secLineOffSet)
        rounded.frame = CGRect(x: w/2-10, y: h/2-10, width: 20, height: 20)
        
        hourLine.backgroundColor = hourLineColor
        minLine.backgroundColor = minLineColor
        secLine.backgroundColor = secLineColor
        rounded.backgroundColor = roundedColor
        rounded.layer.cornerRadius = 10
        
        updateHours()
        updateMins()
        updateSecs()
        
        topMarker.frame = CGRect(x: Int(w) / 2 - markerSize / 2, y: 0, width: markerSize, height: markerLenth)
        leftMarker.frame = CGRect(x: 0, y: Int(h) / 2 - markerSize / 2, width: markerLenth, height: markerSize)
        rightMarker.frame = CGRect(x: Int(w) - markerLenth, y: Int(h) / 2 - markerSize / 2, width: markerLenth, height: markerSize)
        bottomMarker.frame = CGRect(x: Int(w) / 2 - markerSize / 2, y: Int(h) - markerLenth, width: markerSize, height: markerLenth)
        
        layer.cornerRadius = frame.size.width / 2
        
        for output in [topMarker,leftMarker,rightMarker,bottomMarker,hourLine,minLine,secLine,rounded] {
            addSubview(output)

        }
        

        
        for v in [topMarker,leftMarker,rightMarker,bottomMarker] {
            v.backgroundColor = markerColor
        }
        
        if isSetuped {return}
        isSetuped = true
    }
    
    
    func updateHours() {
        let angleh = CGFloat.pi * 2 * (hours / CGFloat(12))
        hourLine.transform = CGAffineTransform(rotationAngle: angleh)
    }
    
    func updateMins() {
        let anglem = CGFloat.pi * 2 * (mins / CGFloat(12))
        minLine.transform = CGAffineTransform(rotationAngle: anglem)
    }
    
    func updateSecs() {
        let angles = CGFloat.pi * 2 * (secs / CGFloat(12))
        secLine.transform = CGAffineTransform(rotationAngle: angles)
    }

}
