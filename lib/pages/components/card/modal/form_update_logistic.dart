import 'package:flutter/material.dart';

class FormUpdateLogistic extends StatelessWidget {
  const FormUpdateLogistic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              autofocus: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Masukan Stok Baru",
                hintStyle: TextStyle(color: Colors.green[900]),
                icon: Icon(
                  Icons.app_registration_rounded,
                  color: Colors.green[900],
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
            child: TextButton(
              onPressed: () {},
              child: const Icon(
                Icons.save,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
