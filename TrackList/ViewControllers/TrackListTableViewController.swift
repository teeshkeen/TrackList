//
//  TrackListTableViewController.swift
//  TrackList
//
//  Created by Alexey on 20.07.2024.
//

import UIKit

class TrackListTableViewController: UITableViewController {
    private var trackList = Track.getTrackList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        tableView.rowHeight = 80
    }
}

extension TrackListTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return trackList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "track", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        let track = trackList[indexPath.row]
        
        content.image = UIImage(named: track.title)
        content.text = track.song
        content.secondaryText = track.artist

        // appear
        content.imageProperties.cornerRadius = 80 / 2

        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentTrack = trackList.remove(at: sourceIndexPath.row)
        trackList.insert(currentTrack, at: destinationIndexPath.row)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsVC = segue.destination as? TrackDetailsViewController else { return }
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
        detailsVC.track = trackList[selectedIndexPath.row]
    }
}
