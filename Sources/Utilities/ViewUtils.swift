//
//  ViewUtils.swift
//  
//
//  Created by Squareboat on 20/08/20.
//

import UIKit

public class ViewUtils {
    /// Sets a dashed border on UIView
    public class func setDashedBoder(view : UIView, color: UIColor = .lightGray){
        let yourViewBorder = CAShapeLayer()
        yourViewBorder.strokeColor = color.cgColor
        yourViewBorder.lineDashPattern = [6, 6]
        yourViewBorder.fillColor = nil
        yourViewBorder.frame = view.bounds
        yourViewBorder.path = UIBezierPath.init(roundedRect: view.bounds, cornerRadius: 4).cgPath
        view.layer.addSublayer(yourViewBorder)
    }
}
