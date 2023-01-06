//
//  ViewController.swift
//  URLSessionUIKit
//
//  Created by Tomato on 2021/09/16.
//

import UIKit
import Combine

class ViewController: UIViewController, UITableViewDataSource {
	// MARK: - Variables
	var cancellable: AnyCancellable?
	
	// MARK: - IBOutlet
	@IBOutlet weak var tableView: UITableView!
	
	
	// MARK: - IBAction
	
	
	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let urlStr = "https://wolvideos.web.app/videos.js"
		if let url = URL(string: urlStr) {
			let publisher = URLSession.shared.dataTaskPublisher(for: url)
			cancellable = publisher.sink(receiveCompletion: { (completion) in
				switch completion {
				case.failure(let error):
					print(error)
				case.finished:
					print("Success")
				}
			}, receiveValue: { (value) in
				let (data, _) = value
				let decoder = JSONDecoder()
				do {
					let videoModel = try decoder.decode(VideoModel.self, from: data)
					DispatchQueue.main.async() {
						[weak self] in
						guard let strongSelf = self else { return }
						strongSelf.videoModels = videoModel.videos
						strongSelf.tableView.reloadData()
					}
				} catch let error as NSError {
					print("\(error)")
				}
				//print("Response: \(response)")
			})
		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
	}
	
	
	// MARK: - TableView
	var videoModels = [Video]()
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return videoModels.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
		let videoModel = videoModels[indexPath.row]
		cell.idLabel.text = String(videoModel.id)
		cell.nameLabel.text = videoModel.name
		cell.descLabel.text = videoModel.description
		cell.thumbLabel.text = videoModel.thumbnail
		cell.linkLabel.text = videoModel.video_link
		return cell
	}
}

