//
//  MessageCell.swift
//  parseChatClient
//
//  Created by Mhatre, Aniket on 4/12/17.
//  Copyright © 2017 Mhatre, Aniket. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    @IBOutlet weak var messageLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
