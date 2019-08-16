//
//  TaskCollectionViewCell.swift
//  toDoReqcy
//
//  Created by celine dann on 16/08/2019.
//  Copyright © 2019 celine dann. All rights reserved.
//

import UIKit

class TaskCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
    
    var title: String?
    var dueDate: Date?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        titleLabel.text = title
        guard let date = dueDate else {
            dateLabel.isHidden = true
            return
        }
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        dateLabel.text = formatter.string(from: date)
    }
    
    func setup(title:String, dueDate:Date?) {
        self.title = title
        self.dueDate = dueDate
    }

}
