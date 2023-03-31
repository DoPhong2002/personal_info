class OpenseaModel {
  OpenseaModel({
      this.next, 
      this.previous, 
      this.assets,});

  OpenseaModel.fromJson(dynamic json) {
    next = json['next'];
    previous = json['previous'];
    if (json['assets'] != null) {
      assets = [];
      json['assets'].forEach((v) {
        assets?.add(Assets.fromJson(v));
      });
    }
  }
  String? next;
  dynamic previous;
  List<Assets>? assets;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['next'] = next;
    map['previous'] = previous;
    if (assets != null) {
      map['assets'] = assets?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Assets {
  Assets({
      this.id, 
      this.tokenId, 
      this.numSales, 
      this.backgroundColor, 
      this.imageUrl, 
      this.imagePreviewUrl, 
      this.imageThumbnailUrl, 
      this.imageOriginalUrl, 
      this.animationUrl, 
      this.animationOriginalUrl, 
      this.name, 
      this.description, 
      this.externalLink, 
      this.assetContract, 
      this.permalink, 
      this.collection, 
      this.decimals, 
      this.tokenMetadata, 
      this.isNsfw, 
      this.owner, 
      this.seaportSellOrders, 
      this.creator, 
      this.traits, 
      this.lastSale, 
      this.topBid, 
      this.listingDate, 
      this.supportsWyvern, 
      this.rarityData, 
      this.transferFee, 
      this.transferFeePaymentToken,});

  Assets.fromJson(dynamic json) {
    id = json['id'];
    tokenId = json['token_id'];
    numSales = json['num_sales'];
    backgroundColor = json['background_color'];
    imageUrl = json['image_url'];
    imagePreviewUrl = json['image_preview_url'];
    imageThumbnailUrl = json['image_thumbnail_url'];
    imageOriginalUrl = json['image_original_url'];
    animationUrl = json['animation_url'];
    animationOriginalUrl = json['animation_original_url'];
    name = json['name'];
    description = json['description'];
    externalLink = json['external_link'];
    assetContract = json['asset_contract'] != null ? AssetContract.fromJson(json['asset_contract']) : null;
    permalink = json['permalink'];
    collection = json['collection'] != null ? Collection.fromJson(json['collection']) : null;
    decimals = json['decimals'];
    tokenMetadata = json['token_metadata'];
    isNsfw = json['is_nsfw'];
    owner = json['owner'];
    seaportSellOrders = json['seaport_sell_orders'];
    creator = json['creator'] != null ? Creator.fromJson(json['creator']) : null;
    if (json['traits'] != null) {
      traits = [];
      json['traits'].forEach((v) {
        traits?.add(Traits.fromJson(v));
      });
    }
    lastSale = json['last_sale'];
    topBid = json['top_bid'];
    listingDate = json['listing_date'];
    supportsWyvern = json['supports_wyvern'];
    rarityData = json['rarity_data'];
    transferFee = json['transfer_fee'];
    transferFeePaymentToken = json['transfer_fee_payment_token'];
  }
  int? id;
  String? tokenId;
  int? numSales;
  dynamic backgroundColor;
  String? imageUrl;
  String? imagePreviewUrl;
  String? imageThumbnailUrl;
  String? imageOriginalUrl;
  dynamic animationUrl;
  dynamic animationOriginalUrl;
  String? name;
  dynamic description;
  String? externalLink;
  AssetContract? assetContract;
  String? permalink;
  Collection? collection;
  dynamic decimals;
  dynamic tokenMetadata;
  bool? isNsfw;
  dynamic owner;
  dynamic seaportSellOrders;
  Creator? creator;
  List<Traits>? traits;
  dynamic lastSale;
  dynamic topBid;
  dynamic listingDate;
  bool? supportsWyvern;
  dynamic rarityData;
  dynamic transferFee;
  dynamic transferFeePaymentToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['token_id'] = tokenId;
    map['num_sales'] = numSales;
    map['background_color'] = backgroundColor;
    map['image_url'] = imageUrl;
    map['image_preview_url'] = imagePreviewUrl;
    map['image_thumbnail_url'] = imageThumbnailUrl;
    map['image_original_url'] = imageOriginalUrl;
    map['animation_url'] = animationUrl;
    map['animation_original_url'] = animationOriginalUrl;
    map['name'] = name;
    map['description'] = description;
    map['external_link'] = externalLink;
    if (assetContract != null) {
      map['asset_contract'] = assetContract?.toJson();
    }
    map['permalink'] = permalink;
    if (collection != null) {
      map['collection'] = collection?.toJson();
    }
    map['decimals'] = decimals;
    map['token_metadata'] = tokenMetadata;
    map['is_nsfw'] = isNsfw;
    map['owner'] = owner;
    map['seaport_sell_orders'] = seaportSellOrders;
    if (creator != null) {
      map['creator'] = creator?.toJson();
    }
    if (traits != null) {
      map['traits'] = traits?.map((v) => v.toJson()).toList();
    }
    map['last_sale'] = lastSale;
    map['top_bid'] = topBid;
    map['listing_date'] = listingDate;
    map['supports_wyvern'] = supportsWyvern;
    map['rarity_data'] = rarityData;
    map['transfer_fee'] = transferFee;
    map['transfer_fee_payment_token'] = transferFeePaymentToken;
    return map;
  }

}

class Traits {
  Traits({
      this.traitType, 
      this.displayType, 
      this.maxValue, 
      this.traitCount, 
      this.order, 
      this.value,});

  Traits.fromJson(dynamic json) {
    traitType = json['trait_type'];
    displayType = json['display_type'];
    maxValue = json['max_value'];
    traitCount = json['trait_count'];
    order = json['order'];
    value = json['value'];
  }
  String? traitType;
  dynamic displayType;
  dynamic maxValue;
  int? traitCount;
  dynamic order;
  String? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['trait_type'] = traitType;
    map['display_type'] = displayType;
    map['max_value'] = maxValue;
    map['trait_count'] = traitCount;
    map['order'] = order;
    map['value'] = value;
    return map;
  }

}

class Creator {
  Creator({
      this.user, 
      this.address, 
      this.config, 
      this.profileImgUrl,});

  Creator.fromJson(dynamic json) {
    user = json['user'];
    address = json['address'];
    config = json['config'];
    profileImgUrl = json['profile_img_url'];
  }
  dynamic user;
  String? address;
  String? config;
  String? profileImgUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user'] = user;
    map['address'] = address;
    map['config'] = config;
    map['profile_img_url'] = profileImgUrl;
    return map;
  }

}

class Collection {
  Collection({
      this.bannerImageUrl, 
      this.chatUrl, 
      this.createdDate, 
      this.defaultToFiat, 
      this.description, 
      this.devBuyerFeeBasisPoints, 
      this.devSellerFeeBasisPoints, 
      this.discordUrl, 
      this.displayData, 
      this.externalUrl, 
      this.featured, 
      this.featuredImageUrl, 
      this.hidden, 
      this.safelistRequestStatus, 
      this.imageUrl, 
      this.isSubjectToWhitelist, 
      this.largeImageUrl, 
      this.mediumUsername, 
      this.name, 
      this.onlyProxiedTransfers, 
      this.openseaBuyerFeeBasisPoints, 
      this.openseaSellerFeeBasisPoints, 
      this.payoutAddress, 
      this.requireEmail, 
      this.shortDescription, 
      this.slug, 
      this.telegramUrl, 
      this.twitterUsername, 
      this.instagramUsername, 
      this.wikiUrl, 
      this.isNsfw, 
      this.fees, 
      this.isRarityEnabled, 
      this.isCreatorFeesEnforced,});

  Collection.fromJson(dynamic json) {
    bannerImageUrl = json['banner_image_url'];
    chatUrl = json['chat_url'];
    createdDate = json['created_date'];
    defaultToFiat = json['default_to_fiat'];
    description = json['description'];
    devBuyerFeeBasisPoints = json['dev_buyer_fee_basis_points'];
    devSellerFeeBasisPoints = json['dev_seller_fee_basis_points'];
    discordUrl = json['discord_url'];
    displayData = json['display_data'] != null ? DisplayData.fromJson(json['display_data']) : null;
    externalUrl = json['external_url'];
    featured = json['featured'];
    featuredImageUrl = json['featured_image_url'];
    hidden = json['hidden'];
    safelistRequestStatus = json['safelist_request_status'];
    imageUrl = json['image_url'];
    isSubjectToWhitelist = json['is_subject_to_whitelist'];
    largeImageUrl = json['large_image_url'];
    mediumUsername = json['medium_username'];
    name = json['name'];
    onlyProxiedTransfers = json['only_proxied_transfers'];
    openseaBuyerFeeBasisPoints = json['opensea_buyer_fee_basis_points'];
    openseaSellerFeeBasisPoints = json['opensea_seller_fee_basis_points'];
    payoutAddress = json['payout_address'];
    requireEmail = json['require_email'];
    shortDescription = json['short_description'];
    slug = json['slug'];
    telegramUrl = json['telegram_url'];
    twitterUsername = json['twitter_username'];
    instagramUsername = json['instagram_username'];
    wikiUrl = json['wiki_url'];
    isNsfw = json['is_nsfw'];
    fees = json['fees'] != null ? Fees.fromJson(json['fees']) : null;
    isRarityEnabled = json['is_rarity_enabled'];
    isCreatorFeesEnforced = json['is_creator_fees_enforced'];
  }
  String? bannerImageUrl;
  dynamic chatUrl;
  String? createdDate;
  bool? defaultToFiat;
  String? description;
  String? devBuyerFeeBasisPoints;
  String? devSellerFeeBasisPoints;
  String? discordUrl;
  DisplayData? displayData;
  String? externalUrl;
  bool? featured;
  String? featuredImageUrl;
  bool? hidden;
  String? safelistRequestStatus;
  String? imageUrl;
  bool? isSubjectToWhitelist;
  String? largeImageUrl;
  dynamic mediumUsername;
  String? name;
  bool? onlyProxiedTransfers;
  String? openseaBuyerFeeBasisPoints;
  int? openseaSellerFeeBasisPoints;
  dynamic payoutAddress;
  bool? requireEmail;
  dynamic shortDescription;
  String? slug;
  dynamic telegramUrl;
  String? twitterUsername;
  dynamic instagramUsername;
  dynamic wikiUrl;
  bool? isNsfw;
  Fees? fees;
  bool? isRarityEnabled;
  bool? isCreatorFeesEnforced;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['banner_image_url'] = bannerImageUrl;
    map['chat_url'] = chatUrl;
    map['created_date'] = createdDate;
    map['default_to_fiat'] = defaultToFiat;
    map['description'] = description;
    map['dev_buyer_fee_basis_points'] = devBuyerFeeBasisPoints;
    map['dev_seller_fee_basis_points'] = devSellerFeeBasisPoints;
    map['discord_url'] = discordUrl;
    if (displayData != null) {
      map['display_data'] = displayData?.toJson();
    }
    map['external_url'] = externalUrl;
    map['featured'] = featured;
    map['featured_image_url'] = featuredImageUrl;
    map['hidden'] = hidden;
    map['safelist_request_status'] = safelistRequestStatus;
    map['image_url'] = imageUrl;
    map['is_subject_to_whitelist'] = isSubjectToWhitelist;
    map['large_image_url'] = largeImageUrl;
    map['medium_username'] = mediumUsername;
    map['name'] = name;
    map['only_proxied_transfers'] = onlyProxiedTransfers;
    map['opensea_buyer_fee_basis_points'] = openseaBuyerFeeBasisPoints;
    map['opensea_seller_fee_basis_points'] = openseaSellerFeeBasisPoints;
    map['payout_address'] = payoutAddress;
    map['require_email'] = requireEmail;
    map['short_description'] = shortDescription;
    map['slug'] = slug;
    map['telegram_url'] = telegramUrl;
    map['twitter_username'] = twitterUsername;
    map['instagram_username'] = instagramUsername;
    map['wiki_url'] = wikiUrl;
    map['is_nsfw'] = isNsfw;
    if (fees != null) {
      map['fees'] = fees?.toJson();
    }
    map['is_rarity_enabled'] = isRarityEnabled;
    map['is_creator_fees_enforced'] = isCreatorFeesEnforced;
    return map;
  }

}

class Fees {
  Fees({
      this.sellerFees, 
      this.openseaFees,});

  Fees.fromJson(dynamic json) {
    sellerFees = json['seller_fees'];
    openseaFees = json['opensea_fees'] != null ? OpenseaFees.fromJson(json['opensea_fees']) : null;
  }
  dynamic sellerFees;
  OpenseaFees? openseaFees;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['seller_fees'] = sellerFees;
    if (openseaFees != null) {
      map['opensea_fees'] = openseaFees?.toJson();
    }
    return map;
  }

}

class OpenseaFees {
  OpenseaFees({
      this.x0000a26b00c1f0df003000390027140000faa719,});

  OpenseaFees.fromJson(dynamic json) {
    x0000a26b00c1f0df003000390027140000faa719 = json['0x0000a26b00c1f0df003000390027140000faa719'];
  }
  int? x0000a26b00c1f0df003000390027140000faa719;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['0x0000a26b00c1f0df003000390027140000faa719'] = x0000a26b00c1f0df003000390027140000faa719;
    return map;
  }

}

class DisplayData {
  DisplayData({
      this.cardDisplayStyle,});

  DisplayData.fromJson(dynamic json) {
    cardDisplayStyle = json['card_display_style'];
  }
  String? cardDisplayStyle;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['card_display_style'] = cardDisplayStyle;
    return map;
  }

}

class AssetContract {
  AssetContract({
      this.address, 
      this.assetContractType, 
      this.createdDate, 
      this.name, 
      this.nftVersion, 
      this.openseaVersion, 
      this.owner, 
      this.schemaName, 
      this.symbol, 
      this.totalSupply, 
      this.description, 
      this.externalLink, 
      this.imageUrl, 
      this.defaultToFiat, 
      this.devBuyerFeeBasisPoints, 
      this.devSellerFeeBasisPoints, 
      this.onlyProxiedTransfers, 
      this.openseaBuyerFeeBasisPoints, 
      this.openseaSellerFeeBasisPoints, 
      this.buyerFeeBasisPoints, 
      this.sellerFeeBasisPoints, 
      this.payoutAddress,});

  AssetContract.fromJson(dynamic json) {
    address = json['address'];
    assetContractType = json['asset_contract_type'];
    createdDate = json['created_date'];
    name = json['name'];
    nftVersion = json['nft_version'];
    openseaVersion = json['opensea_version'];
    owner = json['owner'];
    schemaName = json['schema_name'];
    symbol = json['symbol'];
    totalSupply = json['total_supply'];
    description = json['description'];
    externalLink = json['external_link'];
    imageUrl = json['image_url'];
    defaultToFiat = json['default_to_fiat'];
    devBuyerFeeBasisPoints = json['dev_buyer_fee_basis_points'];
    devSellerFeeBasisPoints = json['dev_seller_fee_basis_points'];
    onlyProxiedTransfers = json['only_proxied_transfers'];
    openseaBuyerFeeBasisPoints = json['opensea_buyer_fee_basis_points'];
    openseaSellerFeeBasisPoints = json['opensea_seller_fee_basis_points'];
    buyerFeeBasisPoints = json['buyer_fee_basis_points'];
    sellerFeeBasisPoints = json['seller_fee_basis_points'];
    payoutAddress = json['payout_address'];
  }
  String? address;
  String? assetContractType;
  String? createdDate;
  String? name;
  String? nftVersion;
  dynamic openseaVersion;
  dynamic owner;
  String? schemaName;
  String? symbol;
  dynamic totalSupply;
  String? description;
  String? externalLink;
  String? imageUrl;
  bool? defaultToFiat;
  int? devBuyerFeeBasisPoints;
  int? devSellerFeeBasisPoints;
  bool? onlyProxiedTransfers;
  int? openseaBuyerFeeBasisPoints;
  int? openseaSellerFeeBasisPoints;
  int? buyerFeeBasisPoints;
  int? sellerFeeBasisPoints;
  dynamic payoutAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = address;
    map['asset_contract_type'] = assetContractType;
    map['created_date'] = createdDate;
    map['name'] = name;
    map['nft_version'] = nftVersion;
    map['opensea_version'] = openseaVersion;
    map['owner'] = owner;
    map['schema_name'] = schemaName;
    map['symbol'] = symbol;
    map['total_supply'] = totalSupply;
    map['description'] = description;
    map['external_link'] = externalLink;
    map['image_url'] = imageUrl;
    map['default_to_fiat'] = defaultToFiat;
    map['dev_buyer_fee_basis_points'] = devBuyerFeeBasisPoints;
    map['dev_seller_fee_basis_points'] = devSellerFeeBasisPoints;
    map['only_proxied_transfers'] = onlyProxiedTransfers;
    map['opensea_buyer_fee_basis_points'] = openseaBuyerFeeBasisPoints;
    map['opensea_seller_fee_basis_points'] = openseaSellerFeeBasisPoints;
    map['buyer_fee_basis_points'] = buyerFeeBasisPoints;
    map['seller_fee_basis_points'] = sellerFeeBasisPoints;
    map['payout_address'] = payoutAddress;
    return map;
  }

}