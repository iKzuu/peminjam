import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
      //   appBar: AppBar(
      //   title: const Text('RegisterView'),
      //   centerTitle: true,
      // ),
      body: Container(
        // padding: EdgeInsets.only(bottom: 100.0),
        color: Colors.lightBlue,
        child: Center(
            child: Form(
              key: controller.formKey,
              child: Container(
                width: 335.0,
                child: Column(
                  children: [
                    const SizedBox(height: 50.0),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 200, // atur lebar sesuai kebutuhan
                        height: 200, // atur tinggi sesuai kebutuhan
                        child: Image.asset(
                          "assets/logo_now_lib.png",
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: controller.namaController,
                            decoration: defaultInputDecoration(
                                hintText: "Masukkan nama",
                                prefixIcon: Icons.perm_identity
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Nama tidak boleh kosong";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            controller: controller.usernameController,
                            decoration: defaultInputDecoration(
                                hintText: "Masukkan username",
                                prefixIcon: Icons.person
                            ),
                            validator: (value) {
                              if (value!.length <2) {
                                return "username tidak boleh kosong";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            controller: controller.telpController,
                            decoration: defaultInputDecoration(
                                hintText: "Masukkan no telp",
                                prefixIcon: Icons.phone
                            ),
                            validator: (value) {
                              if (value!.length <2) {
                                return "no telp tidak boleh kosong";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            controller: controller.alamatController,
                            decoration: defaultInputDecoration(
                                hintText: "Masukkan Alamat",
                                prefixIcon: Icons.pin
                            ),
                            validator: (value) {
                              if (value!.length <2) {
                                return "Alamat tidak boleh kosong";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            controller: controller.passwordController,
                            obscureText: true,
                            decoration: defaultInputDecoration(
                                hintText: "Masukkan password",
                                prefixIcon: Icons.lock_outline,
                            ),
                            validator: (value) {
                              if (value!.length <2) {
                                return "password tidak boleh kosong";
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 16.0),

                          Obx(() => controller.loading.value?
                          CircularProgressIndicator():
                          ElevatedButton(onPressed: () {
                            controller.register();
                          },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),// Ganti warna sesuai keinginan,
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(Size(100.0, 50.0)),
                              ),
                              child: const Text("Daftar")),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
  InputDecoration defaultInputDecoration({
    String hintText = '',
    IconData? prefixIcon,
    // double contentPaddingHorizontal = 12.0,
    // double contentPaddingVertical = 12.0,
  }) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.grey[200],
      hintText: hintText,
      prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      // contentPadding: EdgeInsets.symmetric(
      //   horizontal: contentPaddingHorizontal,
      //   vertical: contentPaddingVertical,
      // ),
    );
  }
}
