//
//  ViewController.swift
//  Contacts
//
//  Created by Vadim on 16/11/2025.
//

import UIKit

class ViewController: UIViewController {
    private var contacts = [ContactProtocol]()

    private func loadContacts() {
        contacts.append(Contact(title: "Vadim", phone: "+480501234567"))
        contacts.append(Contact(title: "John", phone: "+480501234567"))
        contacts.append(Contact(title: "Jane", phone: "+480501234567"))
        contacts.append(Contact(title: "Alex", phone: "+480501234567"))
        contacts.sort { $0.title < $1.title }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadContacts()
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: "MyCell") {
            print("Use old cell for row with index \(indexPath.row)")
            cell = reuseCell
        } else {
            print("Create new cell for row with index \(indexPath.row)")
            cell = UITableViewCell(style: .default, reuseIdentifier: "MyCell")
        }
        configure(cell: &cell, for: indexPath)
        return cell
        
    }
    
    private func configure(cell: inout UITableViewCell, for indexPath: IndexPath) {
        var configuration = cell.defaultContentConfiguration()
        configuration.text = contacts[indexPath.row].title
        configuration.secondaryText = contacts[indexPath.row].phone
        cell.contentConfiguration = configuration
    }
}
