//
//  UIButton.swift
//  TvingClone
//
//  Created by 고영민 on 2023/04/19.
//

import UIKit

extension UIButton {
    ///버튼에 밑줄긋는 메서드
    func setUnderline() {
        guard let title = title(for: .normal) else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: 0, length: title.count)
        )
        setAttributedTitle(attributedString, for: .normal)
    }
}
