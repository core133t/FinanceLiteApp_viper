//
//  UserProfileView.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import UIKit

class UserProfileView: UIView {
    
    var itemsForList: [String] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    let userHeaderView: UserProfileHeaderView = {
        let userHeaderView = UserProfileHeaderView()
        userHeaderView.frame = CGRect(x: 0, y: 0, width: 0, height: 232)
        return userHeaderView
    }()
    
    private lazy var tableView: UITableView = {
        //style: .InsertGroup in ios13
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.tableHeaderView = userHeaderView
        return tableView
    }()

    init() {
        super.init(frame: .zero)

        backgroundColor = .white

        addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWithUserProfileData(_ userEntity: UserEntity) {
        //Header
        userHeaderView.nameLabel.text = "\(userEntity.name)"
        userHeaderView.agencyLabel.text = "Agency \(userEntity.account.agency)"
        userHeaderView.accountLabel.text = "Account \(userEntity.account.account)"
        userHeaderView.bankLabel.text = "\(userEntity.account.bank)"
        //List
        itemsForList.append("\(userEntity.phone)")
        itemsForList.append("\(userEntity.email)")
        itemsForList.append("\(userEntity.address)")
    }
}

extension UserProfileView: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")

        switch indexPath.row {
        case 0:

            cell.textLabel?.text = "Phone"
            cell.detailTextLabel?.text = "+5(555)555-55-55"
        case 1:

            cell.textLabel?.text = "E-mail"
            cell.detailTextLabel?.text = "youremail@e-mail.com"
        case 2:

            cell.textLabel?.text = "Address"
            cell.detailTextLabel?.text = "Your Address, 495"
        default:
            break
        }

        if itemsForList.count > 0 {
            cell.detailTextLabel?.text = itemsForList[indexPath.row]
        }

        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "My account"
    }

}
