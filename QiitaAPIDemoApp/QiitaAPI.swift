//


import Foundation
import Combine

class QiitaAPI: ObservableObject {
    @Published var items: [QiitaItem] = []
    private var cancellable: AnyCancellable?
    
    func fetchItems() {
        guard let url = URL(string: "https://qiita.com/api/v2/items") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        cancellable = URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: [QiitaItem].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveOutput: { _ in
                print("データ取得成功")
            })
            .catch { error -> Just<[QiitaItem]> in
                print("エラー: \(error)")
                return Just([])
            }
            .assign(to: \.items, on: self)
    }
}
