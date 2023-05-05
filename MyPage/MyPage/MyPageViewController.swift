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
    
    
    private let myArray = [
        TextLiteral.tableViewFirstSectionTextArray,
        TextLiteral.tableViewSecoondSectionTextArray,
    ]
    
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
    func numberOfSections(in tableView: UITableView) -> Int {
        return myArray.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let view = UIView()
            view.backgroundColor = .white
            view.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 2)
            return view
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //configure cell , 더미 호출
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MyPageTableViewCell.identifier, for: indexPath) as! MyPageTableViewCell
        print("이건 섹션 \(indexPath.section)")
        print("이건 로우 \(indexPath.row)")
        cell.configureCell(myArray[indexPath.section][indexPath.row])
        
        
        
        //cell.configureCell(tableViewFirstSectionTextArray[indexPath.row])
        return cell
    }
}

