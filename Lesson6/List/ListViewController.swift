import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  let tableView: UITableView = UITableView(frame: .zero, style: .plain)
  let elements: [Artist] = getArtistList()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    title = "Artists"
    view.addSubview(tableView)
    tableView.frame = view.bounds
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.dataSource = self
    tableView.delegate = self
  }

  // MARK: - Datasource

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return elements.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.accessoryType = .disclosureIndicator
    cell.textLabel?.text = elements[indexPath.row].name

    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let id = elements[indexPath.row].identifier
    let viewController = DetailAssembly.assemble(artistId: id)
    self.navigationController?.pushViewController(viewController, animated: true)
  }
}

// MARK: - Data

struct Artist {

  let identifier: Int
  let name: String
  let albums: [Album]

  struct Album {

    let name: String
    let songs: [Song]
    let date: Date
  }

  struct Song {

    let name: String
    let duration: TimeInterval
  }
}

func getArtistList() -> [Artist] {
  return [Artist(
    identifier: 1111,
    name: "John Lennon",
    albums: [
      Artist.Album(
        name: "Imagine",
        songs: [
          Artist.Song(name: "Imagine", duration: 180),
          Artist.Song(name: "Crippled Inside", duration: 227),
          Artist.Song(name: "Jealous Guy", duration: 254),
          Artist.Song(name: "It's So Hard", duration: 205),
          Artist.Song(name: "I Don't Want to Be a Soldier", duration: 365),
          Artist.Song(name: "Gimme Some Truth", duration: 196),
          Artist.Song(name: "Oh My Love", duration: 170),
          Artist.Song(name: "How Do You Sleep?", duration: 336),
          Artist.Song(name: "How?", duration: 223),
          Artist.Song(name: "Oh Yoko!", duration: 260)
        ],
        date: Date(timeIntervalSince1970: 53222400)
      )
    ]
  )]
}
