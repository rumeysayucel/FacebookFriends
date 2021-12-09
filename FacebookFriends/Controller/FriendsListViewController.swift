//
//  FriendsListViewController.swift
//  FacebookFriends
//
//  Created by Rumeysa Yücel on 4.12.2021.
//

import UIKit

class FriendsListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!

    var results = [Results]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let url = URL(string: "https://randomuser.me/api/?results=20")!
        URLSession.shared.dataTask(with: url) { (data,response,error) in
            if let data = data {
                do {
                    let persons = try JSONDecoder().decode(PersonInfo.self, from: data)
                    DispatchQueue.main.async {
                        self.results = persons.results
                        self.collectionView.reloadData()
                    }
                }catch {
                    print(error)
                }
               
            }
        }.resume()
    }
    
}

extension FriendsListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendCell", for: indexPath) as! FriendsListCollectionViewCell
        
        cell.nameLabel.text = results[indexPath.item].name.first + " " + results[indexPath.item].name.last
        
        let link = results[indexPath.item].picture.medium
        cell.imageView.downloaded(from: link)
        cell.imageView.makeCircular()
    
        return cell
    }
}

extension FriendsListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ListToDetail", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ListToDetail" {
            if let destinationVc = segue.destination as? FriendsDetailViewController, let index = collectionView.indexPathsForSelectedItems?.first {
                destinationVc.friends = results[index.item]
            }
        }

    }
}




