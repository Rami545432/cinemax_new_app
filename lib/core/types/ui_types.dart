import 'package:flutter/material.dart';

typedef ItemBuilder<T> = Widget Function(T item, VoidCallback onRemove);

typedef ItemBuilderWithAnimation<T> =
    Widget Function(T item, Animation<double> animation);
typedef HeaderBuilder = Widget Function(VoidCallback onClear);
