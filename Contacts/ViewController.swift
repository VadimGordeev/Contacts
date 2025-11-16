//
//  ViewController.swift
//  Contacts
//
//  Created by Vadim on 16/11/2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//        tableView.dataSource = self
//        tableView.delegate = self
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        производим попытку загрузки переиспользуемой ячейки
        guard var cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") else {
            print("Create new cell for row with index \(indexPath.row)")
            var newCell = UITableViewCell(style: .default, reuseIdentifier: "MyCell")
            //        конфигурируем ячейку
            configure(cell: &newCell, for: indexPath)
            //        возвращаем сконфигурированный экземпляр ячейки
            return newCell
        }
        print("Use old cell for row with index \(indexPath.row)")
        configure(cell: &cell, for: indexPath)
        //        возвращаем сконфигурированный экземпляр ячейки
        return cell
        
    }
    
    private func configure(cell: inout UITableViewCell, for indexPath: IndexPath) {
        var configuration = cell.defaultContentConfiguration()
        configuration.text = "Row \(indexPath.row)"
        cell.contentConfiguration = configuration
    }
}
