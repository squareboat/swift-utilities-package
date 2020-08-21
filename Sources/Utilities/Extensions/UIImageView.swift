//
//  UIImageView.swift
//  
//
//  Created by Squareboat on 21/08/20.
//

import UIKit
import Kingfisher

public extension UIImageView {
    /// Make image view blurry
    ///
    /// - Parameter style: UIBlurEffectStyle (default is .light).
    func blur(withStyle style: UIBlurEffect.Style = .light) {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        addSubview(blurEffectView)
        clipsToBounds = true
    }

    /// Blurred version of an image view
    ///
    /// - Parameter style: UIBlurEffectStyle (default is .light).
    /// - Returns: blurred version of self.
    func blurred(withStyle style: UIBlurEffect.Style = .light) -> UIImageView {
        let imgView = self
        imgView.blur(withStyle: style)
        return imgView
    }
    
    /// Set Image using URL
    ///
    ///  - Parameters:
    ///   - url: URL
    ///   - placeholderImage: UIImage - a placeholder image to display until the image from url is not loaded
    ///   - showIndicator: Bool(default is false) whether to show loading indicator or not
    func setImage(withUrl url: URL, placeholderImage placeholder: UIImage?, showIndicator: Bool = false) {
        let processor = DownsamplingImageProcessor(size: bounds.size)
            |> RoundCornerImageProcessor(cornerRadius: 20)
        kf.indicatorType = showIndicator ? .activity : .none
        kf.setImage(
            with: url,
            placeholder: placeholder,
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ]
        )
    }
    
    /// Set Image using URL String
    ///
    ///  - Parameters:
    ///   - urlString: URL as a String
    ///   - placeholderImage: UIImage - a placeholder image to display until the image from url is not loaded
    ///   - showIndicator: Bool(default is false) whether to show loading indicator or not
    func setImage(withUrlString urlString: String, placeholderImage placeholder: UIImage?, showIndicator: Bool = false) {
        guard let url = URL(string: urlString) else { return }
        let processor = DownsamplingImageProcessor(size: bounds.size)
            |> RoundCornerImageProcessor(cornerRadius: 20)
        kf.indicatorType = showIndicator ? .activity : .none
        kf.setImage(
            with: url,
            placeholder: placeholder,
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ]
        )
    }
}
