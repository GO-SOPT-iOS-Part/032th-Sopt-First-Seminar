import UIKit
import SnapKit
import Then

class Press1ViewController : UIViewController {
    
    private let countLabel = UILabel().then{
        $0.text = "조금만 더 눌러봐"
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .systemPink
    }
    
    private lazy var nextButton = UIButton().then {
        $0.setTitle("조금만 더 눌러!!!!!!", for: .normal)
        $0.backgroundColor = .brown
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self, action: #selector(pushToPress2ViewController), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
    }
}

extension Press1ViewController{
    private func style(){
        view.backgroundColor = .white
    }
    private func setLayout(){
        
        [countLabel, nextButton].forEach {
                    $0.translatesAutoresizingMaskIntoConstraints = false
                    view.addSubview($0)
                }
        
        countLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalTo(countLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(50)
            $0.trailing.equalToSuperview().inset(50)
            $0.height.equalTo(30)
        }
    }
    @objc
    private func pushToPress2ViewController() {
        let press2ViewController = Press2ViewController()
        self.navigationController?.pushViewController(press2ViewController, animated: true)
    }
}
