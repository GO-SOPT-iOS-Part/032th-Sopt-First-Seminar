////
////  TvingViewController.swift
////  sopt_Seminar
////
////  Created by 고영민 on 2023/04/14.
////
//
//import UIKit
//import Then
//import SnapKit
//
//final class TvingViewController: UIViewController {
//
//    private lazy var titleLabel = UILabel().then {         //Tving ID 로그인
//        $0.text = "Tving ID 로그인"
//        $0.textColor = .white
//        $0.font = UIFont.boldSystemFont(ofSize: 20)
//    }
//
//    private lazy var NewAcountLabel = UILabel().then{         // 아직 계정이 없으신가요?
//        $0.text = "아직 계정이 없으신가요?"
//        $0.textColor = .gray
//        $0.font = UIFont.boldSystemFont(ofSize: 15)
//
//    }
//    private let idTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "아이디"                   // 아이디
//        textField.clearButtonMode = .whileEditing
//        textField.layer.borderColor = UIColor.gray.cgColor
//        textField.layer.borderWidth = 1
//        return textField
//    }()
//
//
//    private let passwordTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "비밀번호"                   // 비밀번호
//        textField.clearButtonMode = .whileEditing
//        textField.layer.borderColor = UIColor.gray.cgColor
//        textField.layer.borderWidth = 1
//        return textField
//    }()
//
//    private lazy var loginButton = UIButton().then {    // 로그인 btn
//        $0.setTitle("로그인하기", for: .normal)
//        $0.setTitleColor(.white, for: .normal)
//        $0.backgroundColor = .gray
//    }
//
//    private lazy var find_id_Button = UIButton().then{      //아이디찾기 btn
//        $0.setTitle("아이디 찾기", for: .normal)
//        $0.setTitleColor(.white, for: .normal)
//        $0.backgroundColor = .gray
//    }
//
//    private lazy var find_pw_Button = UIButton().then{      //비밀번호찾기 btn
//        $0.setTitle("비밀번호 찾기", for: .normal)
//        $0.setTitleColor(.white, for: .normal)
//        $0.backgroundColor = .gray
//    }
//
//
//
//    // MARK: - App Life Cycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//
//
//
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
