//
//  MyPageTableViewCell.swift
//  sopt_Seminar
//
//  Created by 고영민 on 2023/04/27.
//

import UIKit
import Then
import SnapKit


final class MyPageTableViewCell: UITableViewCell {
    
    static let identifier = "MyPageTableViewCell"

    private let enterbutton = UIButton()
    private let categorilabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setStyle() {}
    func setLayout() {
        

    }
    
    
}
