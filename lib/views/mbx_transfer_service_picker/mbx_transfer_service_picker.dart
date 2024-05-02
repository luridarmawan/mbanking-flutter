import '../../models/mbx_transfer_p2bank_service_model.dart';
import '../../widgets/all_widgets.dart';
import 'mbx_transfer_service_picker_controller.dart';
import 'mbx_transfer_service_widget.dart';

// ignore: must_be_immutable
class MbxTransferServicePicker
    extends GetWidget<MbxTransferServicePickerController> {
  final List<MbxTransferP2BankServiceModel> list;
  MbxTransferServicePicker(this.list);

  static Future<T?> show<T>(List<MbxTransferP2BankServiceModel> list) {
    FocusManager.instance.primaryFocus?.unfocus();
    final sheet = MbxTransferServicePicker(list);
    return SheetX.showCustom(
      widget: sheet,
      title: 'Layanan Transfer',
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxTransferServicePickerController>(
        init: MbxTransferServicePickerController(list),
        builder: (controller) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    physics: ClampingScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return ContainerX(height: 8.0);
                    },
                    itemCount: controller.list.length,
                    itemBuilder: (context, index) {
                      return MbxTransferServiceWidget(
                        service: controller.list[index],
                        borders: true,
                        onEyeClicked: () {},
                        onClicked: () {
                          Get.back(result: controller.list[index]);
                        },
                      );
                    }),
                ContainerX(height: 16.0),
                ContainerX(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ButtonX(
                        title: 'Batal',
                        backgroundColor: ColorX.theme,
                        onClicked: () {
                          Get.back();
                        })),
                ContainerX(height: 16.0),
              ],
            ));
  }
}
