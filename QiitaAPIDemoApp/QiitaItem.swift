//


import Foundation

struct QiitaItem: Identifiable, Codable {
    let id: String
    let title: String
    let updatedAt: String

    // CodingKeysを使用してJSONのキー名を指定
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case updatedAt = "updated_at" // JSONのキー名に合わせる
    }
}
