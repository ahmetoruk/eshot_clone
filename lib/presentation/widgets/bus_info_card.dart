import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eshot_clone/blocs/route_info_cubit.dart';

class BusInfoCard extends StatelessWidget {
  const BusInfoCard(
      {Key? key,
      required this.routeId,
      required this.direction,
      this.onPressed,
      this.onTap})
      : super(key: key);

  final int routeId;
  final int direction;
  final Function()? onPressed;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final routeInfo =
        context.read<RouteInfoCubit>().state.routes.findById(routeId);
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.red.shade700,
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Text(
            routeId.toString(),
            style: const TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        title: routeInfo == null
            ? const Text("Yükleniyor...")
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(direction == 1
                      ? "${routeInfo.routeStart} - ${routeInfo.routeEnd}"
                      : "${routeInfo.routeEnd} - ${routeInfo.routeStart}"),
                  Text(direction == 1
                      ? routeInfo.workHoursStart
                      : routeInfo.workHoursEnd)
                ],
              ),
        trailing: onPressed != null
            ? IconButton(
                icon: const Icon(
                  Icons.compare_arrows_outlined,
                  size: 30,
                ),
                onPressed: onPressed,
              )
            : null,
      ),
    );
  }
}
