import UIKit

import SnapKit

final class CommonView: UIView {
    
    let nameLabel = UILabel().then {
        $0.text = "이름이 무엇인가요!?"
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .blue
        $0.textAlignment = .center
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("SecondView Error!")
    }
}
