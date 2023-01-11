//
//  ActivityDetailViewController.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 19.12.2022.
//

import UIKit

final class ActivityDetailsViewController: UIViewController {
    
    var presenter: ActivityDetailsPresenterProtocol
    
    lazy var activityDetailsView: ActivityDetailsView = {
        let view: ActivityDetailsView = ActivityDetailsView()
        view.delegate = self
        return view
    }()
    
    init(presenter: ActivityDetailsPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    override func loadView() {
        self.view = activityDetailsView
    }
    
    private func showAlert(title: String, message: String) {
        let alert = AlertView.showAlert(title: title, message: message)
        self.present(alert, animated: true, completion: nil)
    }
}

extension ActivityDetailsViewController: ActivityDetailsPresenterDelegate {
    func didReportProblem() {
        showAlert(title: "Problem Reported", message: "Your problem has been reported successfully!")
    }
    
    func showData() {
        
        print("Here is your data, View!")
    }
}

extension ActivityDetailsViewController: ActivityDetailsViewDelegate {
    func reportProblem() {
        presenter.reportProblem()
    }
}

