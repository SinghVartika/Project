//
//  CustomTableViewCell.swift
//  Project
//
//  Created by TTN on 20/05/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell , UICollectionViewDelegate , UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
      let nib = UINib.init(nibName: "TrendingCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "TrendingCollectionCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingCollectionCell", for: indexPath)
        return cell
    }
    
    
    
}

    

