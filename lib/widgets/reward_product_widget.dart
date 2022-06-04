import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kozarni_ecome/controller/home_controller.dart';
import 'package:kozarni_ecome/model/product.dart';

import '../data/constant.dart';

class RewardProductWidget extends StatelessWidget {
  final Product product;
  const RewardProductWidget({ Key? key,required this.product }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController _homeController = Get.find();
        return ConstrainedBox(
                constraints: BoxConstraints(),
                child:Card(
                 elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: product.photo1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: CachedNetworkImage(
                            imageUrl: product.photo1,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                product.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 5,
                                right: 5,
                                bottom: 10,
                                top: 2,
                              ),
                              child: Text(
                                 "${product.price} Kyats",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            //BUTTOM
                             Padding(
                                     padding: const EdgeInsets.only(top: 5),
                                     child: Obx(() {
                                       return Align(
                                         alignment: Alignment.bottomCenter,
                                         child: ElevatedButton(
                                           style: ElevatedButton.styleFrom(
                                               primary: Colors.white,
                                               shape: RoundedRectangleBorder(
                                                   borderRadius:
                                                       BorderRadius.all(
                                                           Radius.circular(20)),
                                                   side: BorderSide(
                                                     color: (_homeController
                                                                 .currentUser
                                                                 .value ==
                                                             null)
                                                         ? Colors.black
                                                         : homeIndicatorColor,
                                                   ))),
                                           onPressed: () {
                                             if (_homeController
                                                     .currentUser.value ==
                                                 null) {
                                                // _homeController
                                                //     .signInWithGoogle(homeScreen);
                                             } else {
                                               debugPrint(
                                                   "*****Add to cart reward product**");

                                                // _homeController.addToRewardCart(
                                                //     item, i);
                                             }
                                           },
                                           child: (_homeController
                                                       .currentUser.value ==
                                                   null)
                                               ? Text("sign in to access",
                                                   style: TextStyle(
                                                     color: Colors.black,
                                                   ))
                                               : const SizedBox()
                                         ),
                                       );
                                     }),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
  }
}