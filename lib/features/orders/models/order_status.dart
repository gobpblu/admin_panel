enum OrderStatus {
  processing,
  shipped,
  delivered,
  cancelled,
  pending;

  String getDisplayName() {
    return switch (this) {
      OrderStatus.processing => 'Processing',
      OrderStatus.shipped => 'Shipped',
      OrderStatus.delivered => 'Delivered',
      OrderStatus.cancelled => 'Cancelled',
      OrderStatus.pending => 'Pending',
    };
  }
}
