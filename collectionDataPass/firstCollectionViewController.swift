//
//  firstCollectionViewController.swift
//  collectionDataPass
//
//  Created by Mohan K on 18/02/23.
//

import UIKit

//private let reuseIdentifier = "Cell"
class mycollection: UICollectionViewCell {
//    var nameLabel:  UILabel = UILabel(frame: CGRect.zero)
    @IBOutlet weak var   nameLabel: UILabel!
//    override init(frame : CGRect) {
//        super.init(frame : frame)
//        nameLabel.frame.size = CGSize(width: self.frame.width, height: self.frame.height)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    //    required init(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

}
class firstCollectionViewController: UICollectionViewController {

    @IBOutlet var celloneCollection: UICollectionView!
    let identifier = "CountryCell"
    
    var countries = [Country]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
//        let frame =                  CGRect(x: 0 , y: 50 , width: 375 , height: 300)
//          let layout =                 UICollectionViewFlowLayout()
        countries = loadData()
        
        func loadData() -> [Country] {
            
            let list1 = List(listItems: ["burkerKing", "hotChips", "hot dog", "doritos", "pops", "candy"])
            let list2 = List(listItems: ["tacobell", "snicker", "tortilla chips", "pop", "puckalo"])
            let list3 = List(listItems: ["pizza", "lotichacopie", "salad", "calzone", "softdrinks", "funcchips"])
            
            let foodlist1  = Food(name: "the Le meridian", list: list1)
            let foodlist2 = Food(name: "the Taco Taco", list: list2)
            let foodlist3 = Food(name: "the Pizza Hut", list: list3)
            
            let list4 = List(listItems: ["kebab", "vegRice", "hummus", "momo's", "chickenRice", "mushroomRice"])
            let list5 = List(listItems: ["pulled Pork", "sandwitch", "BBQ chips", "french fries", "frenchies", "wrap"])
            let list6 = List(listItems: ["chickennugglet", "pork", "beaf", "veg rice", "hammburger", "spegattie"])
            let foodlist4 = Food(name: "rajaKannapas", list: list4)
            let foodlist5 = Food(name: "muniyandivilas", list: list5)
            let foodlist6 = Food(name: "sangam", list: list6)
            
            let list7 = List(listItems: ["chicken cuury", "idian sytle rice", "thaliStylrice", "variety rice", "veg panner", "gobi rice"])
            let list8 = List(listItems: ["italliansoup", "idiyapapa", "leg soup", "crab", "sqwid", "wedgee"])
            let list9 = List(listItems: ["hot water", "maggiee", "pannersoup", "damro", "dingo", "rat"])
            let foodlist7 = Food(name: "karuppanaswamy", list: list7)
            let foodlist8 = Food(name: "muthaiyan", list: list8)
            let foodlist9 = Food(name: "the madras residency", list: list9)
            
            let chennai = Country(name: "chennai", food: [foodlist1, foodlist2, foodlist3])
            let madurai = Country(name: "Madurai", food: [foodlist4, foodlist5, foodlist6])
            let trichy = Country(name: "trichy", food: [foodlist7, foodlist8, foodlist9])
            return [chennai, madurai, trichy]
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    

    // MARK: UICollectionViewDataSource

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return countries.count
//    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return countries.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = celloneCollection.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! mycollection
        let country = countries[indexPath.row]
      
        // Configure the cell
        cell.nameLabel.text = country.name
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UICollectionViewCell,
           let indexPath = self.celloneCollection.indexPath(for: cell) {
//            guard let selectedItem = indexPath.row
//            else{return}
            let selectedItem = indexPath.row
            let selectedCountry = countries[selectedItem]
            let destinationVC = segue.destination as? secondCollectionViewController
            destinationVC?.food = selectedCountry.food
        }
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
