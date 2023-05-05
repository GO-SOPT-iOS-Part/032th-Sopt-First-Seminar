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
    private let contentView = UIView()
    
    private let uiview = UIView().then {
        $0.backgroundColor = UIColor.color2E2E2E
    }
    private let uiview2 = UIView().then {
        $0.backgroundColor = UIColor.color2E2E2E
    }
    
    private var profileImage = UIImageView().then {
        $0.image = UIImage(named: "img_profile")
    }
    private var nicknameLabel = UILabel().then {
        $0.text = "Youngmin"
        $0.textColor = .white
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
    private var transbutton = UIButton().then {
        $0.setTitle("프로필 전환", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.titleLabel?.font = UIFont(name: "벝", size: 16)
        $0.backgroundColor = UIColor.black
        $0.layer.cornerRadius = 3
        $0.layer.borderWidth = 1
    }
    
    private let myticketImage = UIImageView().then {
        $0.image = UIImage(named: "img_ticket")
    }
    private let tvingcashImage = UIImageView().then {
        $0.image = UIImage(named: "img_coin")
    }
    private let myticketLabel = UILabel().then {
        $0.text = "나의 티켓"
        $0.textColor = .white
        $0.font = UIFont.boldSystemFont(ofSize: 15)
    }
    private let tvingcashLabel = UILabel().then {
        $0.text = "티빙 캐시"
        $0.textColor = .white
        $0.font = UIFont.boldSystemFont(ofSize: 15)
    }
    private let theresnoticketLabel = UILabel().then {
        $0.text = "사용중인 이용권이 없습니다."
        $0.textColor = .white
        $0.font = UIFont.boldSystemFont(ofSize: 15)
    }
    private let zeroLabel = UILabel().then {
        $0.text = "0"
        $0.textColor = .white
        $0.font = UIFont.boldSystemFont(ofSize: 15)
    }
    
    private let longlable = UILabel().then {
        $0.text = "이용권을 구매하고 TVN JTBC 등 인기 TV프로그램과 다양한 영화 콘텐츠를 자유롭게 시청하세요"
        $0.textColor = .white
        $0.font = UIFont.boldSystemFont(ofSize: 15)
    }
    private let enter2button = UIButton().then {
        $0.setImage(UIImage(named: "img_toggle"), for: .normal)
        $0.tintColor = .color626262
    }
    
    //
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func style(){
        uiview.backgroundColor = UIColor.color2E2E2E
        uiview2.backgroundColor = UIColor.color2E2E2E
    }
    
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
        
        contentView.addSubview(profileImage)
        contentView.addSubview(nicknameLabel)
        contentView.addSubview(transbutton)
        contentView.addSubview(uiview)
        contentView.addSubview(uiview2)
        
        
        self.addSubview(contentView)
        
        // MARK: - View
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        profileImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(24)
            $0.height.equalTo(74)
            $0.width.equalTo(72)
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.centerY.equalTo(profileImage)
            $0.leading.equalTo(profileImage.snp.trailing).offset(22)
        }
        
        transbutton.snp.makeConstraints {
            $0.centerY.equalTo(profileImage)
            $0.trailing.equalToSuperview().inset(23)
            $0.height.equalTo(25)
        }
        
        uiview.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(92)
        }
        
        uiview2.snp.makeConstraints {
            $0.top.equalTo(uiview.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(60)
        }
        
        // MARK: - View1(ticket, coin)
        
        myticketImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.leading.equalToSuperview().offset(11)
            $0.height.width.equalTo(23)
        }
        
        myticketLabel.snp.makeConstraints {
            $0.centerY.equalTo(myticketImage)
            $0.leading.equalTo(myticketImage.snp.trailing).offset(5)
        }
        
        theresnoticketLabel.snp.makeConstraints {
            $0.centerY.equalTo(myticketImage)
            $0.trailing.equalToSuperview().inset(13)
        }
        
        tvingcashImage.snp.makeConstraints {
            $0.top.equalTo(myticketImage.snp.bottom).offset(17)
            $0.leading.equalToSuperview().offset(11)
            $0.height.width.equalTo(23)
        }
        
        tvingcashLabel.snp.makeConstraints {
            $0.centerY.equalTo(tvingcashImage)
            $0.leading.equalTo(tvingcashImage.snp.trailing).offset(5)
        }
        
        zeroLabel.snp.makeConstraints {
            $0.centerY.equalTo(tvingcashImage)
            $0.trailing.equalToSuperview().inset(11)
        }
        // MARK: - View2(ticket, coin)
        longlable.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.leading.equalToSuperview().offset(11)
            $0.height.width.equalTo(23)
        }
        enter2button.snp.makeConstraints {
            $0.centerY.equalTo(longlable) // 2줄 위아래로 레이아웃 잡아야하는 건 아닐텐데 ..
            $0.trailing.equalToSuperview().inset(11)
        }
    }
    
    
}
