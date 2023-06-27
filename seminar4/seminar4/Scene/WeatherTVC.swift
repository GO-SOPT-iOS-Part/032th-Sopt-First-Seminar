import UIKit
import SnapKit
import Then
import Kingfisher

class WeatherTVC: UITableViewCell {
    static let identifier: String = "WeatherTVC"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    internal func bindData(imageId: String,
                           location: String,
                           temperature: Double,
                           hudmity: Int) {
        
        let imageURL = URL(string: Config.baseURL + "/img/w/\(imageId).png")
        self.imageview.kf.setImage(with: imageURL)
        
        self.locationLabel.text = location
        self.temperatureLabel.text = String(temperature)
        self.hudmityLabel.text = String(hudmity)

    }
    
    private func setLayout() {
        self.addSubview(imageview)
        self.addSubview(stackView)
        
        imageview.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
            $0.width.height.equalTo(150)
        }
        
        stackView.snp.makeConstraints {
            $0.trailing.top.bottom.equalToSuperview()
            $0.leading.equalTo(imageview.snp.trailing)
        }
        
        stackView.addArrangedSubview(locationLabel)
        stackView.addArrangedSubview(temperatureLabel)
        stackView.addArrangedSubview(hudmityLabel)
    }
    
    
    private let imageview = UIImageView()
    private let stackView = UIStackView().then {
        $0.distribution = .fillEqually
        $0.axis = .vertical
    }
    private let locationLabel = UILabel().then {
        $0.textAlignment = .right
    }
    private let temperatureLabel = UILabel().then {
        $0.textAlignment = .right
    }
    private let hudmityLabel = UILabel().then {
        $0.textAlignment = .right
    }
}
