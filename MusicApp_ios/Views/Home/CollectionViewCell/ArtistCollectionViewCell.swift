//
//  ArtistCollectionViewCell.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/06/30.
//

import UIKit

class ArtistCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var artistImageView: UIImageView!
  @IBOutlet weak var artistNameLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    layoutConfigure()
  }
  
  private func layoutConfigure() {
    artistImageView.layer.cornerRadius = self.artistImageView.bounds.width / 2
    artistImageView.contentMode = .scaleAspectFill
    artistNameLabel.textColor = .textColor()
  }

}
