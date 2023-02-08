import 'package:flutter/material.dart';
import 'package:update_stock_app/controllers/logstic_controller.dart';
import 'package:update_stock_app/pages/components/card/modal/form_update_logistic.dart';
import 'package:update_stock_app/pages/components/card/modal/modal_card_logistic.dart';

// ignore: non_constant_identifier_names
PersistentBottomSheetController<void> ModalLogistic(
    BuildContext context, LogisticController logistic, int i) {
  return showBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.amber,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ModalCardLogistic(
                nama_barang: logistic.dataLogistic[i].nama_barang,
                stock_logistic: logistic.dataLogistic[i].stock_logistic,
                satuan: logistic.dataLogistic[i].satuan,
              ),
              FormUpdateLogistic(
                id: logistic.dataLogistic[i].id,
                stockLogistic: logistic.dataLogistic[i].stock_logistic,
              ),
            ],
          ),
        ),
      );
    },
  );
}
