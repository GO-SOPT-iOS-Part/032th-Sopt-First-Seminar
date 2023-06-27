//
//  MyPageHeaderView.swift
//  sopt_Seminar
//
//  Created by 고영민 on 2023/04/29.
//

import UIKit
import Then
import SnapKit


class MyPageHeaderView: UIView {
    
    private var uiview = UIView()
    private var uiview2 = UIView()
    
    private var profileImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    private var nicknameLabel = UILabel()
    private var transbutton = UIButton()
    
    private lazy var myticketImage = UIImageView()
    private lazy var tvingcashImage = UIImageView()
    private let myticketLabel = UILabel()
    private let tvingcashLabel = UILabel()
    private let theresnoticketLabel = UILabel()
    private let zeroLabel = UILabel()
    
    private let longlable = UILabel()
    private let enter2button = UIButton()
    
    
    func setLayout() {
        [profileImage,nicknameLabel,transbutton]
            .forEach { self.addSubview($0) }
        
        //uiview
        uiview.addSubview(myticketImage)
        uiview.addSubview(myticketLabel)
        uiview.addSubview(tvingcashImage)
        uiview.addSubview(tvingcashLabel)
        uiview.addSubview(zeroLabel)
        uiview.addSubview(theresnoticketLabel)
        
        self.addSubview(uiview)
        
        //uiview2
        uiview2.addSubview(longlable)
        uiview2.addSubview(enter2button)
        
        self.addSubview(uiview2)
        
        
        profileImage.snp.makeConstraints{
            $0.size.equalTo(100)
            $0.leading.equalToSuperview().inset(10)
            
        }
        nicknameLabel.snp.makeConstraints{
            $0.trailing.equalTo(profileImage.snp.trailing).offset(14)
        }
        //
//        nicknameLabel.snp.makeConstraints{
//
//        }
//        nicknameLabel.snp.makeConstraints{
//
//        }
//        nicknameLabel.snp.makeConstraints{
//
//        }
//        nicknameLabel.snp.makeConstraints{
//
//        }
//        nicknameLabel.snp.makeConstraints{
//
//        }
//        nicknameLabel.snp.makeConstraints{
//
        }
        //
        
        
        //        myticketLabel.snp.makeConstraints{
        //            $0.
        //        }
        
        //        enterbutton.snp.makeConstraints{
        //            $0.size.equalTo(100)
        //            $0.centerY.equalToSuperview()
        //            $0.leading.equalToSuperview().inset(10)
        //        }
    }
