//
//  TrackDetailsViewController.swift
//  TrackList
//
//  Created by Alexey on 20.07.2024.
//

import UIKit

class TrackDetailsViewController: UIViewController {
    
    @IBOutlet weak var trackTitleLabel: UILabel!
    @IBOutlet weak var artCoverImageView: UIImageView!
    
    var track: Track!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        artCoverImageView.image = UIImage(named: track.title)
        trackTitleLabel.text = track.title
    }
}
