//
//  ViewController.swift
//  testDetailsCardScanner
//
//  Created by odysseyMacPro1 on 5/6/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    struct TableDictionary {
        var tableHeaderKey : String
        var tableDataValue : String
    }
    
    var currentTableViewFullData : [TableDictionary]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let currentCard = cards[0]
        
        tableView.frame = CGRect(x: 0, y: 50, width: screenWidth, height: screenHeight - 100)
        
        currentTableViewFullData = GetAllNonNilValues(card : currentCard)
        
        tableView.register(UINib(nibName: "DetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailsTableViewCell")
        
        tableView.reloadData()
    }
    
    private func GetAllNonNilValues(card : CardDetails) -> [TableDictionary]{
        
        var tableDic = [TableDictionary]()
        
        //GET ALL NOT NIL VALUES
        if card.firstName != "" && card.firstName != nil{
            tableDic.append(TableDictionary(tableHeaderKey: "First Name", tableDataValue: card.firstName))
        }
        
        if card.lastName != "" && card.lastName != nil{
            tableDic.append(TableDictionary(tableHeaderKey: "Last Name", tableDataValue: card.lastName))
        }
        
        if card.mobileNumbers != "" && card.mobileNumbers != nil{
            tableDic.append(TableDictionary(tableHeaderKey: "Phone", tableDataValue: card.mobileNumbers))
            
        }
        
        if card.emails != "" && card.emails != nil{
            tableDic.append(TableDictionary(tableHeaderKey: "Email", tableDataValue: card.emails))
        }
        
        if card.designation != "" && card.designation != nil{
            tableDic.append(TableDictionary(tableHeaderKey: "Designation", tableDataValue: card.designation))
        }
        
        if card.departmentName != "" && card.departmentName != nil{
            tableDic.append(TableDictionary(tableHeaderKey: "Department", tableDataValue: card.departmentName!))
        }
        
        if card.companyName != "" && card.companyName != nil{
            tableDic.append(TableDictionary(tableHeaderKey: "Company", tableDataValue: card.companyName))
        }
        
        if card.address != "" && card.address != nil{
            tableDic.append(TableDictionary(tableHeaderKey: "Address", tableDataValue: card.address!))
        }
        
        
        return tableDic
        
    }
    
    
}

extension ViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return currentTableViewFullData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell", for: indexPath) as! DetailsTableViewCell
        
        cell.updateData(currentData: currentTableViewFullData[indexPath.section].tableDataValue)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 10, y: 0, width: tableView.frame.width - 20, height: 30))
        headerView.backgroundColor = .clear
        
        let label = UILabel()
        label.frame = headerView.frame
        label.text = currentTableViewFullData[section].tableHeaderKey
        label.font = .systemFont(ofSize: 12)
        label.textColor = .lightGray
        
        headerView.addSubview(label)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let dataArr = currentTableViewFullData[indexPath.section].tableDataValue.split(separator: ",")
        return CGFloat((dataArr.count*35))
    }
    
    
}

