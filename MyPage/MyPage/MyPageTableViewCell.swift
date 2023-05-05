//
//  MyPageTableViewCell.swift
//  MyPage
//
//  Created by 고영민 on 2023/04/29.
//

import UIKit
import Then
import SnapKit

class MyPageTableViewCell: UITableViewCell {
    
    static let identifier = "MypageTableViewCell"
    static let cellId = "CellId"

    
    private let label1 = UILabel().then {
        $0.textColor = .blue
        $0.font = UIFont.boldSystemFont(ofSize: 15)
    }
    private var button1 = UIImageView().then {
        $0.image = UIImage(named: "img_toggle")
    }
    
//    let cellLabel = UILabel().then {
//        $0.textColor = .blue
//        $0.font = UIFont.boldSystemFont(ofSize: 15)
//    }
//    private var cellChevron = UIImageView().then {
//        let button1 = UIImageView()
//        $0.image = UIImage(named: "img_toggle")
//    }
//
    func setLayout(){
        
        [label1,button1]
            .forEach{self.addSubview($0)}
        label1.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
        }
        button1.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
            $0.height.width.equalTo(17)
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        Style()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func Style(){
        self.backgroundColor = .black
        // 줄 간격 없애는 왼쪽 기준으로 0
        separatorInset.left = 0
        
        // 터치 시 클릭 이벤트, 색상 없애기
        selectionStyle = .none
        
        label1.do {
            $0.textAlignment = .center
            $0.textColor = .white
            $0.font = UIFont.boldSystemFont(ofSize: 11)
        }
        
        button1.do {
            $0.backgroundColor = UIColor.black
            $0.layer.cornerRadius = 3
            $0.layer.borderWidth = 1
        }
    }
    //
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func configureCell(_ data: String) {
            print(data)
        print(TextLiteral.tableViewFirstSectionTextArray)
        print(TextLiteral.tableViewSecoondSectionTextArray)
        label1.text = data
        
       // button.setTitle(, forSegmentAt: <#T##Int#>)
       // datakym.text=TextLiteral.tableViewSecoondSectionTextArray
      //  datakym2.text=TextLiteral.tableViewFirstSectionTextArray
      //  label1.text = data.text
//            carrotImage.image = MyPage.image
//            productLabel.text = MyPage.product
//            placeLabel.text = MyPage.place
//            timeLabel.text = MyPage.time
            
//                    // enum 프로퍼티에서 만든 프로퍼티에 return값에 따라 매칭
//            reservationLabel.text = carrot.tradeStatus.title
//            reservationLabel.backgroundColor = carrot.tradeStatus.backgroundColor
//
//            reservationLabel.isHidden = carrot.tradeStatus == .clear
//
//                    // endIndex에 접근해서 맨뒤 기준으로 3칸 앞에 있는 곳에 "," 추가
//                    // 1000원 -> 1,000원
//            var price = String(carrot.price)
//            price.insert(",", at: price.index(price.endIndex, offsetBy: -3))
//            priceLabel.text = price + "원"
        
        }
    }

