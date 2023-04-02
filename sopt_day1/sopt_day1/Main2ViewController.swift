import UIKit

final class SecondViewController_1st_Seminar: UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "제 이름은요!"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("뒤로가기", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(backbuttonTapped), for: .touchUpInside)
        return button
    }()
    
    var name: String?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        style()
        setLayout()
        dataBind()
    }
    func dataBind() {
            nameLabel.text = name
        }
}

private extension SecondViewController_1st_Seminar {
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        [nameLabel, backButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        
        
        NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     backButton.heightAnchor.constraint(equalToConstant: 48)])
    }
    
    @objc
    func backbuttonTapped() {
        
        //바로 밑에 코드 if{}만 적었다면 기본 내장된 네비게이션바에서 팝은 됐을테지만, 중앙에 임의로 설계한 버튼 누를 시 아무일도 안일어남
        if self.navigationController == nil {
            self.dismiss(animated: true, completion: nil)
            print("present에 관한 디스미스")
        } else {
            self.navigationController?.popViewController(animated: true)
            print("push에 관한 팝")
        }//그러나, else{}코드를 작성함으로 인해, 중앙에 배치된 버튼 누를 시 팝 처리 가능.›
    }
}
