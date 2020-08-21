//
//  SegmentControlUtils.swift
//  
//
//  Created by Squareboat on 20/08/20.
//

import UIKit

public class SegmentControlUtils {
    /// Creates a bottom bar for UISegmentControl
    class func getBottomBarForSegmentControl(SCView : UISegmentedControl, color: UIColor) -> UIView {
        let buttonBar = UIView()
        buttonBar.translatesAutoresizingMaskIntoConstraints = false
        buttonBar.backgroundColor = color
        SCView.addSubview(buttonBar)
        buttonBar.topAnchor.constraint(equalTo: SCView.bottomAnchor).isActive = true
        buttonBar.heightAnchor.constraint(equalToConstant: 5).isActive = true
        buttonBar.leftAnchor.constraint(equalTo: SCView.leftAnchor).isActive = true
        buttonBar.rightAnchor.constraint(equalTo: SCView.rightAnchor).isActive = true
        buttonBar.widthAnchor.constraint(equalTo: SCView.widthAnchor, multiplier: 1 / CGFloat(SCView.numberOfSegments)).isActive = true
        buttonBar.clipsToBounds = true
        buttonBar.layer.cornerRadius = 4
        buttonBar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return buttonBar
    }
}
