sap.ui.define([
    "sap/m/MessageToast"
], function (MessageToast) {
    'use strict';

    return {
        suggestRoute: function (oEvent) {

            const bindingContext = this.getBindingContext();
            const oAction = this.getModel().bindContext("freightorder.suggestBestRoute(...)", bindingContext);
            oAction.execute().then(() => {
                const oActionContext = oAction.getBoundContext();
                const oActionObjectList = oActionContext.getObject().value;
                console.log(oActionObjectList[0]);
                console.log(oActionObjectList[1]);

                // handle the result of the action
            }).catch(error => {
                console.log(error)
                // handle any errors that occurred during execution
            });

            MessageToast.show("Custom handler invoked.");
        }
    };
});
