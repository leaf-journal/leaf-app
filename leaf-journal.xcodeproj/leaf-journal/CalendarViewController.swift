import UIKit
import FSCalendar

class CalendarViewController: UIViewController {

    @IBOutlet weak var calendarView: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up FSCalendar
        calendarView.delegate = self
        calendarView.headerHeight = 50
        calendarView.appearance.weekdayTextColor = .gray
        calendarView.appearance.selectionColor = .blue
    }
    
}


extension CalendarViewController: FSCalendarDelegate {
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {

        
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let foundationDate = dateFormatter.date(from: date.description) else { return }

                
        let dateString = dateFormatter.string(from: foundationDate)

        UserDefaults.standard.set(dateString, forKey: "selectedDate")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}


