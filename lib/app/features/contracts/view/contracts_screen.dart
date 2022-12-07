import 'package:flutter/material.dart';
import 'package:marlo_task/app/constants/color_const.dart';
import 'package:marlo_task/app/constants/space_box.dart';
import 'package:marlo_task/app/utilities/text_style_widget.dart';

class ContractsScreen extends StatelessWidget {
  const ContractsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          title: const TextStyleWidget(
            text: "Teams",
            textSize: 50,
          ),
          actions: [
            Icon(
              Icons.search,
              color: grey,
              size: 40,
            )
          ],
        ),
        body: Column(
          children: [
            k40Height,
            const HeadingWidgets(
              head: "All People - 3",
            ),
            ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 30),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                          color: darkBlue,
                          borderRadius: BorderRadius.circular(10)),
                      height: 50,
                      width: 50,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        TextStyleWidget(text: "Krishnan Sounder"),
                        TextStyleWidget(text: "Admin")
                      ],
                    ),
                    subtitle: const TextStyleWidget(text: "Active"),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return stdHeightBox;
              },
              itemCount: 2,
            ),
            stdHeightBox,
            const HeadingWidgets(
              head: "Invited People - 1",
            ),
            ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 30),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                          color: darkCream,
                          borderRadius: BorderRadius.circular(10)),
                      height: 50,
                      width: 50,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        TextStyleWidget(text: "Krishnan Sounder"),
                      ],
                    ),
                    subtitle: const TextStyleWidget(text: "Active"),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: 1,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: skyBlue,
          elevation: 0,
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class HeadingWidgets extends StatelessWidget {
  const HeadingWidgets({Key? key, required this.head}) : super(key: key);
  final String head;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextStyleWidget(
          text: head,
          textSize: 18,
          textColor: grey,
          textWidth: FontWeight.w500,
        ),
        TextStyleWidget(
          text: "See All",
          textSize: 18,
          textColor: lightBlue,
          textWidth: FontWeight.w500,
        )
      ],
    );
  }
}
