//import UIKit
//
//import SnapKit
//import Then
//
//final class DelegateVC_First: UIViewController {
//    
//    private lazy var resultLabel = UILabel().then {
//        $0.text = "다음 창으로 가서 막 누르고 와 ㅋㅋ"
//        $0.textColor = .black
//        $0.font = UIFont.boldSystemFont(ofSize: 20)
//    }
//    
//    private lazy var nextButton = UIButton().then {
//        $0.setTitle("다음으로!", for: .normal)
//        $0.setTitleColor(.white, for: .normal)
//        $0.backgroundColor = .gray
//    }
//        
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        addComponent()
//        setLayout()
//        setButtonEvent()
//    }
//}
//
//extension DelegateVC_First {
//    
//    func addComponent() {
//        [resultLabel, nextButton].forEach{
//            view.addSubview($0)
//        }
//    }
//    
//    func setLayout() {
//        view.backgroundColor = .systemPink
//        
//        resultLabel.snp.makeConstraints { make in
//            make.centerX.centerY.equalToSuperview()
//        }
//        
//        nextButton.snp.makeConstraints { make in
//            make.top.equalTo(resultLabel.snp.bottom).offset(10)
//            make.centerX.equalTo(resultLabel)
//        }
//    }
//    
//    func setButtonEvent() {
//        nextButton.addTarget(self, action: #selector(tappedNextButton), for: .touchUpInside)
//    }
//    
//    @objc
//    func tappedNextButton() {
//        let secondViewController = DelegateVC_Second()
//        secondViewController.modalPresentationStyle = .formSheet
//        secondViewController.delegate = self
//        self.present(secondViewController, animated: true)
//    }
//}
//
//extension DelegateVC_First: DataBindProtocol {
//    func dataBind(count: Int) {
//        resultLabel.text = "조금 더 눌러바 ... \(String(count))번 누르고 왔구나!"
//    }
//}
