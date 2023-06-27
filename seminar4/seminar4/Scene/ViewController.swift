//import UIKit
//import SnapKit
//import Then
//
//class ViewController: UIViewController {
//    
//    let locationArray = ["gongju", "gwangju", "gumi", "gunsan", "daegu", "daejeon", "mokpo", "busan", "seosan", "seoul", "sokcho", "suwon", "suncheon", "ulsan", "iksan", "jeonju", "jeju", "cheonan", "cheongju", "chuncheon"]
//    
////    var resultArray: [resultArrayDataModel] = []
//    var index: Int = 0
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.setLayout()
//        getSyncWeatherData()
//        self.setTableViewConfig()
//        view.backgroundColor = .red
//        tableView.backgroundColor = .blue
//    }
//    
//    private func setTableViewConfig() {
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
//        self.tableView.register(WeatherTVC.self,
//                                forCellReuseIdentifier: WeatherTVC.identifier)
//    }
//    
//    private func getSyncWeatherData() {
//        WeatherService.shared.getWeather(location: self.locationArray[index]) { response in
//            switch response {
//            case .success(let data):
//                guard let data = data as? Weathers else { return }
//                dump(data)
//                self.resultArray.append(.init(imageId: data.weather[0].icon,
//                                              location: data.name,
//                                              temperature: data.main.temp,
//                                              hudmity: data.main.humidity))
////                dump(data)
//                self.index += 1
//                if self.index != self.locationArray.count - 1 {
//                    self.getSyncWeatherData()
//                    self.tableView.reloadData()
//                } else {
//                    self.tableView.reloadData()
//                }
//                
//            default:
//           //     print(response)
//                return
//            }
//        }
//    }
//    
//    
//    private func setLayout() {
//        self.view.addSubview(tableView)
//        tableView.snp.makeConstraints{
//            $0.top.bottom.leading.trailing.equalToSuperview()
//        }
//    }
//    
//    private let tableView = UITableView(frame: .zero, style: .grouped).then {
//        $0.backgroundColor = .white
//    }
//    
//}
//
//extension ViewController: UITableViewDelegate {}
//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.resultArray.count - 1
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTVC.identifier) as? WeatherTVC else {return UITableViewCell()}
//        let data = self.resultArray[indexPath.row]
//        cell.bindData(imageId: data.imageId,
//                      location: data.location,
//                      temperature: data.temperature,
//                      hudmity: data.hudmity)
//        
//        return cell
//    }
//    
//    
//}
//
