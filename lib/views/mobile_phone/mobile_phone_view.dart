import 'package:compasia/config/app_colors.dart';
import 'package:compasia/router/app_route.dart';
import 'package:compasia/services/auth_service.dart';
import 'package:compasia/widgets/no_data_found.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import '../../view_models/mobile_phone_view_model.dart';
import '../../widgets/loading_indicator.dart';
import 'components/mobile_phone_card.dart';

class MobilePhoneView extends StatefulWidget {
  const MobilePhoneView({
    Key? key,
  }) : super(key: key);

  @override
  _MobilePhoneViewState createState() => _MobilePhoneViewState();
}

class _MobilePhoneViewState extends State<MobilePhoneView> {
  bool _connection = true;

  Future connectionChecker() async {
    _connection = await InternetConnectionChecker().hasConnection;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      MobilePhoneViewModel viewModel =
          Provider.of<MobilePhoneViewModel>(context, listen: false);
      viewModel.setInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MobilePhoneViewModel>(builder: (context, viewModel, child) {
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: viewModel.isSubmitting
            ? const Stack(
                children: [
                  Center(
                    child: LoadingIndicator(
                      isBox: true,
                    ),
                  ),
                ],
              )
            : null,
        appBar: AppBar(
          title: const Text('Mobile Phone List'),
          leading: IconButton(
              onPressed: () {
                AuthService().logout();
              },
              icon: const Icon(Icons.exit_to_app)),
          actions: [
            IconButton(
                onPressed: () {
                  AppRoute.toMobilePhoneEditorView(context: context);
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: FutureBuilder(
            future: viewModel.connectionChecker(),
            builder: (context, snapshot) {
              if (viewModel.connection == true) {
                return buildList(viewModel);
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        color: AppColors.blue,
                        size: 23,
                      ),
                      Text(
                        '   No Internet Connection',
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColors.blue,
                            fontFamily: 'PantonBoldItalic'),
                      ),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    IconButton(
                      onPressed: () => setState(() {}),
                      icon: const Icon(
                        Icons.replay_circle_filled,
                        color: AppColors.blue,
                      ),
                      iconSize: 53,
                    )
                  ],
                );
              }
            }),
      );
    });
  }

  Widget buildList(MobilePhoneViewModel viewModel) {
    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
            onRefresh: () => viewModel.onRefresh(),
            child: ListView.builder(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                controller: viewModel.scrollController,
                itemCount: viewModel.mobilePhones.length + 1,
                itemBuilder: (context, index) {
                  if (index < viewModel.mobilePhones.length) {
                    return SwipeActionCell(
                      controller: viewModel.swipeActionController,
                      key: ValueKey(viewModel.mobilePhones[index]),
                      trailingActions: [
                        SwipeAction(
                            color: Colors.transparent,
                            widthSpace: 60,
                            content: _getIconButton(Colors.red, Icons.delete),
                            onTap: (handler) async {
                              viewModel.swipeActionController
                                  .closeAllOpenCell();
                              viewModel.onRemove(index);
                            }),
                        SwipeAction(
                            performsFirstActionWithFullSwipe: true,
                            widthSpace: 60,
                            content: _getIconButton(Colors.grey, Icons.edit),
                            color: Colors.transparent,
                            onTap: (handler) async {
                              viewModel.swipeActionController
                                  .closeAllOpenCell();
                              await AppRoute.toMobilePhoneEditorView(
                                context: context,
                                mobilePhone: viewModel.mobilePhones[index],
                              );
                            }),
                      ],
                      child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: MobilePhoneCard(
                            mobilePhone: viewModel.mobilePhones[index],
                          )),
                    );
                  } else if (viewModel.hasMore) {
                    return const Center(child: LoadingIndicator());
                  } else if (viewModel.mobilePhones.isNotEmpty) {
                    return Center(
                        child: SafeArea(
                      top: false,
                      child: Text(
                          (viewModel.mobilePhones.length <= viewModel.limit)
                              ? ""
                              : "---- No More Data ----"),
                    ));
                  } else {
                    return const Center(
                      child: NoDataFound(),
                    );
                  }
                }),
          ),
        ),
      ],
    );
  }

  Widget _getIconButton(color, icon) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: color,
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
