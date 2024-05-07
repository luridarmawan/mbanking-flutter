import '../../models/mbx_qris_inquiry_model.dart';
import '../../widgets/all_widgets.dart';
import '../mbx_sof_sheet/mbx_sof_widget.dart';
import 'mbx_qris_amount_controller.dart';

class MbxQRISAmountScreen extends StatelessWidget {
  final MbxQRISInquiryModel inquiry;
  MbxQRISAmountScreen({required this.inquiry});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxQRISAmountController>(
        init: MbxQRISAmountController(inquiry: inquiry),
        builder: (controller) => MbxScreen(
                scrollingBody: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  TextX(
                    'PEMBAYARAN KEPADA',
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    color: ColorX.black,
                  ),
                  ContainerX(height: 4.0),
                  ContainerX(
                      width: double.infinity,
                      backgroundColor: ColorX.theme,
                      borderWidth: 1.0,
                      borderColor: ColorX.lightGray,
                      cornerRadius: 12.0,
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          TextX(
                            inquiry.merchant_name,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.center,
                            color: ColorX.white,
                            maxLines: 8,
                          ),
                          TextX(
                            inquiry.merchant_code,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.center,
                            color: ColorX.white,
                            maxLines: 8,
                          ),
                        ],
                      )),
                  ContainerX(height: 12.0),
                  ContainerX(
                    backgroundColor: ColorX.theme.withOpacity(0.1),
                    width: double.infinity,
                    cornerRadius: 8.0,
                    padding: EdgeInsets.all(
                      12.0,
                    ),
                    child: Column(children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextX(
                              'Pengakuisisi',
                              color: ColorX.black,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.start,
                              maxLines: 8,
                            ),
                          ),
                          ContainerX(width: 24.0),
                          Expanded(
                              child: TextX(
                            inquiry.acquirer,
                            color: ColorX.black,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.end,
                            maxLines: 8,
                          )),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextX(
                              'Merchant PAN',
                              color: ColorX.black,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.start,
                              maxLines: 8,
                            ),
                          ),
                          ContainerX(width: 24.0),
                          Expanded(
                              child: TextX(
                            inquiry.mpan,
                            color: ColorX.black,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.end,
                            maxLines: 8,
                          )),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextX(
                              'No. Referensi',
                              color: ColorX.black,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.start,
                              maxLines: 8,
                            ),
                          ),
                          ContainerX(width: 24.0),
                          Expanded(
                              child: TextX(
                            inquiry.ref,
                            color: ColorX.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.end,
                            maxLines: 8,
                          )),
                        ],
                      ),
                    ]),
                  ),
                  ContainerX(height: 12.0),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextX(
                          'JUMLAH',
                          color: ColorX.black,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                        ),
                        ContainerX(height: 4.0),
                        TextFieldX(
                          hint: 'Nominal transfer',
                          obscureText: false,
                          keyboardType: TextInputType.number,
                          readOnly: false,
                          controller: controller.txtAmountController,
                          focusNode: controller.txtAmountNode,
                          onChanged: (value) {
                            controller.txtAmountChanged(value);
                          },
                        ),
                      ]),
                  ContainerX(height: 12.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextX(
                        'SUMBER DANA',
                        color: ColorX.black,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.start,
                      ),
                      ContainerX(height: 4.0),
                      ContainerX(
                          width: double.infinity,
                          padding: EdgeInsets.only(
                              left: 12.0, top: 8.0, right: 12.0, bottom: 8.0),
                          borderWidth: 1.0,
                          borderColor: ColorX.lightGray,
                          cornerRadius: 8.0,
                          child: Row(children: [
                            Expanded(
                              child: MbxSofWidget(
                                account: controller.sof,
                                borders: false,
                                onEyeClicked: () {
                                  controller.btnSofEyeClicked();
                                },
                              ),
                            ),
                            ContainerX(width: 8.0),
                            ButtonX(
                                faIcon: FontAwesomeIcons.chevronDown,
                                backgroundColor: ColorX.transparent,
                                faWidth: 16.0,
                                faHeight: 16.0,
                                width: 40.0,
                                height: 40.0,
                                borderWidth: 0.5,
                                borderColor: ColorX.gray,
                                onClicked: () {
                                  controller.btnSofClicked();
                                })
                          ])),
                    ],
                  ),
                  ContainerX(
                    backgroundColor: ColorX.white,
                    padding: EdgeInsets.only(
                        left: 16.0,
                        top: 16.0,
                        right: 16.0,
                        bottom:
                            16.0 + MediaQuery.of(Get.context!).padding.bottom),
                    child: ButtonX(
                      title: 'Lanjut',
                      backgroundColor: ColorX.theme,
                      disabledBackgroundColor: ColorX.theme.withOpacity(0.2),
                      enabled: controller.amount > 0,
                      onClicked: () {
                        controller.btnNextClicked();
                      },
                    ),
                  ),
                ])));
  }
}
