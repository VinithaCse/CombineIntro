//
//  ViewController.swift
//  CombineIntro
//
//  Created by Vinitha Rao A on 20/04/22.
//

import UIKit
import Combine


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let tableView: UITableView = {
        let table = UITableView()
        return table
    }()
        
    let userVM = UserViewModel()
    var observer: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        userVM.getData()
        observer = userVM.showUserModel.sink(receiveValue: { userModel in
            self.userVM.userModel = userModel
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = self.userVM.userModel.name
        return cell
    }
}

