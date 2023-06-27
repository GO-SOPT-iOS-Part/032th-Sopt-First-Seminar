import UIKit
import Then

struct MyPage {
//    let image: UIImage
//    let inform: String
//    let place: String
//    let time: String
//    let tradeStatus: Trade
//    let price: Int
    
    var label: String
    var enter: UIImage
}

@frozen
enum TextLiteral {
    static let tableViewFirstSectionTextArray: [String] = [
        "이용권",
        "1:1 문의내역",
        "예약알림",
        "회원정보 수정",
        "프로모션 정보 수신 동의"
    ]
    static let tableViewSecoondSectionTextArray: [String] = [
        "공지사항",
        "이벤트",
        "고객센터",
        "티빙 알아보기"
    ]
//    static let
}



@frozen
enum Trade {
    case reservation
    case completed
    case shared
    case clear
    
    var title: String {
        switch self {
        case .reservation:
            return "예약중"
        case .completed:
            return "거래완료"
        case .shared:
            return "나눔완료"
        case .clear:
            return ""
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .reservation:
            return .systemGreen
        case .completed:
            return .black
        case .shared:
            return .gray
        case .clear:
            return .white
        }
    }
    
}
