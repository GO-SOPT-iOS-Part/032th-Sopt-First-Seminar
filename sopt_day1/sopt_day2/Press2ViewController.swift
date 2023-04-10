import UIKit
import SnapKit
import Then

// #back_btn #touchme_btn #just_label
final class Press2ViewController : UIViewController{
    private let just_label :UILabel = {
        let label = UILabel()
        label.text = "횟수는?!"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .blue
        label.textAlignment = .center
        return label
    }()
    
    private lazy var touchme_btn:UIButton = {
        let button1 = UIButton()
        button1.setTitle("눌러줘", for: .normal)
        button1.backgroundColor = .purple
        button1.titleColor(for: .normal)
        button1.addTarget(self, action: #selector(increaseNumViewController()), for: .touchUpInside)
    }()
    
    private lazy var back_btn:UIButton = {
        let button2 = UIButton()
        button2.setTitle("눌러줘", for: .normal)
        button2.backgroundColor = .purple
        button2.titleColor(for: .normal)
        button2.addTarget(self, action: #selector(popSecondViewController()), for: .touchUpInside)
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
        
    }
}

private extension Press2ViewController{
    


func style() {
    
    view.backgroundColor = .white
}

    func setLayout() {
        
        [just_label, touchme_btn, back_btn].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        just_label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        touchme_btn.snp.makeConstraints {
            $0.top.equalTo(just_label.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(50)
            $0.trailing.equalToSuperview().inset(50)
            $0.height.equalTo(30)
        }
        
        back_btn.snp.makeConstraints {
            $0.top.equalTo(touchme_btn.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(50)
            $0.trailing.equalToSuperview().inset(50)
            $0.height.equalTo(30)
        }
    }

    @objc
    func popSecondViewController() {
        
//        guard let text = nameTextField.text else { return }
//
//        completionHandler?(text)
//
//        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func increaseNumViewController(){
//        guard let text = nameTextField.text else { return }
//
//        completionHandler?(text)
//
//        self.navigationController?.popViewController(animated: true)
        
    }
}
