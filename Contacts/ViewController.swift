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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") else {
            print("Create new cell for row with index \(indexPath.row)")
            let newCell = UITableViewCell(style: .default, reuseIdentifier: "MyCell")
            //        конфигурируем ячейку
            var configuration = newCell.defaultContentConfiguration()
            configuration.text = "Row \(indexPath.row)"
            newCell.contentConfiguration = configuration
            //        возвращаем сконфигурированный экземпляр ячейки
            return newCell
        }
        print("Use old cell for row with index \(indexPath.row)")
        //        возвращаем сконфигурированный экземпляр ячейки
        return cell
        
    }
}
