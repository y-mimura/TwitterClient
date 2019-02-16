//
//  TimelineViewController.swift
//  TwitterClient
//
//  Created by y-mimura on 2019/02/16.
//  Copyright © 2019 Yuya Mimura. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    // テーブル表示用のデータソース
    var tweets: [Tweet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ダミーデータの生成
        let user = User(id: "1", screenName: "testAccount", name: "Name Space", profileImageUrl: Constants.IMG_NO_IMAGE_URL)
        let tweet = Tweet(id: "01", text: "Twitter client developping now...", user: user)
        
        let tweets = [tweet]
        self.tweets = tweets
        
        // tableViewのリロード
        tableView.reloadData()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

}

extension TimelineViewController: UITableViewDelegate {
    
    // セルがタップされた時に呼ばれる
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped cell")
    }
    
    // セルの見積もりの高さを指定する
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return TweetTableViewCell.ESTIMATED_HEIGHT
    }
    
    // セルの実際の高さを指定する
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // UITableViewCellの高さを自動で取得する
        return UITableView.automaticDimension
    }
    
}

extension TimelineViewController: UITableViewDataSource {
    // 何個のcellを生成するかを設定する関数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // tweetsの要素数
        return tweets.count
    }
    
    // 描画するcellを設定する関数
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TweetTableViewCellを取得
        let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.IDENTIFIER) as! TweetTableViewCell
        cell.fill(tweet: tweets[indexPath.row])
        return cell
    }
}
