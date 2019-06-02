//
//  ResumeTableViewController.swift
//  ResumeDemo
//
//  Created by Evgeny Yagrushkin on 2019-05-31.
//  Copyright © 2019 Evgeny Yagrushkin. All rights reserved.
//

import UIKit

class ResumeTableViewController: UITableViewController {

    var viewModel: ResumeViewModel = ResumeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupModel()
    }

    func setupView(){
        self.tableView.register(ExperienceTableViewCell.self, forCellReuseIdentifier: String(describing: ExperienceTableViewCell.self))
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 1))
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    func reloadTableView(){
        tableView.reloadData()

        let frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 0)
        tableView.tableHeaderView = InfoHeaderView(frame: frame, resume: viewModel.resume)
        
        if let headerView = tableView.tableHeaderView {
            let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
            var headerFrame = headerView.frame
            
            // If we don't have this check, viewDidLayoutSubviews() will get
            // repeatedly, causing the app to hang.
            if height != headerFrame.size.height {
                headerFrame.size.height = height
                headerView.frame = headerFrame
                tableView.tableHeaderView = headerView
            }
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Dynamic sizing for the header view
        if let headerView = tableView.tableHeaderView {
            let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
            var headerFrame = headerView.frame
            
            // If we don't have this check, viewDidLayoutSubviews() will get
            // repeatedly, causing the app to hang.
            if height != headerFrame.size.height {
                headerFrame.size.height = height
                headerView.frame = headerFrame
                tableView.tableHeaderView = headerView
            }
        }
    }
    
    func setupModel(){
        let networkManager = NetworkManager()
        viewModel = ResumeViewModel(network: networkManager)
        viewModel.reloaDate { [weak self] in
            self?.reloadTableView()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.resume.experience?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ExperienceTableViewCell.self), for: indexPath)

        if let cell = cell as? ExperienceTableViewCell,
            let experiences = viewModel.resume.experience {
            cell.experience = experiences[indexPath.row]
        }
        return cell
    }
    
}
