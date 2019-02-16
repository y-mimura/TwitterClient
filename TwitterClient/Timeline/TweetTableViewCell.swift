//
//  TweetTableViewCell.swift
//  TwitterClient
//
//  Created by y-mimura on 2019/02/16.
//  Copyright © 2019 Yuya Mimura. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var textContentLabel: UILabel!
    
    static let ESTIMATED_HEIGHT : CGFloat = 200
    static let IDENTIFIER: String = "TweetTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fill(tweet: Tweet) {
        let downloadTask = URLSession.shared.dataTask(with: URL(string: tweet.user.profileImageUrl)!, completionHandler: ({ (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else {
                print("image data is nil")
                return
            }
            DispatchQueue.main.async {
                // iconImageView に ダウンロードしてきた画像を代入する処理
                self.iconImageView.image = UIImage(data: data)
            }
        }))
        downloadTask.resume()
        
        // tweetから値を取り出してUIにセット
        nameLabel.text = tweet.user.name
        textContentLabel.text = tweet.text
        // screenNameには "@" が含まれていないので、頭に "@" を入れてあげる必要がある
        screenNameLabel.text = "@" + tweet.user.screenName
    }

}
