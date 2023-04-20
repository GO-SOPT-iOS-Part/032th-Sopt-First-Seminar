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
    
    var backgroundHiddenCompletionHandler : ((Bool) -> (Void))?
    var nickNameCompletionHandler : ((String) -> (Void))?
    
    private let backgroundView = UIView().then{
        $0.backgroundColor = UIColor.color000000
        $0.layer.opacity = 0.5
    }
    
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
        textField.textColor = UIColor.colorFFFFFF
        return textField
    }()
    
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"                   // 비밀번호
        textField.clearButtonMode = .whileEditing
        textField.isSecureTextEntry = true
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        textField.textColor = UIColor.colorFFFFFF
        return textField
    }()
    
    private let loginButton = UIButton().then {
        $0.setTitle("로그인하기", for: .normal)
        $0.setTitleColor(UIColor.color9C9C9C, for: .normal)
        // $0.titleLabel?.font = UIFont.pretendard(.semiBold, size: 14)
        $0.backgroundColor = .color000000
        $0.layer.cornerRadius = 3
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.color2E2E2E.cgColor
    }
    private let find_id_Button = UIButton().then {      //아이디찾기 btn
        $0.setTitle("아이디 찾기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .gray
    }
    
    private let find_pw_Button = UIButton().then {      //비밀번호찾기 btn
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .gray
    }
    
    @objc private let createAccountButton = UIButton().then {     //회원가입버튼
        $0.setTitle("TVING ID 회원가입하기", for: .normal)
        $0.frame=CGRect(x:100, y:100, width:200, height:50)
        $0.setTitleColor(UIColor.color9C9C9C, for: .normal)
    }
    
    private let passwordTextRemoveButton = UIButton().then {        // 글자 및 숫자 한 번에 지우기
        $0.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        $0.tintColor = .color626262
    }
    
    private let passwordTextSecureToggleButton = UIButton().then {      //비밀번호 가리기
        $0.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        $0.tintColor = .color626262
    }
    
    private let separateView = UIView().then {
        $0.backgroundColor = UIColor.color2E2E2E
    }
    
    private let findStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 36
    }
    
    private let accountStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 17
    }
    
    // MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addComponent()
        setLayout()
        actions()
        style()
        extensions()
        //idTextField.delegate = self
        //passwordTextField.delegate = self
    }
    private func extensions() {
        createAccountButton.setUnderline()
        idTextField.setPlaceholderColor(UIColor.color9C9C9C)
        passwordTextField.setPlaceholderColor(UIColor.color9C9C9C)
        passwordTextField.addLeftPadding(leftPadding: 22)
        idTextField.addLeftPadding(leftPadding: 22)
        passwordTextField.addRightPadding(rightPadding: 86)
        idTextField.addRightPadding(rightPadding: 22)
    }
    private func actions(){
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        passwordTextRemoveButton.addTarget(self, action: #selector(passwordTextRemoveButtonTapped), for: .touchUpInside)
        passwordTextSecureToggleButton.addTarget(self, action: #selector(passwordTextSecureToggleButtonTapped), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(getter: createAccountButton), for: .touchUpInside)
    }
    @objc func loginButtonTapped(_ sender : UITextField) {
        let tving2ViewController = Tving2ViewController()
        tving2ViewController.modalTransitionStyle = .crossDissolve
        tving2ViewController.modalPresentationStyle = .fullScreen
        tving2ViewController.userInfoText = idTextField.text ?? ""
        if let userName = userName {
            tving2ViewController.userInfoText = userName
        }
        else {
            tving2ViewController.userInfoText = idTextField.text ?? ""
        }
        present(tving2ViewController, animated: true)
    }
    
    
    @objc func createAccountButtonTapped() {
        let tvingUserNameBottomSheetViewController = TvingUserNameBottomSheetViewController()
        tvingUserNameBottomSheetViewController.modalTransitionStyle = .coverVertical
        tvingUserNameBottomSheetViewController.modalPresentationStyle = .overFullScreen
        backgroundView.isHidden = false
        tvingUserNameBottomSheetViewController.backgroundHiddenCompletionHandler = { [weak self] value in
            guard let self else { return }
            self.backgroundView.isHidden = value
        }
        present(tvingUserNameBottomSheetViewController, animated: true)
    }
    
    @objc func passwordTextRemoveButtonTapped() {
        passwordTextField.text = ""
    }
    @objc func passwordTextSecureToggleButtonTapped(_ sender : UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            passwordTextSecureToggleButton.setImage(UIImage(systemName: "eye"), for: .normal)
            passwordTextField.isSecureTextEntry = false
        }
        else {
            passwordTextSecureToggleButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            passwordTextField.isSecureTextEntry = true
        }
    }
}

// MARK: - Functions
//extension 안에 에컴, 셋레이아웃, func, obj, obj
extension TvingViewController {
    
    func style(){
        view.backgroundColor = UIColor.black
        backgroundView.isHidden = true
    }
    
    func addComponent() {
        [titleLabel,newAcountLabel,idTextField,passwordTextField,loginButton,find_id_Button,find_pw_Button,newAcountLabel,createAccountButton, passwordTextRemoveButton, passwordTextSecureToggleButton, backgroundView].forEach {
            view.addSubview($0)
        }
    }
    
    func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton, findStackView, accountStackView, passwordTextRemoveButton, passwordTextSecureToggleButton, backgroundView].forEach {
            view.addSubview($0)
        }
        [find_id_Button, separateView, find_pw_Button].forEach {
            findStackView.addArrangedSubview($0)
        }
        [newAcountLabel, createAccountButton].forEach {
            accountStackView.addArrangedSubview($0)
        }
        backgroundView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(50)
        }
        idTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(31)
            $0.leading.equalToSuperview().offset(20)
            $0.height.equalTo(52)
        }
        passwordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(20)
            $0.height.equalTo(52)
        }
        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passwordTextField.snp.bottom).offset(21)
            $0.leading.equalToSuperview().offset(20)
            $0.height.equalTo(52)
        }
        findStackView.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.centerX.equalToSuperview()
        }
        
        separateView.snp.makeConstraints {
            $0.width.equalTo(1)
            $0.height.equalTo(12)
        }
        accountStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(findStackView.snp.bottom).offset(28)
        }
        newAcountLabel.snp.makeConstraints {
            $0.height.equalTo(22)
        }
        createAccountButton.snp.makeConstraints {
            $0.width.equalTo(128)
            $0.height.equalTo(22)
        }
        passwordTextSecureToggleButton.snp.makeConstraints {
            $0.centerY.equalTo(passwordTextField)
            $0.trailing.equalTo(passwordTextField.snp.trailing).offset(-20)
            $0.width.equalTo(20)
            $0.height.equalTo(52)
        }
        passwordTextRemoveButton.snp.makeConstraints {
            $0.centerY.equalTo(passwordTextField)
            $0.trailing.equalTo(passwordTextSecureToggleButton.snp.leading).offset(-16)
            $0.width.equalTo(20)
            $0.height.equalTo(52)
        }
    }
}
//MARK: - EXTENSION
private extension TvingViewController{
    func enabledLoginButton() {
        loginButton.isEnabled = true
        loginButton.backgroundColor = UIColor.colorFF143C
        loginButton.layer.borderColor = UIColor.colorFF143C.cgColor
        loginButton.setTitleColor(UIColor.colorFFFFFF, for: .normal)
    }
    func disenabledLoginButton() {
        loginButton.isEnabled = false
        loginButton.backgroundColor = UIColor.color000000
        loginButton.layer.borderColor = UIColor.color2E2E2E.cgColor
        loginButton.setTitleColor(UIColor.color9C9C9C, for: .normal)
    }
    ///이메일 정규식
    func isValidEmail(email: String) -> Bool {
        let emailRegex = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$"#
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    ///비밀번호 정규식
    func isValidPassword(password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,50}"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
}

// MARK: 다른 창으로 넘어가기





// func 뭐 만들껀지 ->
//    텍스트필드 터치 시 테두리 컬러 변경
//
//    글자 입력시 글자 x버튼 만들기
//
//    비밀번호 텍스트필드 → 눈동자 버튼 클릭 시 패스워드 security 해제
//
//    모달형식
//
//    세번째 뷰 아이디
//
//    - 데이터의 흐름이 BottomSheet → 로그인뷰 → 로그인 완료뷰 순으로 되어야겠죠?!
//    - 닉네임 텍스트필드의 텍스트는 한글로 제한합니다!

// 모달


extension TvingViewController : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = (textField.text ?? "") as NSString
        let newText = currentText.replacingCharacters(in: range, with: string)
        
        if textField == idTextField {
            let isValidEmail = isValidEmail(email: newText)
            
            if isValidEmail && isValidPassword(password: passwordTextField.text ?? "") {
                enabledLoginButton()
            }
            else {
                disenabledLoginButton()
            }
        }
        else if textField == passwordTextField {
            let isValidPassword = isValidPassword(password: newText)
            
            if isValidPassword && isValidEmail(email: idTextField.text ?? "") {
                enabledLoginButton()
            }
            else {
                disenabledLoginButton()
            }
        }
        return true
    }
}
