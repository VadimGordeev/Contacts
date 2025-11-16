//
//  Contact.swift
//  Contacts
//
//  Created by Vadim on 16/11/2025.
//

protocol ContactProtocol {
    var title: String { get set }
    var phone: String { get set }
}

struct Contact: ContactProtocol {
    var title: String
    var phone: String
}
