// import * as AIHelper from './helper/ai-helper.js';
// import * as DBUtils from './helper/db-utils.js';
// import * as cds from '@sap/cds';

const AIHelper = require('./helper/ai-helper.js');
const cds = require('@sap/cds');
// const AIHelper = require('./helper/ai-helper.js');
// const LOG = cds.log('service');
module.exports = cds.service.impl(async function () {
    const messaging = await cds.connect.to('messaging');
    const Fo = await cds.connect.to('CE_FREIGHTORDER_0001');
    // const db = await cds.connect.to('db');
    this.on('suggestBestRoute', 'SrvFreightOrder', async (req) => {

        const orderUUID = req.params[0].TransportationOrderUUID;
        const { FreightOrder } = Fo.entities;
        try {
            const freightOrder = await Fo.run(SELECT.one.from(FreightOrder, fo => {
                fo('TransportationOrderUUID'), fo._FrtOrdMainBPAddrDfltRprstn(addresses => {
                    addresses('*')
                }), fo._FreightOrderItem(items => {
                    items.TransportationOrderItemUUID,
                        items.TranspOrdItem,
                        items.TranspOrdItemType,
                        items.TranspOrdItemQuantity,
                        items.TranspOrdItemQuantityUnit,
                        items.TranspOrdItemGrossWeight,
                        items.TranspOrdItemGrossWeightUnit,
                        items.TranspOrdItemGrossVolume,
                        items.TranspOrdItemGrossVolumeUnit,
                        items.TranspOrdItemNetWeight,
                        items.TranspOrdItemNetWeightUnit
                })
            })
                // .columns('TransportationOrderUUID', 'TransportationOrder', 'TransportationOrderType', 'TransportationOrderCategory', 'TransportationShippingType', 'TransportationMode', 'TransportationModeCategory', 'CarrierUUID', 'Carrier', 'StandardCarrierAlphaCode', 'TranspOrdExecutingCarrierUUID', 'TranspOrdExecutingCarrier', 'ShipperUUID', 'Shipper', 'ShipperAddressID', 'ConsigneeUUID', 'Consignee', 'ConsigneeAddressID', 'TranspPurgOrg', 'TranspPurgOrgExtID', 'TranspPurgGroup', 'TranspPurgGroupExtID', 'PurgOrgCompanyCode', 'CarrierAccountNumber', 'TranspMeansOfTransport', 'TranspOrdPartnerReference', 'TranspOrdResponsiblePerson', 'TranspOrdHasMltplExectgPties', 'TranspOrdInvoicingCarrierLevel', 'TranspOrdLifeCycleStatus', 'TranspOrderSubcontrgSts', 'TransportationOrderConfSts', 'TransportationOrderExecSts', 'TranspOrdGoodsMovementStatus', 'TranspOrdWhseProcessingStatus', 'TranspOrderDngrsGdsSts', 'TranspOrdExecutionIsBlocked', 'TransportationOrderCrtnType', 'CreatedByUser')
                .where({ TransportationOrderUUID: orderUUID })).catch(err => {
                    console.log(err)
                });
            let shipItems = freightOrder._FreightOrderItem;
            shipItems = shipItems.filter(item => item.TranspOrdItemType != '');

            const addressList = freightOrder._FrtOrdMainBPAddrDfltRprstn;

            const shipfromAddress = addressList.filter(bp => bp.TranspOrdBizPartnerFunction === 'U6');

            const shipToAddress = addressList.filter(bp => bp.TranspOrdBizPartnerFunction === 'WE');

            let shipInfo = {};
            shipInfo.ShipItems = shipItems;
            shipInfo.ShipFromAddress = shipfromAddress.length > 0 ? shipfromAddress[0] : {};
            shipInfo.ShipToAddress = shipToAddress.length > 0 ? shipToAddress[0] : {};

            console.log('Ship Info:');
            console.log(shipInfo);
            const aiSuggestion = await AIHelper.suggestBestRoute(JSON.stringify(shipInfo));
            return aiSuggestion;
        } catch (err) {
            console.log(err);
            return err.message;
        }

        return 'Best route suggestion logic is not implemented yet.';


    });


    this.on('suggestBestRoute', 'SrvFreightOrderItem', async (req) => {

        console.log(req.params[0].TransportationOrderItemUUID);

        const { SrvFreightOrder, SrvFreightOrderItem } = this.entities;
        const { FreightOrder, FreightOrderStage } = Fo.entities;
        try {
            const itemUUID = req.params[0].TransportationOrderItemUUID;
            const item = await SELECT.one.from(SrvFreightOrderItem).where({ TransportationOrderItemUUID: itemUUID });
            console.log(typeof (item));
            console.log(item);
            const orderUUID = item.TransportationOrderUUID;
            const order = await SELECT.one.from(SrvFreightOrder).where({ TransportationOrderUUID: orderUUID });
            console.log(order);




        } catch (err) {
            console.log(err);
        }

        return 'Best route suggestion logic is not implemented yet.';


    });

    messaging.on('ce/sap/s4/beh/FreightOrder/Created/v1', async (msg) => {

        console.log("logic triggered");
        console.log(msg);

        const { TransportationOrderUUID, TransportationOrder, TransportationOrderType, TransportationMode, TransportationShippingType, Carrier, TranspPurgOrgExtID } = msg.data;

        console.log(TransportationOrderUUID);

        const { FreightOrder, FreightOrderItem } = Fo.entities;

        const { SrvFreightOrder, SrvFreightOrderItem } = this.entities;
        try {
            const freightOrder = await Fo.run(SELECT.from(FreightOrder)
                .columns('TransportationOrderUUID', 'TransportationOrder', 'TransportationOrderType', 'TransportationOrderCategory', 'TransportationShippingType', 'TransportationMode', 'TransportationModeCategory', 'CarrierUUID', 'Carrier', 'StandardCarrierAlphaCode', 'TranspOrdExecutingCarrierUUID', 'TranspOrdExecutingCarrier', 'ShipperUUID', 'Shipper', 'ShipperAddressID', 'ConsigneeUUID', 'Consignee', 'ConsigneeAddressID', 'TranspPurgOrg', 'TranspPurgOrgExtID', 'TranspPurgGroup', 'TranspPurgGroupExtID', 'PurgOrgCompanyCode', 'CarrierAccountNumber', 'TranspMeansOfTransport', 'TranspOrdPartnerReference', 'TranspOrdResponsiblePerson', 'TranspOrdHasMltplExectgPties', 'TranspOrdInvoicingCarrierLevel', 'TranspOrdLifeCycleStatus', 'TranspOrderSubcontrgSts', 'TransportationOrderConfSts', 'TransportationOrderExecSts', 'TranspOrdGoodsMovementStatus', 'TranspOrdWhseProcessingStatus', 'TranspOrderDngrsGdsSts', 'TranspOrdExecutionIsBlocked', 'TransportationOrderCrtnType', 'CreatedByUser')
                .where({ TransportationOrderUUID: TransportationOrderUUID })).catch(err => {
                    console.log(err)
                });
            const freightOrderItems = await Fo.run(SELECT.from(FreightOrderItem)
                .where({ TransportationOrderUUID: TransportationOrderUUID })).catch(err => {
                    console.log(err);
                });
            const items = Array.isArray(freightOrderItems) ? freightOrderItems : [freightOrderItems];
            const headers = Array.isArray(freightOrder) ? freightOrder : [freightOrder];
            await INSERT.into(SrvFreightOrder).entries(headers);
            await INSERT.into(SrvFreightOrderItem).entries(items);
        } catch (err) {
            console.log(err);
        }


    });
})