import 'package:flutter/material.dart';

// To parse this JSON data, do
//
//     final formation = formationFromJson(jsonString);
import 'dart:convert';

class Formation {
  Formation({
    this.id,
    this.date,
    this.dateGmt,
    this.guid,
    this.modified,
    this.modifiedGmt,
    this.slug,
    this.status,
    this.type,
    this.link,
    this.title,
    this.content,
    this.template,
    this.meta,
    this.catalogue,
    this.programme,
    this.image,
    this.formationDate,
    this.confirmedDisplayed,
    this.duration,
    this.rating,
    this.profile,
    this.dateStatus,
    this.shortDescription,
    this.links,
  });

  int id;
  DateTime date;
  DateTime dateGmt;
  Guid guid;
  DateTime modified;
  DateTime modifiedGmt;
  String slug;
  String status;
  String type;
  String link;
  Guid title;
  Content content;
  String template;
  List<dynamic> meta;
  List<int> catalogue;
  String programme;
  Images image;
  String formationDate;
  String confirmedDisplayed;
  String duration;
  dynamic rating;
  String profile;
  List<String> dateStatus;
  String shortDescription;
  Links links;

  factory Formation.fromJson(Map<String, dynamic> json) => Formation(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    dateGmt: DateTime.parse(json["date_gmt"]),
    guid: Guid.fromJson(json["guid"]),
    modified: DateTime.parse(json["modified"]),
    modifiedGmt: DateTime.parse(json["modified_gmt"]),
    slug: json["slug"],
    status: json["status"],
    type: json["type"],
    link: json["link"],
    title: Guid.fromJson(json["title"]),
    content: Content.fromJson(json["content"]),
    template: json["template"],
    meta: List<dynamic>.from(json["meta"].map((x) => x)),
    catalogue: List<int>.from(json["catalogue"].map((x) => x)),
    programme: json["programme"],
    image: Images.fromJson(json["image"]),
    formationDate: json["formation_date"],
    confirmedDisplayed: json["confirmed_displayed"],
    duration: json["duration"],
    rating: json["rating"],
    profile: json["profile"],
    dateStatus: List<String>.from(json["date_status"].map((x) => x)),
    shortDescription: json["short_description"],
    links: Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date.toIso8601String(),
    "date_gmt": dateGmt.toIso8601String(),
    "guid": guid.toJson(),
    "modified": modified.toIso8601String(),
    "modified_gmt": modifiedGmt.toIso8601String(),
    "slug": slug,
    "status": status,
    "type": type,
    "link": link,
    "title": title.toJson(),
    "content": content.toJson(),
    "template": template,
    "meta": List<dynamic>.from(meta.map((x) => x)),
    "catalogue": List<dynamic>.from(catalogue.map((x) => x)),
    "programme": programme,
    "image": image.toJson(),
    "formation_date": formationDate,
    "confirmed_displayed": confirmedDisplayed,
    "duration": duration,
    "rating": rating,
    "profile": profile,
    "date_status": List<dynamic>.from(dateStatus.map((x) => x)),
    "short_description": shortDescription,
    "_links": links.toJson(),
  };
}

class Content {
  Content({
    this.rendered,
    this.protected,
  });

  String rendered;
  bool protected;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    rendered: json["rendered"],
    protected: json["protected"],
  );

  Map<String, dynamic> toJson() => {
    "rendered": rendered,
    "protected": protected,
  };
}

class Guid {
  Guid({
    this.rendered,
  });

  String rendered;

  factory Guid.fromJson(Map<String, dynamic> json) => Guid(
    rendered: json["rendered"],
  );

  Map<String, dynamic> toJson() => {
    "rendered": rendered,
  };
}

class Images {
  Images({
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

  factory Images.fromJson(Map<String, dynamic> json) => Images(
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
    this.wpAttachment,
    this.wpTerm,
    this.curies,
  });

  List<About> self;
  List<About> collection;
  List<About> about;
  List<About> wpAttachment;
  List<WpTerm> wpTerm;
  List<Cury> curies;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
    collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
    about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
    wpAttachment: List<About>.from(json["wp:attachment"].map((x) => About.fromJson(x))),
    wpTerm: List<WpTerm>.from(json["wp:term"].map((x) => WpTerm.fromJson(x))),
    curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": List<dynamic>.from(self.map((x) => x.toJson())),
    "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
    "about": List<dynamic>.from(about.map((x) => x.toJson())),
    "wp:attachment": List<dynamic>.from(wpAttachment.map((x) => x.toJson())),
    "wp:term": List<dynamic>.from(wpTerm.map((x) => x.toJson())),
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

  String name;
  String href;
  bool templated;

  factory Cury.fromJson(Map<String, dynamic> json) => Cury(
    name: json["name"],
    href: json["href"],
    templated: json["templated"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "href": href,
    "templated": templated,
  };
}

class WpTerm {
  WpTerm({
    this.taxonomy,
    this.embeddable,
    this.href,
  });

  String taxonomy;
  bool embeddable;
  String href;

  factory WpTerm.fromJson(Map<String, dynamic> json) => WpTerm(
    taxonomy: json["taxonomy"],
    embeddable: json["embeddable"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "taxonomy": taxonomy,
    "embeddable": embeddable,
    "href": href,
  };
}
