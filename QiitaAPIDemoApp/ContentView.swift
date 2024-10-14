//

import SwiftUI

struct ContentView: View {
    @StateObject private var api = QiitaAPI()

    var body: some View {
        NavigationView {
            List {
                if api.items.isEmpty {
                    Text("何もデータがありません。")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    ForEach(api.items) { item in
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(.headline)
                            Text(item.updatedAt)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Qiita Items")
        }
        .onAppear {
            api.fetchItems()
        }
    }
}

#Preview {
    ContentView()
}
