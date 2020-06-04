#if os(iOS) || os(tvOS)
  import UIKit
  
  // MARK: - Methods
   extension UITableView {
    
    /// SwifterSwift: IndexPath for last row in section.
    ///
    /// - Parameter section: section to get last row in.
    /// - Returns: optional last indexPath for last row in section (if applicable).
    //	 func indexPathForLastRow(inSection section: Int) -> IndexPath? {
    //		guard section >= 0 else {
    //			return nil
    //		}
    //		guard numberOfRows(inSection: section) > 0  else {
    //			return IndexPath(row: 0, section: section)
    //		}
    //		return IndexPath(row: numberOfRows(inSection: section) - 1, section: section)
    //	}
    
    /// Reload data with a completion handler.
    ///
    /// - Parameter completion: completion handler to run after reloadData finishes.
    //	 func reloadData(_ completion: @escaping () -> Void) {
    //		UIView.animate(withDuration: 0, animations: {
    //			self.reloadData()
    //		}, completion: { _ in
    //			completion()
    //		})
    //	}
    
    /// SwifterSwift: Remove TableFooterView.
    //	 func removeTableFooterView() {
    //		tableFooterView = nil
    //	}
    //
    //	/// SwifterSwift: Remove TableHeaderView.
    //	 func removeTableHeaderView() {
    //		tableHeaderView = nil
    //	}
    //
    
    /// SwifterSwift: Scroll to bottom of TableView.
    ///
    /// - Parameter animated: set true to animate scroll (default is true).
     func scrollToBottom(animated: Bool = true) {
      let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height)
      setContentOffset(bottomOffset, animated: animated)
    }
    
    /// SwifterSwift: Scroll to top of TableView.
    ///
    /// - Parameter animated: set true to animate scroll (default is true).
     func scrollToTop(animated: Bool = true) {
      setContentOffset(CGPoint.zero, animated: animated)
    }
    
    /// SwifterSwift: Deque reusable UITableViewCell using class name
    ///
    /// - Parameter name: UITableViewCell type
    /// - Returns: UITableViewCell object with associated class name (optional value)
     func dequeReusableCell<T: UITableViewCell>(withClass name: T.Type) -> T? {
      return dequeueReusableCell(withIdentifier: String(describing: name)) as? T
    }
    
    /// SwiferSwift: Deque reusable UITableViewCell using class name for indexPath
    ///
    /// - Parameter name: UITableViewCell type
    /// - Parameter indexPath: Location of cell in tableView
    /// - Returns: UITableViewCell object with associated class name
     func dequeReusableCell<T: UITableViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {
     // swiftlint:disable force_cast
      return dequeueReusableCell(withIdentifier: String(describing: name), for: indexPath) as! T
     // swiftlint:enable force_cast     
    }
    
    /// SwiferSwift: Deque reusable UITableViewHeaderFooterView using class name
    ///
    /// - Parameter name: UITableViewHeaderFooterView type
    /// - Returns: UITableViewHeaderFooterView object with associated class name (optional value)
    func dequeReusableHeaderFooterView<T: UITableViewHeaderFooterView>(withClass name: T.Type) -> T? {
      return dequeueReusableHeaderFooterView(withIdentifier: String(describing: name)) as? T
    }
    
    /// SwifterSwift: Register UITableViewHeaderFooterView using class name
    ///
    /// - Parameter nib: Nib file used to create the header or footer view
    /// - Parameter name: UITableViewHeaderFooterView type
    func register<T: UITableViewHeaderFooterView>(nib: UINib?, withHeaderFooterViewClass name: T.Type) {
      register(nib, forHeaderFooterViewReuseIdentifier: String(describing: name))
    }
    
    /// SwifterSwift: Register UITableViewHeaderFooterView using class name
    ///
    /// - Parameter name: UITableViewHeaderFooterView type
    func register<T: UITableViewHeaderFooterView>(headerFooterViewClassWith name: T.Type) {
      register(T.self, forHeaderFooterViewReuseIdentifier: String(describing: name))
    }
    
    /// SwifterSwift: Register UITableViewCell using class name
    ///
    /// - Parameter name: UITableViewCell type
    func register<T: UITableViewCell>(cellWithClass name: T.Type) {
      register(T.self, forCellReuseIdentifier: String(describing: name))
    }
    
    /// SwifterSwift: Register UITableViewCell using class name
    ///
    /// - Parameter nib: Nib file used to create the tableView cell
    /// - Paramter name: UITableViewCell type
    func register<T: UITableViewCell>(nib: UINib?, withCellClass name: T.Type) {
      register(nib, forCellReuseIdentifier: String(describing: name))
    }
  }
#endif
