import 'dart:convert';

class MobilePhone {
  String id;
  String name;
  String variant;
  String imei;
  MobilePhone({
    required this.id,
    required this.name,
    required this.variant,
    required this.imei,
  });
  factory MobilePhone.create({
    String? id,
    String? name,
    String? variant,
    String? imei,
  }) {
    return MobilePhone(
      id: id ?? "",
      name: name ?? "",
      variant: variant ?? "",
      imei: imei ?? "",
    );
  }

  MobilePhone copyWith({
    String? id,
    String? name,
    String? variant,
    String? imei,
  }) {
    return MobilePhone(
      id: id ?? this.id,
      name: name ?? this.name,
      variant: variant ?? this.variant,
      imei: imei ?? this.imei,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    if (id.isNotEmpty) {
      result.addAll({'id': id});
    }

    result.addAll({'name': name});
    result.addAll({'variant': variant});
    result.addAll({'imei': imei});

    return result;
  }

  factory MobilePhone.fromMap(Map<String, dynamic> map) {
    return MobilePhone(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      variant: map['variant'] ?? '',
      imei: map['imei'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MobilePhone.fromJson(String source) =>
      MobilePhone.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MobilePhone(id: $id, name: $name, variant: $variant, imei: $imei)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MobilePhone &&
        other.id == id &&
        other.name == name &&
        other.variant == variant &&
        other.imei == imei;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ variant.hashCode ^ imei.hashCode;
  }
}

List<MobilePhone> mockUpMobilePhones = [
  MobilePhone(
      id: "", name: 'iPhone 12', variant: 'Pro', imei: '123456789012345'),
  MobilePhone(
      id: "",
      name: 'Samsung Galaxy S21',
      variant: 'Ultra',
      imei: '987654321098765'),
  MobilePhone(
      id: "", name: 'Google Pixel 5', variant: 'XL', imei: '567890123456789'),
  MobilePhone(
      id: "", name: 'OnePlus 9', variant: 'Pro', imei: '876543210987654'),
  MobilePhone(
      id: "", name: 'Huawei P40', variant: 'Lite', imei: '345678901234567'),
  MobilePhone(
      id: "", name: 'Xiaomi Mi 11', variant: 'Ultra', imei: '234567890123456'),
  MobilePhone(
      id: "",
      name: 'Sony Xperia 1 II',
      variant: 'Mark II',
      imei: '654321098765432'),
  MobilePhone(
      id: "", name: 'LG Velvet', variant: '5G', imei: '432109876543210'),
  MobilePhone(
      id: "", name: 'Motorola Edge+', variant: 'Plus', imei: '789012345678901'),
  MobilePhone(
      id: "", name: 'Nokia 8.3', variant: '5G', imei: '890123456789012'),
  MobilePhone(
      id: "", name: 'BlackBerry Key2', variant: 'LE', imei: '012345678901234'),
  MobilePhone(
      id: "", name: 'HTC U12+', variant: 'Plus', imei: '098765432109876'),
  MobilePhone(
      id: "",
      name: 'Asus ROG Phone 5',
      variant: 'Pro',
      imei: '345678901234567'),
  MobilePhone(
      id: "",
      name: 'Lenovo Legion Phone Duel',
      variant: 'Pro',
      imei: '876543210987654'),
  MobilePhone(
      id: "",
      name: 'ZTE Axon 30 Ultra',
      variant: '5G',
      imei: '567890123456789'),
  MobilePhone(
      id: "",
      name: 'Oppo Find X3 Pro',
      variant: 'Lite',
      imei: '234567890123456'),
  MobilePhone(
      id: "", name: 'Vivo X60 Pro', variant: 'Plus', imei: '654321098765432'),
  MobilePhone(
      id: "",
      name: 'Realme GT',
      variant: 'Master Edition',
      imei: '432109876543210'),
  MobilePhone(id: "", name: 'Poco X3', variant: 'NFC', imei: '789012345678901'),
  MobilePhone(
      id: "", name: 'Infinix Note 10', variant: 'Pro', imei: '890123456789012'),
  MobilePhone(
      id: "", name: 'Google Pixel 4a', variant: 'XL', imei: '456789012345678'),
  MobilePhone(
      id: "",
      name: 'iPhone SE (2020)',
      variant: '2nd Gen',
      imei: '567890123456789'),
  MobilePhone(
      id: "",
      name: 'Samsung Galaxy Note 20',
      variant: 'Ultra',
      imei: '678901234567890'),
  MobilePhone(
      id: "", name: 'OnePlus Nord', variant: 'CE', imei: '789012345678901'),
  MobilePhone(
      id: "",
      name: 'Xiaomi Redmi Note 9',
      variant: 'Pro',
      imei: '890123456789012'),
  MobilePhone(
      id: "",
      name: 'Sony Xperia 5 II',
      variant: 'Mark II',
      imei: '901234567890123'),
  MobilePhone(
      id: "", name: 'LG G8 ThinQ', variant: 'Plus', imei: '123456789012345'),
  MobilePhone(
      id: "",
      name: 'Motorola Moto G Power',
      variant: '2021',
      imei: '234567890123456'),
  MobilePhone(
      id: "", name: 'Nokia 5.4', variant: 'Plus', imei: '345678901234567'),
  MobilePhone(
      id: "",
      name: 'BlackBerry Keyone',
      variant: 'Black Edition',
      imei: '456789012345678'),
  MobilePhone(
      id: "",
      name: 'HTC Desire 21 Pro',
      variant: 'Plus',
      imei: '567890123456789'),
  MobilePhone(
      id: "",
      name: 'Asus ZenFone 7 Pro',
      variant: 'Ultra',
      imei: '678901234567890'),
  MobilePhone(
      id: "",
      name: 'Lenovo K12 Note',
      variant: 'Power',
      imei: '789012345678901'),
  MobilePhone(
      id: "",
      name: 'ZTE Blade V2020',
      variant: 'Smart',
      imei: '890123456789012'),
  MobilePhone(
      id: "", name: 'Oppo Reno4 Pro', variant: 'Lite', imei: '901234567890123'),
  MobilePhone(
      id: "", name: 'Vivo Y20s', variant: 'SE', imei: '123456789012345'),
  MobilePhone(
      id: "", name: 'Realme C15', variant: 'Power', imei: '234567890123456'),
  MobilePhone(id: "", name: 'Poco M3', variant: 'X3', imei: '345678901234567'),
  MobilePhone(
      id: "", name: 'Infinix Hot 10', variant: 'Note', imei: '456789012345678'),
  MobilePhone(
      id: "", name: 'Google Pixel 3a', variant: 'XL', imei: '567890123456789'),
  MobilePhone(
      id: "", name: 'iPhone 11', variant: 'Pro', imei: '678901234567890'),
  MobilePhone(
      id: "",
      name: 'Samsung Galaxy A52',
      variant: '5G',
      imei: '789012345678901'),
  MobilePhone(
      id: "", name: 'OnePlus 8T', variant: 'Pro', imei: '890123456789012'),
  MobilePhone(
      id: "", name: 'Xiaomi Mi 10', variant: 'Ultra', imei: '901234567890123'),
  MobilePhone(
      id: "",
      name: 'Sony Xperia 10 II',
      variant: 'Mark II',
      imei: '123456789012345'),
  MobilePhone(
      id: "", name: 'LG K92 5G', variant: 'ThinQ', imei: '234567890123456'),
  MobilePhone(
      id: "",
      name: 'Motorola Moto E7',
      variant: 'Power',
      imei: '345678901234567'),
  MobilePhone(
      id: "", name: 'Nokia 3.4', variant: 'Plus', imei: '456789012345678'),
  MobilePhone(
      id: "",
      name: 'BlackBerry Motion',
      variant: 'Touch',
      imei: '567890123456789'),
  MobilePhone(
      id: "", name: 'HTC U20 5G', variant: 'Desire', imei: '678901234567890'),
];
