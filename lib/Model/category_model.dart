// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

List<Category> categoryFromJson(String str) => List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  Category({
    this.id,
    this.count,
    this.description,
    this.link,
    this.name,
    this.slug,
    this.taxonomy,
    this.parent,
    this.meta,
    this.image,
    this.links,
  });

  int id;
  int count;
  String description;
  String link;
  String name;
  String slug;
  Taxonomy taxonomy;
  int parent;
  List<dynamic> meta;
  dynamic image;
  Links links;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    count: json["count"],
    description: json["description"],
    link: json["link"],
    name: json["name"],
    slug: json["slug"],
    taxonomy: taxonomyValues.map[json["taxonomy"]],
    parent: json["parent"],
    meta: List<dynamic>.from(json["meta"].map((x) => x)),
    image: json["image"],
    links: Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "count": count,
    "description": description,
    "link": link,
    "name": name,
    "slug": slug,
    "taxonomy": taxonomyValues.reverse[taxonomy],
    "parent": parent,
    "meta": List<dynamic>.from(meta.map((x) => x)),
    "image": image,
    "_links": links.toJson(),
  };
}

class ImageClass {
  ImageClass({
    this.id,
    this.postAuthor,
    this.postDate,
    this.postDateGmt,
    this.postContent,
    this.postTitle,
    this.postExcerpt,
    this.postStatus,
    this.commentStatus,
    this.pingStatus,
    this.postPassword,
    this.postName,
    this.toPing,
    this.pinged,
    this.postModified,
    this.postModifiedGmt,
    this.postContentFiltered,
    this.postParent,
    this.guid,
    this.menuOrder,
    this.postType,
    this.postMimeType,
    this.commentCount,
    this.podItemId,
  });

  String id;
  String postAuthor;
  DateTime postDate;
  DateTime postDateGmt;
  String postContent;
  String postTitle;
  String postExcerpt;
  String postStatus;
  String commentStatus;
  String pingStatus;
  String postPassword;
  String postName;
  String toPing;
  String pinged;
  DateTime postModified;
  DateTime postModifiedGmt;
  String postContentFiltered;
  String postParent;
  String guid;
  String menuOrder;
  String postType;
  String postMimeType;
  String commentCount;
  String podItemId;

  factory ImageClass.fromJson(Map<String, dynamic> json) => ImageClass(
    id: json["ID"],
    postAuthor: json["post_author"],
    postDate: DateTime.parse(json["post_date"]),
    postDateGmt: DateTime.parse(json["post_date_gmt"]),
    postContent: json["post_content"],
    postTitle: json["post_title"],
    postExcerpt: json["post_excerpt"],
    postStatus: json["post_status"],
    commentStatus: json["comment_status"],
    pingStatus: json["ping_status"],
    postPassword: json["post_password"],
    postName: json["post_name"],
    toPing: json["to_ping"],
    pinged: json["pinged"],
    postModified: DateTime.parse(json["post_modified"]),
    postModifiedGmt: DateTime.parse(json["post_modified_gmt"]),
    postContentFiltered: json["post_content_filtered"],
    postParent: json["post_parent"],
    guid: json["guid"],
    menuOrder: json["menu_order"],
    postType: json["post_type"],
    postMimeType: json["post_mime_type"],
    commentCount: json["comment_count"],
    podItemId: json["pod_item_id"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "post_author": postAuthor,
    "post_date": postDate.toIso8601String(),
    "post_date_gmt": postDateGmt.toIso8601String(),
    "post_content": postContent,
    "post_title": postTitle,
    "post_excerpt": postExcerpt,
    "post_status": postStatus,
    "comment_status": commentStatus,
    "ping_status": pingStatus,
    "post_password": postPassword,
    "post_name": postName,
    "to_ping": toPing,
    "pinged": pinged,
    "post_modified": postModified.toIso8601String(),
    "post_modified_gmt": postModifiedGmt.toIso8601String(),
    "post_content_filtered": postContentFiltered,
    "post_parent": postParent,
    "guid": guid,
    "menu_order": menuOrder,
    "post_type": postType,
    "post_mime_type": postMimeType,
    "comment_count": commentCount,
    "pod_item_id": podItemId,
  };
}

class Links {
  Links({
    this.self,
    this.collection,
    this.about,
    this.up,
    this.wpPostType,
    this.curies,
  });

  List<About> self;
  List<About> collection;
  List<About> about;
  List<Up> up;
  List<About> wpPostType;
  List<Cury> curies;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
    collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
    about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
    up: json["up"] == null ? null : List<Up>.from(json["up"].map((x) => Up.fromJson(x))),
    wpPostType: List<About>.from(json["wp:post_type"].map((x) => About.fromJson(x))),
    curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": List<dynamic>.from(self.map((x) => x.toJson())),
    "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
    "about": List<dynamic>.from(about.map((x) => x.toJson())),
    "up": up == null ? null : List<dynamic>.from(up.map((x) => x.toJson())),
    "wp:post_type": List<dynamic>.from(wpPostType.map((x) => x.toJson())),
    "curies": List<dynamic>.from(curies.map((x) => x.toJson())),
  };
}

class About {
  About({
    this.href,
  });

  String href;

  factory About.fromJson(Map<String, dynamic> json) => About(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}

class Cury {
  Cury({
    this.name,
    this.href,
    this.templated,
  });

  Name name;
  Href href;
  bool templated;

  factory Cury.fromJson(Map<String, dynamic> json) => Cury(
    name: nameValues.map[json["name"]],
    href: hrefValues.map[json["href"]],
    templated: json["templated"],
  );

  Map<String, dynamic> toJson() => {
    "name": nameValues.reverse[name],
    "href": hrefValues.reverse[href],
    "templated": templated,
  };
}

enum Href { HTTPS_API_W_ORG_REL }

final hrefValues = EnumValues({
  "https://api.w.org/{rel}": Href.HTTPS_API_W_ORG_REL
});

enum Name { WP }

final nameValues = EnumValues({
  "wp": Name.WP
});

class Up {
  Up({
    this.embeddable,
    this.href,
  });

  bool embeddable;
  String href;

  factory Up.fromJson(Map<String, dynamic> json) => Up(
    embeddable: json["embeddable"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "embeddable": embeddable,
    "href": href,
  };
}

enum Taxonomy { CATALOGUE }

final taxonomyValues = EnumValues({
  "catalogue": Taxonomy.CATALOGUE
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
