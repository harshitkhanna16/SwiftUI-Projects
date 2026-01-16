import UIKit

class BookTableViewController: UITableViewController {

    // MARK: - Data Source
    var books: [Book] = [
        Book(title: "1984",
             author: "George Orwell",
             genre: "Dystopian",
             length: "328"),

        Book(title: "Harry Potter",
             author: "J.K. Rowling",
             genre: "Fantasy",
             length: "500"),

        Book(title: "The Hobbit",
             author: "J.R.R. Tolkien",
             genre: "Fantasy",
             length: "310"),

        Book(title: "To Kill a Mockingbird",
             author: "Harper Lee",
             genre: "Classic",
             length: "281"),

        Book(title: "The Alchemist",
             author: "Paulo Coelho",
             genre: "Fiction",
             length: "208"),

        Book(title: "Atomic Habits",
             author: "James Clear",
             genre: "Self Help",
             length: "320")
    ]

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Favorite Books"

        // Enable Edit button (for delete mode)
        navigationItem.rightBarButtonItem = editButtonItem
    }

    // MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath)
    -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "BookCell",
            for: indexPath
        )

        let book = books[indexPath.row]
        cell.textLabel?.text = book.title
        cell.detailTextLabel?.text = book.author

        return cell
    }

    // MARK: - DELETE FUNCTION (Swipe + Edit Button)
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            books.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
