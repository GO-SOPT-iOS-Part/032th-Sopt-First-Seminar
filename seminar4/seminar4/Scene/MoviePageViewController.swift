//
//  MoviePageViewController.swift
//  seminar4
//
//  Created by 고영민 on 2023/05/12.
//

import UIKit

import SnapKit
import Then

class MoviePageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    private var MovieResultData: [Result] = []
    
    
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        setStyle()
        setLayout()
        getMovieInfo()
    }
    

    func setStyle(){
        
        tableView.do{
            $0.delegate = self
            $0.dataSource = self
        }
        
    }

    func setLayout(){
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    func register(){
        tableView.register(MoviePageViewTableViewCell.self, forCellReuseIdentifier: MoviePageViewTableViewCell.cellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieResultData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MoviePageViewTableViewCell.cellIdentifier, for: indexPath) as? MoviePageViewTableViewCell else {
                    return UITableViewCell() }
        
        
        cell.configureCell(MovieResultData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func getMovieInfo(){
            MovieInfoService.shared.Movie(){ response in
                dump(response)
                switch response {
                case .success(let data):
                    guard let data = data as? MovieInfo else {return}
                    self.MovieResultData = data.results
                    self.tableView.reloadData()
                    
                default:
                    return
                }
            }
            
        }
    
}
