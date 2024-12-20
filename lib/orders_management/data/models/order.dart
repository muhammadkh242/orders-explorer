
import '../../domain/entities/order_status.dart';

class Order {
  final String? id;
  final bool? isActive;
  final String? price;
  final String? company;
  final String? picture;
  final String? buyer;
  final List<String>? tags;
  final OrderStatus? status;
  final DateTime? registered;

  Order({
    this.id,
    this.isActive,
    this.price,
    this.company,
    this.picture,
    this.buyer,
    this.tags,
    this.status,
    this.registered,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      isActive: json['isActive'],
      price: json['price'],
      company: json['company'],
      picture: json['picture'],
      buyer: json['buyer'],
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
      status: OrderStatus.getStatusFromText(json['status']),
      registered: json['registered'] != null
          ? DateTime.parse(json['registered'])
          : null,
    );
  }

}
