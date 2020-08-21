//
//  ImageUtils.swift
//  
//
//  Created by Squareboat on 20/08/20.
//

import UIKit

public class ImageUtils {
    public class func getImageHeightUsingAspectRatio (aspectRatio: Double, width: CGFloat) -> CGFloat {
        return width * CGFloat(aspectRatio)
    }
}
