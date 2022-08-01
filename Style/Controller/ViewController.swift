//
//  ViewController.swift
//  Style
//
//  Created by Julia Semyzhenko on 7/31/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    var arrLabelContent = ["Inclusion by design", "Challenge: Large text",
                           "Accessibility by design: An Apple Watch for everypne", "Code along: Build a ",
                           "Meditation for"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        

        self.view.backgroundColor = Modes.currentMode.backgroundColor
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if !UserDefaults.standard.hasValue(forKey: "hasAlreadyLaunched") {
            displayModeOptions()
            UserDefaults.standard.set(true, forKey: "hasAlreadyLaunched")
            super.viewWillAppear(animated)
        }
        
        loadData()
        viewDidLoad()
        super.viewWillAppear(animated)
    }
    
    
    
    //MARK: - Alert for the first time app use
    func displayModeOptions(){
        
        let alert = UIAlertController(title: "Choose Mode", message:  "Choose Mode", preferredStyle: .alert)
        
        let redAction = UIAlertAction(title: "Red" , style: .destructive){ (action) -> Void in
            UserDefaults.standard.set("RedMode", forKey: "Mode" )
            Modes.currentMode = RedMode()
            self.loadData()
        }
        
        let darkAction = UIAlertAction(title: "Dark", style: .default) { (action) -> Void in
            UserDefaults.standard.set("DarkMode", forKey: "Mode" )
            Modes.currentMode = DarkMode()
            self.loadData()
        }
        let lightAction = UIAlertAction(title: "Light", style: .default) { (action) -> Void in
            UserDefaults.standard.set("LightMode", forKey: "Mode" )
            Modes.currentMode = LightMode()
            self.loadData()
            
        }
        
        alert.addAction(lightAction)
        alert.addAction(redAction)
        alert.addAction(darkAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func loadData() {
        DispatchQueue.main.async  {
            self.view.backgroundColor =  Modes.currentMode.backgroundColor
            self.collectionView.reloadData()
        }
    }
    
}

//MARK: - Extension for CollectionView
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        as! CollectionViewCell
        cell.changeFontAndSize(size: 25)
        if indexPath.row != 0 {
            cell.changeFontAndSize()
        }
        cell.cellImage.image = UIImage(named: "\(indexPath.row)")
        cell.cellLabel.text = arrLabelContent[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        let header  = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier:  "HeaderCollectionReusableView",
            for: indexPath) as! HeaderCollectionReusableView
        
        header.headerLabel.text = "Discover"
        //        header.sourceSansProForHeader()
        header.changeFontAndSize()
        return header
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.row  == 0 {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.width/1.4)
        }
        else  {
            return CGSize(width: collectionView.frame.width/2.1, height: collectionView.frame.width/3)
        }
    }
}

//MARK: - extension for UserDefaults
extension UserDefaults {
    
    func hasValue(forKey key: String) -> Bool {
        return nil != object(forKey: key)
    }
}
