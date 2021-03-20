import 'package:flutter/material.dart';

class BurgerData
{
  Map<String, bool> info = {
    "selected":false,
    "meal":false,
    "crazy":false,
    "fries":false,
    "cola":false,
    "asado":false,
    "cheese":false,
    "onion_jam":false,
    "lades":false,
    "onion":false,
    "pickles":false,
    "tomato":false,
  };
  int id;
  BurgerData(this.id);
}