//
//  view.swift
//  Lesson 11
//
//  Created by Виталий Крюков on 27.04.2021.
//

import UIKit

protocol TapDelegate: NSObjectProtocol {
    //func prr()
    func viewPressed (_ vp: view)
    
}

class view: UIView {
    
    var delegate: TapDelegate?
    
    var IsSetuped = false
    
    var labelSize = 30
    @IBInspectable var labelLenth = 60
    var labelColor = UIColor.lightGray
    @IBInspectable var cornerRadiusBorder = 0
    @IBInspectable var borderColorBorder = UIColor.green.cgColor
    
    var imagename = UIImage(named: "google")
    
    private let border = UIView()
    private let label = UILabel()
    private let image = UIImageView()

    override func layoutSubviews() {
        
        let w = frame.size.width
        let h = frame.size.height
        
        border.frame = CGRect(x: 0, y: 0, width: w, height: h)
        label.frame = CGRect(x: w/2 - CGFloat(labelLenth)/2, y: h - h/3, width: CGFloat(labelLenth), height: CGFloat(labelSize))
        
        image.frame = CGRect(x: 0, y: 0, width: w, height: h/2)
        image.image = imagename
        
        border.layer.cornerRadius = CGFloat(cornerRadiusBorder)
        border.layer.borderWidth = 3
        border.layer.borderColor = borderColorBorder
        
        label.backgroundColor = labelColor
        label.text = "Google!"
        
        addSubview(border)
        addSubview(label)
        addSubview(image)

        if IsSetuped {return}
        IsSetuped = true
   
    }
    override func touchesEnded(_: Set<UITouch>, with: UIEvent?) {
        delegate?.viewPressed(self)
    }
    
}
