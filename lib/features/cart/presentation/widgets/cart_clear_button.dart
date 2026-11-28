import 'package:bootx_app/features/cart/presentation/controller/cart_bloc.dart';
import 'package:bootx_app/features/cart/presentation/controller/cart_event.dart';
import 'package:bootx_app/features/cart/presentation/widgets/clear_cart_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartClearButton extends StatelessWidget {
  const CartClearButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (dialogContext) => ClearCartDialog(
            onConfirm: () {
              context.read<CartBloc>().add(ClearCartEvent());
            },
          ),
        );
      },
      icon: const Icon(Icons.delete_sweep_outlined, color: Color(0xFFF87265)),
      style: IconButton.styleFrom(
        backgroundColor: Colors.white,
        fixedSize: const Size(44, 44),
      ),
    );
  }
}
