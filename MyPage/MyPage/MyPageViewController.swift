//
//  MyPageBaseViewController.swift
//  sopt_Seminar
//
//  Created by 고영민 on 2023/04/27.
//

import UIKit
import Then
import SnapKit

class MyPageViewController : BaseViewController{
    
    
    private let myArray = ["0-Data", "1-Data", "2-Data", "3-Data"]
    
    private let tableView = UITableView()
    //private let dummy = MyPage.dummy()
    
    private func setTableHeaderFooterView() {
        let superViewWidth = UIScreen.main.bounds.width
        let headView = MyPageHeaderView(frame: CGRect(x: 0, y: 0, width: superViewWidth, height: 300))
        let footerview = MyPageFooterView(frame: CGRect(x: 0, y: 0, width: superViewWidth, height: 100))
        self.tableView.tableHeaderView = headView
        self.tableView.tableFooterView = footerview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableHeaderFooterView()
    }
    
    override func setStyle() {
        tableView.backgroundColor = .black
        view.backgroundColor = .black
        
        tableView.do {
            $0.register(MyPageTableViewCell.self, forCellReuseIdentifier: MyPageTableViewCell.identifier)
            $0.rowHeight = 120
            $0.delegate = self
            $0.dataSource = self
            $0.backgroundColor = .black
        }
    }
    
    override func setLayout() {
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    
}


extension MyPageViewController: UITableViewDelegate {}

extension MyPageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //configure cell , 더미 호출
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MyPageTableViewCell.identifier, for: indexPath) as! MyPageTableViewCell
        print("이건 섹션 \(indexPath.section)")
        print("이건 로우 \(indexPath.row)")
        cell.configureCell(TextLiteral.tableViewFirstSectionTextArray[indexPath.row])
        cell.configureCell(TextLiteral.tableViewSecoondSectionTextArray[indexPath.row])
        
        
        //cell.configureCell(tableViewFirstSectionTextArray[indexPath.row])
        return cell
    }
}

