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
    
    var hours:CGFloat = 0

    var mins:CGFloat = 0

    var secs:CGFloat = 0

    
    
    private let topMarker = UIView()
    private let leftMarker = UIView()
    private let rightMarker = UIView()
    private let bottomMarker = UIView()
    
    private let hourLine = UIView()
    private let minLine = UIView()
    private let secLine = UIView()
    
    private let rounded = UIView()
    
    
    
    
    
    
    override func prepareForInterfaceBuilder() {
            super.prepareForInterfaceBuilder()

           }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateViews()
        timerForSecs()
        timerForMins()
        timerForHours()
        
        
    }
    
    
    func updateViews() {
  
        
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

    func timerForHours() {
        _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            let date = NSDate()
            let currentHour = DateFormatter()
            currentHour.dateFormat = "hh"
            let hourString = Int(currentHour.string(from: date as Date))!
            self.hours = CGFloat(hourString)
            let angleH = CGFloat.pi * 2 * (CGFloat(hourString) / CGFloat(12))
            self.hourLine.transform = CGAffineTransform(rotationAngle: angleH)
        }
    }
    
    func timerForMins() {
        _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            let date = NSDate()
            let currentMin = DateFormatter()
            currentMin.dateFormat = "mm"
            let minString = Int(currentMin.string(from: date as Date))!
            self.mins = CGFloat(minString)
            let angleM = CGFloat.pi * 2 * (CGFloat(minString) / CGFloat(60))
            self.minLine.transform = CGAffineTransform(rotationAngle: angleM)
        }
    }
    
    func timerForSecs() {
        _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {_ in
            let date = NSDate()
            let currentSec = DateFormatter()
            currentSec.dateFormat = "ss"
            let secString = Int(currentSec.string(from: date as Date))!
            self.secs = CGFloat(secString)
            let angleS = CGFloat.pi * 2 * (CGFloat(secString) / CGFloat(60))
            self.secLine.transform = CGAffineTransform(rotationAngle: angleS)
        }
    }
}
