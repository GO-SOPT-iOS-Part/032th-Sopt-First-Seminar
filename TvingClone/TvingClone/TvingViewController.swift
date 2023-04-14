//
//  TvingViewController.swift
//  sopt_Seminar
//
//  Created by 고영민 on 2023/04/14.
//

import UIKit

import Then
import SnapKit

final class TvingViewController: UIViewController {
    
    private lazy var titleLabel = UILabel().then {         //Tving ID 로그인
        $0.text = "Tving ID 로그인"
        $0.textColor = .white
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    private lazy var newAcountLabel = UILabel().then{         // 아직 계정이 없으신가요?
        $0.text = "아직 계정이 없으신가요?"
        $0.textColor = .gray
        $0.font = UIFont.boldSystemFont(ofSize: 15)
        
    }
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"                   // 아이디
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        return textField
    }()
    
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"                   // 비밀번호
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        return textField
    }()
    
    private lazy var loginButton = UIButton().then {    // 로그인 btn
        $0.setTitle("로그인하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .gray
    }
    
    private lazy var find_id_Button = UIButton().then {      //아이디찾기 btn
        $0.setTitle("아이디 찾기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .gray
    }
    
    private lazy var find_pw_Button = UIButton().then {      //비밀번호찾기 btn
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .gray
    }
    
    private lazy var makeID = UIButton().then{
        $0.setTitle("TVING ID 회원가입하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .gray
    }
    
    
    // MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addComponent()
        setLayout()
    }
}

// MARK: - Functions

extension TvingViewController {
    
    func addComponent() {
        [titleLabel,newAcountLabel,idTextField,passwordTextField,loginButton,find_id_Button,find_pw_Button].forEach {
            view.addSubview($0)
        }
    }
    
    func setLayout() {
        
        view.backgroundColor = .black
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(additionalSafeAreaInsets).inset(120)
            
        }
        idTextField.snp.makeConstraints{ make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.width.equalTo(280)
            make.height.equalTo(50)
            make.centerX.equalTo(titleLabel)
        }
        passwordTextField.snp.makeConstraints{ make in
            make.top.equalTo(idTextField.snp.bottom).offset(10)
            make.width.equalTo(280)
            make.height.equalTo(50)
            make.centerX.equalTo(idTextField)
        }
        loginButton.snp.makeConstraints{ make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
            make.width.equalTo(140)
            make.height.equalTo(50)
            make.centerX.equalTo(passwordTextField)
        }
        find_id_Button.snp.makeConstraints{ make in
            make.top.equalTo(loginButton.snp.bottom).offset(10)
            make.width.equalTo(140)
            make.height.equalTo(50)
            make.leading.equalTo(30)
        }
        find_pw_Button.snp.makeConstraints{ make in
            make.top.equalTo(loginButton.snp.bottom).offset(10)
            make.width.equalTo(140)
            make.height.equalTo(50)
            make.trailing.equalTo(-30)
        }
        newAcountLabel.snp.makeConstraints { make in
            make.top.equalTo(find_id_Button.snp.bottom).offset(10)
            make.centerX.equalTo(find_id_Button)
        }
        
        
        
        
        
    }
//
//
//
//
//            countLabel.snp.makeConstraints { make in
//                make.centerX.centerY.equalToSuperview()
//            }
//            pushButton.snp.makeConstraints { make in
//                make.top.equalTo(countLabel.snp.bottom).offset(10)
//                make.width.equalTo(100)
//                make.height.equalTo(30)
//                make.centerX.equalTo(countLabel)
//            }
//
//            backButton.snp.makeConstraints { make in
//                make.top.equalTo(pushButton.snp.bottom).offset(10)
//                make.width.equalTo(100)
//                make.height.equalTo(30)
//                make.centerX.equalTo(countLabel)
//            }
//        }
//
//
//        func setButtonEvent() {
//            backButton.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
//            pushButton.addTarget(self, action: #selector(tappedPlusButton), for: .touchUpInside)
//        }
//
//        @objc
//        func tappedBackButton() {
//            delegate?.dataBind(count: count)
//            self.dismiss(animated: true)
//        }
//
//        @objc
//        func tappedPlusButton() {
//            count += 1
//        }
}

