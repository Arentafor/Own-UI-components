//
//  SegmentControlView.swift
//  Lesson 11
//
//  Created by Виталий Крюков on 27.04.2021.
//

import UIKit

class SegmentControlView: UIView {

    var isSetuped = false
    var buttomSize = 50
    var buttomLenth = 50
    var firstbuttomColor = UIColor.green
    var secondButtomColor = UIColor.red
    
    private var firstbuttom = UIButton()
    private var secondbuttom = UIButton()
    
    override func layoutSubviews() {
        
        let w = frame.size.width
        let h = frame.size.height
        
        firstbuttom.frame = CGRect(x: Int(w)/2 - buttomLenth , y: Int(h)/2, width: buttomLenth, height: buttomSize)
        secondbuttom.frame = CGRect(x: Int(w)/2, y: Int(h)/2, width: buttomLenth, height: buttomSize)
        
        firstbuttom.backgroundColor = firstbuttomColor
        secondbuttom.backgroundColor = secondButtomColor
        
        addSubview(firstbuttom)
        addSubview(secondbuttom)
    }
    
    
    
    
    

}
