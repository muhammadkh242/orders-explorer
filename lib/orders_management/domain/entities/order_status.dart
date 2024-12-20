enum OrderStatus {
  ordered,
  delivered,
  returned;

  static OrderStatus getStatusFromText(String text) {
    switch (text) {
      case "ORDERED":
        return ordered;
      case "DELIVERED":
        return delivered;
      case "RETURNED":
        return returned;
      default:
        return ordered;
    }
  }
}
