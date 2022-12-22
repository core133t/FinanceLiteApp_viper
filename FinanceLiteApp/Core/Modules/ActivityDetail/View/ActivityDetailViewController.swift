//
//  ActivityDetailViewController.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 19.12.2022.
//

import UIKit

final class ActivityDetailsViewController: UIViewController {

    // MARK: Public Properties

    var presenter: ActivityDetailsPresenterProtocol?
    
    // MARK: - Private Properties

    private lazy var contentView = ActivityDetailsView()
    
    // MARK: UIViewController LifeCycle

    override func loadView() {
        self.view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
}

// MARK: - ActivityDetailsPresenterDelegate

extension ActivityDetailsViewController: ActivityDetailsPresenterDelegate {
    func showData(_ activity: Activity) {
        contentView.setupWithActivity(activity)
    }
    
    func showError(message: String) {
        showAlertError(message: message)
    }
}
