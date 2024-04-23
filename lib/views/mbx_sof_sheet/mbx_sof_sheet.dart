import '../../widgets/all_widgets.dart';
import 'mbx_sof_sheet_controller.dart';
import 'mbx_sof_widget.dart';

// ignore: must_be_immutable
class MbxSofSheet extends GetWidget<MbxSofSheetController> {
  MbxSofSheet();

  static Future<T?> show<T>(
      {required String title,
      required String description,
      required Function(String code) onSubmit,
      required Future<void> Function() onResend}) {
    FocusManager.instance.primaryFocus?.unfocus();
    final sheet = MbxSofSheet();
    return SheetX.showFloating(
      widget: sheet,
      title: 'Sumber Dana',
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxSofSheetController>(
        init: MbxSofSheetController(),
        builder: (controller) => ContainerX(
            backgroundColor: ColorX.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    physics: ClampingScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return ContainerX(height: 12.0);
                    },
                    itemCount: controller.accounts.length,
                    itemBuilder: (context, index) {
                      return MbxSofWidget(
                        account: controller.accounts[index],
                        borders: true,
                        onEyeClicked: () {
                          controller.btnEyeClicked(index);
                        },
                        onClicked: () {
                          Get.back(result: controller.accounts[index]);
                        },
                      );
                    }),
                SizedBox(height: 12.0),
                ContainerX(
                    padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    child: ButtonX(
                        title: 'Batal',
                        backgroundColor: ColorX.theme,
                        onClicked: () {
                          Get.back();
                        })),
              ],
            )));
  }
}
