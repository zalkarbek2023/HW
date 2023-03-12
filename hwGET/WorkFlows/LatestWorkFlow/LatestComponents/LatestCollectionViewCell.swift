//
//  LatestCollectionViewCell.swift
//  hwGET
//
//  Created by zalkarbek on 11/3/23.
//

import UIKit

class LatestCollectionViewCell: UICollectionViewCell {

    static let reuseId = String(describing: LatestCollectionViewCell.self)
    
    @IBOutlet private weak var mainImage: UIImageView!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var addButton: UIButton!
    
    private var getLatest: LatestModel?
    
    func displayLatest(_ items: LatestModel) {
        getLatest = items
        categoryLabel.text! = items.category
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
                print(error.localizedDescription)
            }
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self.mainImage.image = UIImage(data: data)!
            }
        }
        task.resume()
    }

}
