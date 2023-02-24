//
//  HomeView.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import UIKit

// MARK: Protocols
protocol HomeViewDelegate: AnyObject {
    func didSelectActivity(activity: ActivityEntity)
}

// MARK: Class
final class HomeView: UIView {
    
    // MARK: Properties
    weak var delegate: HomeViewDelegate?

    // MARK: Components
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()

    let homeHeaderView: HomeHeaderView = {
        let homeHeaderView = HomeHeaderView()
        return homeHeaderView
    }()

    lazy var activityListView: ActivityListView = {
        let activityListView = ActivityListView()
        activityListView.translatesAutoresizingMaskIntoConstraints = false
        activityListView.delegate = self
        return activityListView
    }()
    
    // MARK: Init
    init() {
        super.init(frame: .zero)
        backgroundColor = .white

        stackView.addArrangedSubview(homeHeaderView)
        stackView.addArrangedSubview(activityListView)
        stackView.setCustomSpacing(32, after: homeHeaderView)
        addSubview(stackView)

        let estimatedHeight = CGFloat(6)*ActivityListView.cellSize

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),//(-150) can add constant if need
            activityListView.heightAnchor.constraint(equalToConstant: estimatedHeight)
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWithHomeData(_ homeEntity: HomeEntity) {
        // Header
        homeHeaderView.label.text = "$\(homeEntity.balance)"
        homeHeaderView.savingsValueLabel.text = "$\(homeEntity.savings)"
        homeHeaderView.spendingValueLabel.text = "$\(homeEntity.spending)"
        // List
        activityListView.items = homeEntity.listActivity
    }
}

// MARK: Extensions
extension HomeView: ActivityListViewDelegate {
    
    func didSelectedActivity(activity: ActivityEntity) {
        delegate?.didSelectActivity(activity: activity)
    }
}
