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
    private let categorylabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setStyle() {
        separatorInset.left = 0
        selectionStyle = .none
//        enterbutton.do{
//
//        }
//        categorylabel.do{
//            $0.font = UIFont.systemFont(ofSize: 12)
//        }
    }
    func setLayout() {
        [enterbutton,categorylabel]
            .forEach {contentView.addSubview($0)}
        enterbutton.snp.makeConstraints{
            $0.size.equalTo(100)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
        }
        categorylabel.snp.makeConstraints{
            $0.leading.equalTo(enterbutton.self)
            $0.top.equalTo(enterbutton.self)
        }
        
        

    }
    
    
}
