//import UIKit
//
//class MyPageTableView: UITableView {
//
//    private func setupTableView() {
//        register(MyPageTableViewCell.self, forCellReuseIdentifier: MyPageTableViewCell.cellId)
//        dataSource = self
//        separatorStyle = .none
//        showsVerticalScrollIndicator = false
//        backgroundColor = .black
//    }
//}
//
//extension MyPageTableView: UITableViewDataSource {
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch section {
//        case 0:
//            return TextLiteral.tableViewFirstSectionTextArray.count
//        case 1:
//            return TextLiteral.tableViewSecoondSectionTextArray.count
//        default: return Int()
//        }
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = self.dequeueReusableCell(withIdentifier: MyPageTableViewCell.cellId, for: indexPath) as! MyPageTableViewCell
//        let section = indexPath.section
//        let row = indexPath.row
//        if section == 0 {
//            cell.cellLabel.text = TextLiteral.tableViewFirstSectionTextArray[row]
//        } else {
//            cell.cellLabel.text = TextLiteral.tableViewSecoondSectionTextArray[row]
//        }
//        cell.selectionStyle = .none
//        return cell
//    }
//}
