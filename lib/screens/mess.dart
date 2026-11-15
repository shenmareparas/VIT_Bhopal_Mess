import 'package:material_ui/material_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';
import 'package:vit_bhopal_mess/provider/mess_provider.dart';

class Mess extends StatelessWidget {
  const Mess({super.key});

  @override
  Widget build(BuildContext context) {
    final messProvider = Provider.of<MessProvider>(context);
    final currentMealItems = messProvider.currentMealItems;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: RefreshIndicator(
          edgeOffset: 150,
          onRefresh: () async {
            messProvider.resetToCurrentDateTime();
          },
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext dialogContext) {
                            return AlertDialog(
                              title: const Text(
                                'Select Day',
                                textAlign: TextAlign.center,
                              ),
                              content: SizedBox(
                                width: double.maxFinite,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: MessProvider.days.length,
                                  itemBuilder: (context, index) {
                                    final day = MessProvider.days[index];
                                    return InkWell(
                                      borderRadius: BorderRadius.circular(15),
                                      onTap: () {
                                        messProvider.setDate(day);
                                        Navigator.of(dialogContext).pop();
                                      },
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Text(
                                            day,
                                            style: const TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        side: const BorderSide(
                          width: 2,
                          color: Color(0xFFD0EE82),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        messProvider.formattedDate,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext dialogContext) {
                            return AlertDialog(
                              title: const Text(
                                'Select Meal Time',
                                textAlign: TextAlign.center,
                              ),
                              content: SizedBox(
                                width: double.maxFinite,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: MessProvider.mealTypes.length,
                                  itemBuilder: (context, index) {
                                    final mealType =
                                        MessProvider.mealTypes[index];
                                    final mealDesc =
                                        MessProvider.mealDescriptions[index];
                                    return InkWell(
                                      borderRadius: BorderRadius.circular(15),
                                      onTap: () {
                                        messProvider.setMealTime(mealType);
                                        Navigator.of(dialogContext).pop();
                                      },
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Text(
                                            mealDesc,
                                            style: const TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        side: const BorderSide(
                          width: 2,
                          color: Color(0xFFD0EE82),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        messProvider.mealTime,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: currentMealItems.length,
                          itemBuilder: (BuildContext context, int index) {
                            return FadeInUp(
                              duration: const Duration(milliseconds: 300),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentMealItems[index],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: FloatingActionButton(
                  elevation: 5,
                  onPressed: () => messProvider.resetToCurrentDateTime(),
                  tooltip: 'Reset',
                  child: const FaIcon(FontAwesomeIcons.rotateRight),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
