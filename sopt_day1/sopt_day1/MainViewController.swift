//
//  MainViewController.swift
//  sopt_day1
//
//  Created by 고영민 on 2023/04/01.
//

import UIKit
//키트 변수들 총출동
class MainViewController: UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름이 무엇인가요!?"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .blue
        label.textAlignment = .center
        label.layer.shadowOpacity = 0.8
        label.layer.shadowRadius = 3
        label.layer.shadowOffset = CGSize(width: 2, height: 2)
        label.layer.shadowColor = UIColor.blue.cgColor
        return label
    }()
    
    
    private let realUIImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "fun")
        return imageView
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 입력해주세요"
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
       
          // 이니셜라이즈 , '.' 프로퍼티, 메서드
        return textField
    }()
    
    private lazy var presentButton: UIButton = {
        let button = UIButton()
        button.setTitle("present!", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.blue, for: .normal)
        button.layer.cornerRadius = 20
        // 새롭게 추가 !!!!!!!!!!!!
        button.addTarget(self,
                         action: #selector(presentButtonTapped),
                         for: .touchUpInside)
        
        return button
    }()
    
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("push!", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.blue, for: .normal)
        
        // 새롭게 추가 !!!!!!!!!!!
        button.addTarget(self,
                         action: #selector(pushButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() { //생명주기함수
        super.viewDidLoad()//생명주기함수는 보통 앱의 디자인과 레이아웃 코드와 함께 따로 빼놓는구나.
        style()
        setLayout()
    }
    
    
}

private extension MainViewController { //생명주기 내에 들어갈, 디자인적 코드
    func style() {
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        [nameLabel, nameTextField,
         presentButton, pushButton, realUIImage].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     nameTextField.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([presentButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
                                     presentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     presentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     presentButton.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([pushButton.topAnchor.constraint(equalTo: presentButton.bottomAnchor, constant: 20),
                                     pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     pushButton.heightAnchor.constraint(equalToConstant: 48)])
        NSLayoutConstraint.activate([
            realUIImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            realUIImage.heightAnchor.constraint(equalToConstant: 200),
            realUIImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            view.trailingAnchor.constraint(equalTo: realUIImage.trailingAnchor, constant: 50)
        ])
    }
}
//진짜 '호출 시 생길 반응' 같은 기능적인 함수 
private extension MainViewController {
    func presentToSecondViewController() {
        
        let secondViewController = SecondViewController_1st_Seminar()
        secondViewController.modalPresentationStyle = .fullScreen
        present(secondViewController, animated: true)
    }
    
    func pushToSecondViewController() {
        
        guard let name = nameTextField.text else { return }
        let secondViewController = SecondViewController_1st_Seminar()
        secondViewController.name = name
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    @objc
    func presentButtonTapped() {
        
        presentToSecondViewController()
    }
    
    @objc
    func pushButtonTapped() {
        
        pushToSecondViewController()
    }
}
