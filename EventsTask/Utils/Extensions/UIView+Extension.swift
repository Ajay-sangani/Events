//
//  UIView+Extension.swift
//  EventsTask
//
//  Created by Ajay Sangani on 24/05/22.
//

import UIKit

extension UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    func cornerRadius(cornerRadius: CGFloat = 5) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
    
    func applyBorder(_ borderWidth: CGFloat = 1.0, color: UIColor = UIColor.lightGray, cornerRadius: CGFloat = 5) {
        layer.borderWidth = borderWidth
        layer.borderColor = color.cgColor
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func applyRoundedBorder(color: UIColor = .black, width: CGFloat = 0.0) {
        layer.cornerRadius = frame.height / 2
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
    func applyBorder(color: UIColor = .black, width: CGFloat = 0.0) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
    func roundCorner() {
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
    }
}
