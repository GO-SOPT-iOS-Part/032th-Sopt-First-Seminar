//
//  MyPageFooterView.swift
//  sopt_Seminar
//
//  Created by 고영민 on 2023/04/29.
//

import UIKit
import Then
import SnapKit

class MyPageFooterView: UIView {
    
    private let bottombutton = UIButton()
    
    
    //init
    
    
    func setLayout() {
        [bottombutton]
            .forEach {self.addSubview($0)}
        bottombutton.snp.makeConstraints{
            $0.size.equalTo(100)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
        }
        
        
        //        enterbutton.snp.makeConstraints{
        //            $0.size.equalTo(100)
        //            $0.centerY.equalToSuperview()
        //            $0.leading.equalToSuperview().inset(10)
        //        }
        //        categorylabel.snp.makeConstraints{
        //            $0.leading.equalTo(enterbutton.self)
        //            $0.top.equalTo(enterbutton.self)
        //        }
    }
}
