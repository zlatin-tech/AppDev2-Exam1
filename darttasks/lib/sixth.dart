class Pizza {
  void orderPizza({String size = 'Medium', String crust = 'Regular', List<String> toppings = const [], String specialInstructions = 'None'}) {
    print('Order Details: Size: $size, Crust: $crust, Toppings: ${toppings.join(", ")}, Special Instructions: $specialInstructions');
  }
}

void main() {
  Pizza pizzaOrder = Pizza();
  pizzaOrder.orderPizza(size: 'Large', crust: 'Thin', toppings: ['Mushrooms', 'Peppers'], specialInstructions: 'Extra cheese');
}
