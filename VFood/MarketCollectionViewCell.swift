//
//  CollectionViewCell.swift
//  VFood
//
//  Created by Виктория Козырева on 10.05.2021.
//

import UIKit
import SDWebImage

class MarketCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initCell(imageURL: URL, title: String, price: String) {
        self.imageView.sd_setImage(with: imageURL)
        self.title.text = title
        self.buyButton.setTitle(price, for: .normal)
    }

}
