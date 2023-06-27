//
//  UIView+.swift
//  sopt_Seminar
//
//  Created by 고영민 on 2023/04/22.
//

import UIKit.UIView

extension UIView {
    
    func makeRounded(radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
}
