import Bagbutik_Core
import Foundation

public struct AppEventVideoClip: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "appEventVideoClips" }
    public var attributes: Attributes?
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encodeIfPresent(links, forKey: "links")
        try container.encode(type, forKey: "type")
        try container.encodeIfPresent(attributes, forKey: "attributes")
        try container.encodeIfPresent(relationships, forKey: "relationships")
    }

    public struct Attributes: Codable, Sendable {
        public var appEventAssetType: AppEventAssetType?
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var assetDeliveryState: AppMediaAssetState? = nil
        public var fileName: String?
        public var fileSize: Int?
        public var previewFrameImage: PreviewFrameImage?
        public var previewFrameTimeCode: String?
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var previewImage: ImageAsset? = nil
        public var uploadOperations: [UploadOperation]?
        public var videoDeliveryState: AppMediaVideoState?
        public var videoUrl: String?

        @available(*, deprecated, message: "This uses a property Apple has marked as deprecated.")
        public init(appEventAssetType: AppEventAssetType? = nil,
                    assetDeliveryState: AppMediaAssetState? = nil,
                    fileName: String? = nil,
                    fileSize: Int? = nil,
                    previewFrameImage: PreviewFrameImage? = nil,
                    previewFrameTimeCode: String? = nil,
                    previewImage: ImageAsset? = nil,
                    uploadOperations: [UploadOperation]? = nil,
                    videoDeliveryState: AppMediaVideoState? = nil,
                    videoUrl: String? = nil)
        {
            self.appEventAssetType = appEventAssetType
            self.assetDeliveryState = assetDeliveryState
            self.fileName = fileName
            self.fileSize = fileSize
            self.previewFrameImage = previewFrameImage
            self.previewFrameTimeCode = previewFrameTimeCode
            self.previewImage = previewImage
            self.uploadOperations = uploadOperations
            self.videoDeliveryState = videoDeliveryState
            self.videoUrl = videoUrl
        }

        public init(appEventAssetType: AppEventAssetType? = nil,
                    fileName: String? = nil,
                    fileSize: Int? = nil,
                    previewFrameImage: PreviewFrameImage? = nil,
                    previewFrameTimeCode: String? = nil,
                    uploadOperations: [UploadOperation]? = nil,
                    videoDeliveryState: AppMediaVideoState? = nil,
                    videoUrl: String? = nil)
        {
            self.appEventAssetType = appEventAssetType
            self.fileName = fileName
            self.fileSize = fileSize
            self.previewFrameImage = previewFrameImage
            self.previewFrameTimeCode = previewFrameTimeCode
            self.uploadOperations = uploadOperations
            self.videoDeliveryState = videoDeliveryState
            self.videoUrl = videoUrl
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            appEventAssetType = try container.decodeIfPresent(AppEventAssetType.self, forKey: "appEventAssetType")
            assetDeliveryState = try container.decodeIfPresent(AppMediaAssetState.self, forKey: "assetDeliveryState")
            fileName = try container.decodeIfPresent(String.self, forKey: "fileName")
            fileSize = try container.decodeIfPresent(Int.self, forKey: "fileSize")
            previewFrameImage = try container.decodeIfPresent(PreviewFrameImage.self, forKey: "previewFrameImage")
            previewFrameTimeCode = try container.decodeIfPresent(String.self, forKey: "previewFrameTimeCode")
            previewImage = try container.decodeIfPresent(ImageAsset.self, forKey: "previewImage")
            uploadOperations = try container.decodeIfPresent([UploadOperation].self, forKey: "uploadOperations")
            videoDeliveryState = try container.decodeIfPresent(AppMediaVideoState.self, forKey: "videoDeliveryState")
            videoUrl = try container.decodeIfPresent(String.self, forKey: "videoUrl")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(appEventAssetType, forKey: "appEventAssetType")
            try container.encodeIfPresent(assetDeliveryState, forKey: "assetDeliveryState")
            try container.encodeIfPresent(fileName, forKey: "fileName")
            try container.encodeIfPresent(fileSize, forKey: "fileSize")
            try container.encodeIfPresent(previewFrameImage, forKey: "previewFrameImage")
            try container.encodeIfPresent(previewFrameTimeCode, forKey: "previewFrameTimeCode")
            try container.encodeIfPresent(previewImage, forKey: "previewImage")
            try container.encodeIfPresent(uploadOperations, forKey: "uploadOperations")
            try container.encodeIfPresent(videoDeliveryState, forKey: "videoDeliveryState")
            try container.encodeIfPresent(videoUrl, forKey: "videoUrl")
        }
    }

    public struct Relationships: Codable, Sendable {
        public var appEventLocalization: AppEventLocalization?

        public init(appEventLocalization: AppEventLocalization? = nil) {
            self.appEventLocalization = appEventLocalization
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            appEventLocalization = try container.decodeIfPresent(AppEventLocalization.self, forKey: "appEventLocalization")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(appEventLocalization, forKey: "appEventLocalization")
        }

        public struct AppEventLocalization: Codable, Sendable {
            @NullCodable public var data: Data?

            public init(data: Data? = nil) {
                self.data = data
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "appEventLocalizations" }

                public init(id: String) {
                    self.id = id
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    id = try container.decode(String.self, forKey: "id")
                    if try container.decode(String.self, forKey: "type") != type {
                        throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(id, forKey: "id")
                    try container.encode(type, forKey: "type")
                }
            }
        }
    }
}
