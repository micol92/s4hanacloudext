const cds = require('@sap/cds');
module.exports = cds.service.impl(async function (srv) {

    const { SalesOrder, Create_Order } = this.entities;

    // connects to the remote service
    const order = await cds.connect.to('API_SALES_ORDER_SRV');

    // Handle GET call
    srv.on('READ', 'SalesOrder', async req => {

    const order = await cds.connect.to('API_SALES_ORDER_SRV');
        return order.run(req.query);
        
    });

    // Handle POST call
    srv.on('Create_Order', async(req) => {

        // Extract the Sales Order payload from the request data
        const OrderData = req.data.Order;

        // Map the POST request on remote service
        const SalesOrderResponse = await order.run(INSERT.into('SalesOrderService.SalesOrder', [OrderData]));
        
        // Return the response
        return SalesOrderResponse;
    });


});