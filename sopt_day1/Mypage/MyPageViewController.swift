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
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setStyle() {
        
        view.backgroundColor = .purple
        
    }
    
    override func setLayout() {
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
}

