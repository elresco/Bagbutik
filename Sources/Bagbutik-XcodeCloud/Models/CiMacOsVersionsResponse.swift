import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # CiMacOsVersionsResponse
 A response that contains a list of macOS Versions resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cimacosversionsresponse>
 */
public struct CiMacOsVersionsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = CiMacOsVersion

    /// The resource data.
    public let data: [CiMacOsVersion]
    /// The requested relationship data.
    public var included: [CiXcodeVersion]?
    /// The navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// The paging information.
    public var meta: PagingInformation?

    public init(data: [CiMacOsVersion],
                included: [CiXcodeVersion]? = nil,
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
        data = try container.decode([CiMacOsVersion].self, forKey: "data")
        included = try container.decodeIfPresent([CiXcodeVersion].self, forKey: "included")
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

    public func getXcodeVersions(for ciMacOsVersion: CiMacOsVersion) -> [CiXcodeVersion] {
        guard let xcodeVersionIds = ciMacOsVersion.relationships?.xcodeVersions?.data?.map(\.id) else { return [] }
        return included?.filter { xcodeVersionIds.contains($0.id) } ?? []
    }
}
