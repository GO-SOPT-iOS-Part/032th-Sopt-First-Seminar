//
//  MyPageFooterView.swift
//  sopt_Seminar
//
//  Created by 고영민 on 2023/04/29.

import UIKit
import Then
import SnapKit

class MyPageFooterView: UIView {
    
    private let bottombutton = UIButton().then {
        $0.setTitle("로그아웃", for: .normal)
        $0.setTitleColor(UIColor.color9C9C9C, for: .normal)
        //$0.titleLabel?.font = .tvingBold(ofSize: 24)
        $0.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 16)
        $0.backgroundColor = .color000000
        $0.layer.cornerRadius = 3
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.color2E2E2E.cgColor
        
    }
    
    
    //init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout() {
        [bottombutton]
            .forEach {self.addSubview($0)}
        bottombutton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.size.equalTo(70)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
            
        }
    }
}
