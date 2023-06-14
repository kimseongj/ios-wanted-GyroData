//
//  ListViewController.swift
//  GyroData
//
//  Created by kimseongjun on 2023/06/13.
//

import UIKit

class ListViewController: UIViewController {
    private enum Section: CaseIterable {
        case main
    }
    
    private var dataSource: UITableViewDiffableDataSource<Section, Motion>!
    
    private lazy var measureButton: UIButton = {
       let button = UIButton()
        button.setTitle("측정", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(tapMeasurebutton), for: .touchUpInside)
        
        return button
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .blue
       return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
        configureRightBarItem()
        
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "목록"
    }
    
    private func configureRightBarItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: measureButton)
    }
    
    @objc
    private func tapMeasurebutton() {
        let measureViewController = MeasureViewController()
        
        navigationController?.pushViewController(measureViewController, animated: true)
    }
    
    private func configureUI() {
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
    
    private func configureDataSource() {
        tableView.register(ListCell.self, forCellReuseIdentifier: ListCell.identifier)
        
        dataSource = UITableViewDiffableDataSource<Section, Motion>(
            tableView: tableView,
            cellProvider: { tableView, indexPath, motion in
                
                let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.identifier, for: indexPath) as? ListCell
                
                cell?.configureCell(motion: motion)
                
                return cell
            }
        )
    }
}
