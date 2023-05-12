import Foundation

enum Sopt {
    case plan
    case design
    case aos
    case iOS(haveMacBook: Bool)
    case web
    case server
}

func soptPart(part: Sopt, name: String){
    switch part{
    case .plan: print("당신은 멋진 기획자가 될거에요!")
    case .design: break
    case .aos: break
    case .iOS(let haveMacBook):
        if haveMacBook {
            print("맥북으로 멋지게 아요코딩하자궁")
        }
        else{
            print("잠깐만! \(part)는 맥북은 필수라는 점~!")
        }
    case .web:print("\(part)의 \(name) 당신은 최고의 웹 개발자입니다!")
    case .server: break
    }
}

soptPart(part: .iOS(haveMacBook: true), name: "Ko youngmin")
