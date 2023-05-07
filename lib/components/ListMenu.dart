import 'package:flutter/material.dart';
import 'package:pembayaran/models/menugrid.dart';

List<MenuItem> menuItems = [
  MenuItem(
    title: 'Saldo',
    icon: Icons.money_off_csred,
    colors: Color.fromARGB(255, 186, 167, 21),
    route: '/saldo',
  ),
  MenuItem(
    title: 'Lokasi',
    icon: Icons.map,
    colors: Color.fromARGB(255, 142, 227, 144),
    route: '/saldo',
  ),
  MenuItem(
    title: 'Status',
    icon: Icons.settings,
    colors: Colors.orange[100],
    route: '/saldo',
  ),
  MenuItem(
    title: 'Penitipan',
    icon: Icons.settings,
    colors: Colors.orange[200],
    route: '/saldo',
  ),
  MenuItem(
    title: 'Tracking',
    icon: Icons.settings,
    colors: Colors.orange[400],
    route: '/saldo',
  ),
  MenuItem(
    title: 'Item 6',
    icon: Icons.settings,
    colors: Colors.orange[500],
    route: '/saldo',
  ),
  MenuItem(
    title: 'Item 7',
    icon: Icons.settings,
    colors: Colors.green[100],
    route: '/saldo',
  ),
  MenuItem(
    title: 'Item 8',
    icon: Icons.settings,
    colors: Colors.green[100],
    route: '/saldo',
  ),
  // tambahkan item lainnya
];
