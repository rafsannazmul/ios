//
//  DetailsTableViewCell.swift
//  testDetailsCardScanner
//
//  Created by odysseyMacPro1 on 5/6/21.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {


    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func updateData(currentData : String){
        let dataArr = currentData.split(separator: ",")
        
        let yPos : CGFloat = 0
        var lastRect : CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
        for (index, data) in dataArr.enumerated(){
            let label = UILabel()
            label.frame = CGRect(x: 10, y: yPos + CGFloat(35*index), width: screenWidth - 20, height: 30)
            lastRect = label.frame
            label.text = String(data)
            label.backgroundColor = .lightGray
            label.layer.cornerRadius = label.frame.height/4
            label.layer.masksToBounds = true
            
            contentView.addSubview(label)
        }

    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
