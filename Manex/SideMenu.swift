//
//  SideMenu.swift
//  Manex
//
//  Created by michaelyangqianlong on 17/10/22.
//

import Foundation
import UIKit

protocol MenuControllerDelegate {
    func didSelectMenuItem(menuItem: SideMenuItem)
}

enum SideMenuItem: String, CaseIterable {
    case formation = "Formations"
    case board = "Manex Board"
    case feedback = "Feedback"
}

class MenuViewController: UITableViewController {
    
    public var delegate: MenuControllerDelegate?
    
    private let menuItems: [SideMenuItem]
    
    init(with menuItems: [SideMenuItem]) {
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .gray
        view.backgroundColor = .gray
    }
    
    // Table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row].rawValue
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .gray
        cell.contentView.backgroundColor = .gray
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Relay to delegate about menu item selection
        let selectedItem = menuItems[indexPath.row]
        delegate?.didSelectMenuItem(menuItem: selectedItem)
    }
}
