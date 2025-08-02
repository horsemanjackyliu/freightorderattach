
const cds = require('@sap/cds');
const LOG = cds.log('service');
module.exports = cds.service.impl(async function(){
    const messaging = await cds.connect.to('messaging');
    const Fo = await cds.connect.to('CE_FREIGHTORDER_0001');
    // const db = cds.connect.to('db');    

    messaging.on('ce/sap/s4/beh/FreightOrder/Created/v1',async (msg)=>{

        console.log("logic triggered");
        console.log(msg);

        const {TransportationOrderUUID,TransportationOrder,TransportationOrderType,TransportationMode,TransportationShippingType,Carrier,TranspPurgOrgExtID}=msg.data;

        console.log(TransportationOrderUUID);

        const {FreightOrder,FreightOrderItem } = Fo.entities;

        const {SrvFreightOrder,SrvFreightOrderItem} = this.entities;

        const freightOrder = await Fo.run(SELECT.from(FreightOrder)
        .columns('TransportationOrderUUID' ,'TransportationOrder','TransportationOrderType','TransportationOrderCategory','TransportationShippingType','TransportationMode','TransportationModeCategory','CarrierUUID','Carrier','StandardCarrierAlphaCode','TranspOrdExecutingCarrierUUID','TranspOrdExecutingCarrier','ShipperUUID','Shipper','ShipperAddressID','ConsigneeUUID','Consignee','ConsigneeAddressID','TranspPurgOrg','TranspPurgOrgExtID','TranspPurgGroup','TranspPurgGroupExtID','PurgOrgCompanyCode','CarrierAccountNumber','TranspMeansOfTransport','TranspOrdPartnerReference','TranspOrdResponsiblePerson','TranspOrdHasMltplExectgPties','TranspOrdInvoicingCarrierLevel','TranspOrdLifeCycleStatus','TranspOrderSubcontrgSts','TransportationOrderConfSts','TransportationOrderExecSts','TranspOrdGoodsMovementStatus','TranspOrdWhseProcessingStatus','TranspOrderDngrsGdsSts','TranspOrdExecutionIsBlocked','TransportationOrderCrtnType','CreatedByUser')
        .where({TransportationOrderUUID: TransportationOrderUUID})).catch(err=>{
            console.log(err)
        });
        const freightOrderItems = await Fo.run(SELECT.from(FreightOrderItem)
        .where({TransportationOrderUUID: TransportationOrderUUID})).catch(err=>{
            console.log(err);
        });
        const items = Array.isArray(freightOrderItems)?freightOrderItems:[freightOrderItems];
        const headers = Array.isArray(freightOrder)?freightOrder:[freightOrder];

        // console.log("freight order items");
        // console.log(headers);
        // console.log(items);

        await INSERT.into(SrvFreightOrder).entries(headers);
        await INSERT.into(SrvFreightOrderItem).entries(items);

    })
})