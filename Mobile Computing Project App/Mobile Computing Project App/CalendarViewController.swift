//
//  CalendarViewController.swift
//  Mobile Computing Project App
//
//  Created by Robin Stewart on 3/24/17.
//  Copyright © 2017 Robin Stewart. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    // Set month dictionary
    let monthString:NSDictionary = [1:"January", 2:"February", 3:"March", 4:"April", 5:"May", 6:"June",
                                    7:"July", 8:"August", 9:"September", 10:"October", 11:"November", 12:"December"]
    // Cache colors to reduce lag
    let white = UIColor.white
    let black = UIColor.black
    let gray = UIColor.gray
    
    var selectedDate: Date = Date() // Will be used to load events for that day
    var selectedEvents:[AnyObject] = DataManager.loadEventsByDate(Date())

    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var eventTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventTable.dataSource = self
        eventTable.delegate = self
        
        calendarView.dataSource = self
        calendarView.delegate = self
        calendarView.registerCellViewXib(file: "CellView") // Registering your cell is manditory
        calendarView.registerHeaderView(xibFileNames: ["MonthHeader"])
        calendarView.scrollToDate(Date())   // set initial month to current month
        calendarView.selectDates([Date()])  // set intial selected date to current date
        
        self.title = "Calendar"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // MARK: - Calendar
    
    // Function to handle the text color of the calendar
    func handleCellTextColor(view: JTAppleDayCellView?, cellState: CellState) {
        
        guard let myCustomCell = view as? CellView  else {
            return
        }
        
        if cellState.isSelected {
            myCustomCell.dayLabel.textColor = white
        } else {
            if cellState.dateBelongsTo == .thisMonth {
                myCustomCell.dayLabel.textColor = black
            } else {
                myCustomCell.dayLabel.textColor = gray
            }
        }
    }
    
    // Function to handle the calendar selection
    func handleCellSelection(view: JTAppleDayCellView?, cellState: CellState) {
        guard let myCustomCell = view as? CellView  else {
            return
        }
        if cellState.isSelected {
            myCustomCell.selectedView.layer.cornerRadius =  25
            myCustomCell.selectedView.isHidden = false
            
            self.selectedDate = myCustomCell.date!
            self.selectedEvents = DataManager.loadEventsByDate(myCustomCell.date!)
            
            // Update tableview to include stuff
            self.eventTable.reloadData()
        } else {
            myCustomCell.selectedView.isHidden = true
        }
    }

    //MARK: - Table View
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.selectedEvents.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)
        
        return cell
    }
    
    // New Note actione
    @IBAction func createNote(_ sender: Any) {
        print("new note")
        //go to new note view controller
    }
}


// More calendar stuff
extension CalendarViewController: JTAppleCalendarViewDataSource, JTAppleCalendarViewDelegate {
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        // let startDate = Date()
        let startDate = formatter.date(from: "2006 01 01")! // You can use date generated from a formatter
        let endDate = formatter.date(from: "2018 12 31")!          // You can also use dates created from this function
        let parameters = ConfigurationParameters(startDate: startDate,
                                                 endDate: endDate,
                                                 numberOfRows: 6, // Only 1, 2, 3, & 6 are allowed
            calendar: Calendar.current,
            generateInDates: .forAllMonths,
            generateOutDates: .tillEndOfGrid,
            firstDayOfWeek: .sunday)
        return parameters
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplayCell cell: JTAppleDayCellView, date: Date, cellState: CellState) {
        let myCustomCell = cell as! CellView
        
        // Setup Cell text
        myCustomCell.dayLabel.text = cellState.text
        myCustomCell.date = date
        
        handleCellTextColor(view: cell, cellState: cellState)
        handleCellSelection(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleDayCellView?, cellState: CellState) {
        handleCellSelection(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleDayCellView?, cellState: CellState) {
        handleCellSelection(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
    }
    
    // This sets the height of your header
    func calendar(_ calendar: JTAppleCalendarView, sectionHeaderSizeFor range: (start: Date, end: Date), belongingTo month: Int) -> CGSize {
        return CGSize(width: 200, height: 50)
    }
    // This setups the display of your header
    func calendar(_ calendar: JTAppleCalendarView, willDisplaySectionHeader header: JTAppleHeaderView, range: (start: Date, end: Date), identifier: String) {
        var dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: range.0)
        let headerCell = (header as? MonthHeaderView)
        headerCell?.title.text = "\(self.monthString[dateComponents.month!]!) \(dateComponents.year!)"
    }
}
