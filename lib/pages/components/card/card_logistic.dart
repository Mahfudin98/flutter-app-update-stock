import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:update_stock_app/controllers/logstic_controller.dart';
import 'package:update_stock_app/pages/components/card/list_logistic.dart';

class CardLogistic extends StatelessWidget {
  const CardLogistic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: RefreshIndicator(
        onRefresh: () => Provider.of<LogisticController>(context, listen: false)
            .getDataLogistic(),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          width: size.width,
          height: size.height * 0.7,
          child: FutureBuilder(
            future: Provider.of<LogisticController>(context, listen: false)
                .getDataLogistic(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              return Consumer<LogisticController>(
                  builder: (context, logistic, _) {
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  itemCount: logistic.dataLogistic.length,
                  itemBuilder: (context, i) {
                    return ListLogistic(
                      nama_barang: logistic.dataLogistic[i].nama_barang,
                      category_name: logistic.dataLogistic[i].category_name,
                      stock_logistic: logistic.dataLogistic[i].stock_logistic,
                      satuan: logistic.dataLogistic[i].satuan,
                      onPress: () {
                        ShowModal(context);
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 10),
                );
              });
            },
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  PersistentBottomSheetController<void> ShowModal(BuildContext context) {
    return showBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            // height: size.height * 0.8,
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
            child: Text("data"),
          ),
        );
      },
    );
  }
}
