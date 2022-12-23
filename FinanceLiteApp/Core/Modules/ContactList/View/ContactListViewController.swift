//
//  ContactListViewController.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import UIKit

import UIKit

final class ContactListViewController: UIViewController {

    private lazy var contentView: ContactListView = {
        return ContactListView(tableViewDataSource: self,
                               tableViewDelegate: self)
    }()

    private(set) var contactList: [ContactEntity] = []

    var presenter: ContactListPresenterProtocol

    init(presenter: ContactListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = self.contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contact list"
        presenter.viewDidLoad()
    }
}

extension ContactListViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactCellView.cellIdentifier, for: indexPath) as? ContactCellView else {
            return UITableViewCell()
        }
        let contact = contactList[indexPath.row]
        cell.setupCell(contact: contact)
        return cell
    }
}

extension ContactListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ContactCellView.cellSize
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true)
    }
}

extension ContactListViewController: ContactListPresenterDelegate {
    func showData(_ contactList: [ContactEntity]) {
        self.contactList = contactList
        self.contentView.loadData()
    }
}
