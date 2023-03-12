//
//  FlashSaleCollectionViewCell.swift
//  hwGET
//
//  Created by zalkarbek on 12/3/23.
//

import UIKit

class FlashSaleCollectionViewCell: UICollectionViewCell {

    static let reuseId = String(describing: FlashSaleCollectionViewCell.self)
    
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    private var getFlash: FlashModel?
    
    func displayFlash(_ items: FlashModel) {
        getFlash = items
        nameLabel.text! = items.name
        priceLabel.text! = String(items.price)
        loadImageURL(url: items.image_url)
    }
    
    func loadImageURL(url: String) {
        guard let url = URL(string: url) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error \(error.localizedDescription)")
               
            }
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self.mainImage.image = UIImage(data: data)!
            }
        }
        task.resume()
    }
    
}
