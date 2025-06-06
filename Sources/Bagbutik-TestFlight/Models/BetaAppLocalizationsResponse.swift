import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # BetaAppLocalizationsResponse
 A response that contains a list of Beta App Localization resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaapplocalizationsresponse>
 */
public struct BetaAppLocalizationsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = BetaAppLocalization

    /// The resource data.
    public let data: [BetaAppLocalization]
    public var included: [App]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public var meta: PagingInformation?

    public init(data: [BetaAppLocalization],
                included: [App]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([BetaAppLocalization].self, forKey: "data")
        included = try container.decodeIfPresent([App].self, forKey: "included")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }

    public func getApp(for betaAppLocalization: BetaAppLocalization) -> App? {
        included?.first { $0.id == betaAppLocalization.relationships?.app?.data?.id }
    }
}
