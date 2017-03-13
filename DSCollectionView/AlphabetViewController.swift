//
//  AlphabetViewController.swift
//  DSCollectionView
//
//  Created by Dmitry Smolyakov on 3/13/17.
//  Copyright © 2017 Dmitry Smolyakov. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class AlphabetViewController: UICollectionViewController {

    var characterArray = [String]()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let str: String = "ABCDEFGHIJKLMNOPQRSTUVWXYX"
        
        for i in str.characters {
            characterArray.append(String(i))
        }
    }

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characterArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AlphabetCell
        cell.alphabetLabel.text = characterArray[indexPath.row]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        
        print("Begin moving")
        
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        characterArray.insert(characterArray.remove(at: sourceIndexPath.item), at: destinationIndexPath.item)
    }
}
