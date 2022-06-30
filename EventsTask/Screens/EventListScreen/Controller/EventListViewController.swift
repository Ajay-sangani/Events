//
//  EventListViewController.swift
//  EventsTask
//
//  Created by Ajay Sangani on 24/05/22.
//

import UIKit

class EventListViewController: UIViewController {
    
    @IBOutlet var yearButton: UIButton!
    @IBOutlet var monthButton: UIButton!
    @IBOutlet var tableView: UITableView!
    
    //Variables
    var selected_month: Int?
    var selected_year: Int?
    
    //MARK: Create ViewModel Object
    fileprivate var viewModel = EventListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    //MARK: setupUI
    func setupUI() {
        [yearButton, monthButton].forEach { button in
            button?.cornerRadius(cornerRadius: 10)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 70
        //Register TableView Cell
        for reuseIdentifier in [EventTableViewCell.reuseIdentifier] {
            tableView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        }
        
        selected_month = Calendar.current.component(.month, from: Date())
        selected_year = Calendar.current.component(.year, from: Date())
        
        if let selectedMonth = selected_month,
           let selectedYear = selected_year {
            
            let monthStr = Calendar.current.monthSymbols[selectedMonth-1]
            monthButton.setTitle(monthStr, for: .normal)
            yearButton.setTitle("\(selectedYear)", for: .normal)
            
            viewModel.arrDates = viewModel.getAllDates(month: selectedMonth, year: selectedYear)
            tableView.reloadData()
        }
    }
    
    //MARK: tappedYearButton
    @IBAction func tappedYearButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Year", message: "Please Select an Year", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "2016", style: .default , handler:{ (UIAlertAction)in
            sender.setTitle("2016", for: .normal)
            self.selected_year = 2016
            if let selectedMonth = self.selected_month,
               let selectedYear = self.selected_year {
                self.viewModel.arrDates = self.viewModel.getAllDates(month: selectedMonth, year: selectedYear)
                self.tableView.reloadData()
            }
        }))
        alert.addAction(UIAlertAction(title: "2017", style: .default , handler:{ (UIAlertAction)in
            sender.setTitle("2017", for: .normal)
            self.selected_year = 2017
            if let selectedMonth = self.selected_month,
               let selectedYear = self.selected_year {
                self.viewModel.arrDates = self.viewModel.getAllDates(month: selectedMonth, year: selectedYear)
                self.tableView.reloadData()
            }
        }))
        alert.addAction(UIAlertAction(title: "2018", style: .default , handler:{ (UIAlertAction)in
            sender.setTitle("2018", for: .normal)
            self.selected_year = 2018
            if let selectedMonth = self.selected_month,
               let selectedYear = self.selected_year {
                self.viewModel.arrDates = self.viewModel.getAllDates(month: selectedMonth, year: selectedYear)
                self.tableView.reloadData()
            }
        }))
        alert.addAction(UIAlertAction(title: "2019", style: .default , handler:{ (UIAlertAction)in
            sender.setTitle("2019", for: .normal)
            self.selected_year = 2019
            if let selectedMonth = self.selected_month,
               let selectedYear = self.selected_year {
                self.viewModel.arrDates = self.viewModel.getAllDates(month: selectedMonth, year: selectedYear)
                self.tableView.reloadData()
            }
        }))
        alert.addAction(UIAlertAction(title: "2020", style: .default , handler:{ (UIAlertAction)in
            sender.setTitle("2020", for: .normal)
            self.selected_year = 2020
            if let selectedMonth = self.selected_month,
               let selectedYear = self.selected_year {
                self.viewModel.arrDates = self.viewModel.getAllDates(month: selectedMonth, year: selectedYear)
                self.tableView.reloadData()
            }
        }))
        alert.addAction(UIAlertAction(title: "2021", style: .default , handler:{ (UIAlertAction)in
            sender.setTitle("2021", for: .normal)
            self.selected_year = 2021
            if let selectedMonth = self.selected_month,
               let selectedYear = self.selected_year {
                self.viewModel.arrDates = self.viewModel.getAllDates(month: selectedMonth, year: selectedYear)
                self.tableView.reloadData()
            }
        }))
        alert.addAction(UIAlertAction(title: "2022", style: .default , handler:{ (UIAlertAction)in
            sender.setTitle("2022", for: .normal)
            self.selected_year = 2022
            if let selectedMonth = self.selected_month,
               let selectedYear = self.selected_year {
                self.viewModel.arrDates = self.viewModel.getAllDates(month: selectedMonth, year: selectedYear)
                self.tableView.reloadData()
            }
        }))
        alert.addAction(UIAlertAction(title: "2023", style: .default , handler:{ (UIAlertAction)in
            sender.setTitle("2023", for: .normal)
            self.selected_year = 2023
            if let selectedMonth = self.selected_month,
               let selectedYear = self.selected_year {
                self.viewModel.arrDates = self.viewModel.getAllDates(month: selectedMonth, year: selectedYear)
                self.tableView.reloadData()
            }
        }))
        alert.addAction(UIAlertAction(title: "2024", style: .default , handler:{ (UIAlertAction)in
            sender.setTitle("2024", for: .normal)
            self.selected_year = 2024
            if let selectedMonth = self.selected_month,
               let selectedYear = self.selected_year {
                self.viewModel.arrDates = self.viewModel.getAllDates(month: selectedMonth, year: selectedYear)
                self.tableView.reloadData()
            }
        }))
        alert.addAction(UIAlertAction(title: "2025", style: .default , handler:{ (UIAlertAction)in
            sender.setTitle("2025", for: .normal)
            self.selected_year = 2025
            if let selectedMonth = self.selected_month,
               let selectedYear = self.selected_year {
                self.viewModel.arrDates = self.viewModel.getAllDates(month: selectedMonth, year: selectedYear)
                self.tableView.reloadData()
            }
        }))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
    
    //MARK: tappedMonthButton
    @IBAction func tappedMonthButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Month", message: "Please Select an Month", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Jan", style: .default , handler:{ (UIAlertAction)in
            sender.setTitle("Jan", for: .normal)
            self.selected_month = Months.Jan.rawValue
            if let selectedMonth = self.selected_month,
               let selectedYear = self.selected_year {
                self.viewModel.arrDates = self.viewModel.getAllDates(month: selectedMonth, year: selectedYear)
                self.tableView.reloadData()
            }
        }))
        alert.addAction(UIAlertAction(title: "Feb", style: .default , handler:{ (UIAlertAction)in
            sender.setTitle("Feb", for: .normal)
            self.selected_month = Months.Feb.rawValue
            if let selectedMonth = self.selected_month,
               let selectedYear = self.selected_year {
                self.viewModel.arrDates = self.viewModel.getAllDates(month: selectedMonth, year: selectedYear)
                self.tableView.reloadData()
            }
        }))
        alert.addAction(UIAlertAction(title: "Mar", style: .default , handler:{ (UIAlertAction)in
            sender.setTitle("Mar", for: .normal)
            self.selected_month = Months.Mar.rawValue
            if let selectedMonth = self.selected_month,
               let selectedYear = self.selected_year {
                self.viewModel.arrDates = self.viewModel.getAllDates(month: selectedMonth, year: selectedYear)
                self.tableView.reloadData()
            }
        }))
        alert.addAction(UIAlertAction(title: "Apr", style: .default , handler:{ (UIAlertAction)in
            sender.setTitle("Apr", for: .normal)
            self.selected_month = Months.Apr.rawValue
            if let selectedMonth = self.selected_month,
               let selectedYear = self.selected_year {
                self.viewModel.arrDates = self.viewModel.getAllDates(month: selectedMonth, year: selectedYear)
                self.tableView.reloadData()
            }
        }))
        alert.addAction(UIAlertAction(title: "May", style: .default , handler:{ (UIAlertAction)in
            sender.setTitle("May", for: .normal)
            self.selected_month = Months.May.rawValue
            if let selectedMonth = self.selected_month,
               let selectedYear = self.selected_year {
                self.viewModel.arrDates = self.viewModel.getAllDates(month: selectedMonth, year: selectedYear)
                self.tableView.reloadData()
            }
        }))
        alert.addAction(UIAlertAction(title: "Jun", style: .default , handler:{ (UIAlertAction)in
            sender.setTitle("Jun", for: .normal)
            self.selected_month = Months.Jun.rawValue
            if let selectedMonth = self.selected_month,
               let selectedYear = self.selected_year {
                self.viewModel.arrDates = self.viewModel.getAllDates(month: selectedMonth, year: selectedYear)
                self.tableView.reloadData()
            }
        }))
        alert.addAction(UIAlertAction(title: "Jul", style: .default , handler:{ (UIAlertAction)in
            sender.setTitle("Jul", for: .normal)
            self.selected_month = Months.Jul.rawValue
            if let selectedMonth = self.selected_month,
               let selectedYear = self.selected_year {
                self.viewModel.arrDates = self.viewModel.getAllDates(month: selectedMonth, year: selectedYear)
                self.tableView.reloadData()
            }
        }))
        alert.addAction(UIAlertAction(title: "Aug", style: .default , handler:{ (UIAlertAction)in
            sender.setTitle("Sep", for: .normal)
            self.selected_month = Months.Aug.rawValue
            if let selectedMonth = self.selected_month,
               let selectedYear = self.selected_year {
                self.viewModel.arrDates = self.viewModel.getAllDates(month: selectedMonth, year: selectedYear)
                self.tableView.reloadData()
            }
        }))
        alert.addAction(UIAlertAction(title: "Oct", style: .default , handler:{ (UIAlertAction)in
            sender.setTitle("Oct", for: .normal)
            self.selected_month = Months.Oct.rawValue
            if let selectedMonth = self.selected_month,
               let selectedYear = self.selected_year {
                self.viewModel.arrDates = self.viewModel.getAllDates(month: selectedMonth, year: selectedYear)
                self.tableView.reloadData()
            }
        }))
        alert.addAction(UIAlertAction(title: "Nov", style: .default , handler:{ (UIAlertAction)in
            sender.setTitle("Nov", for: .normal)
            self.selected_month = Months.Nov.rawValue
            if let selectedMonth = self.selected_month,
               let selectedYear = self.selected_year {
                self.viewModel.arrDates = self.viewModel.getAllDates(month: selectedMonth, year: selectedYear)
                self.tableView.reloadData()
            }
        }))
        alert.addAction(UIAlertAction(title: "Dec", style: .default , handler:{ (UIAlertAction)in
            sender.setTitle("Dec", for: .normal)
            self.selected_month = Months.Dec.rawValue
            if let selectedMonth = self.selected_month,
               let selectedYear = self.selected_year {
                self.viewModel.arrDates = self.viewModel.getAllDates(month: selectedMonth, year: selectedYear)
                self.tableView.reloadData()
            }
        }))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
}

//MARK: UITableView Delegates | DataSource
extension EventListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrDates?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EventTableViewCell.reuseIdentifier) as! EventTableViewCell
        if let currentDate = viewModel.arrDates?[indexPath.row] {
            let events = viewModel.readDataFromUserDefaults()
            cell.configureData(date: currentDate, events: events)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let currentDate = viewModel.arrDates?[indexPath.row] {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyBoard.instantiateViewController(withIdentifier: "EventDetailViewController") as! EventDetailViewController
            controller.selectedDate = currentDate
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
