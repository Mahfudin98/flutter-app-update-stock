import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:update_stock_app/controllers/logstic_controller.dart';
import 'package:update_stock_app/style/constants.dart';

class LogisticPage extends StatefulWidget {
  const LogisticPage({Key? key}) : super(key: key);

  @override
  State<LogisticPage> createState() => _LogisticPageState();
}

class _LogisticPageState extends State<LogisticPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: const Color.fromARGB(77, 231, 231, 231),
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const HeaderLogistic(),
            const ListLogistic(),
          ],
        ),
      ),
    );
  }
}

class ListLogistic extends StatelessWidget {
  const ListLogistic({
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
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                logistic.dataLogistic[i].nama_barang,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(logistic.dataLogistic[i].category_name),
                                  const SizedBox(width: 10),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 3,
                                      horizontal: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: kPrimaryColor,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          logistic
                                              .dataLogistic[i].stock_logistic,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          logistic.dataLogistic[i].satuan,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.amber,
                            ),
                            child: TextButton(
                              onPressed: () {},
                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
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
}

class HeaderLogistic extends StatelessWidget {
  const HeaderLogistic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Text(
          "List Logistic",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Icon(
          Icons.search,
          color: Colors.grey,
          size: 25,
        ),
        // Container(
        //   padding: const EdgeInsets.symmetric(
        //     vertical: 3,
        //     horizontal: 10,
        //   ),
        //   width: size.width * 0.5,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10),
        //     color: kPrimaryColor.withAlpha(50),
        //   ),
        //   child: const TextField(
        //     cursorColor: Colors.grey,
        //     decoration: InputDecoration(
        //       icon: Icon(
        //         Icons.search,
        //         color: Colors.grey,
        //         size: 25,
        //       ),
        //       hintText: "Cari Produk",
        //       hintStyle: TextStyle(fontSize: 14),
        //       border: InputBorder.none,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
