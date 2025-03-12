sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'freightorderattachui5/test/integration/FirstJourney',
		'freightorderattachui5/test/integration/pages/SrvFreightOrderList',
		'freightorderattachui5/test/integration/pages/SrvFreightOrderObjectPage',
		'freightorderattachui5/test/integration/pages/SrvFreightOrderItemObjectPage'
    ],
    function(JourneyRunner, opaJourney, SrvFreightOrderList, SrvFreightOrderObjectPage, SrvFreightOrderItemObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('freightorderattachui5') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheSrvFreightOrderList: SrvFreightOrderList,
					onTheSrvFreightOrderObjectPage: SrvFreightOrderObjectPage,
					onTheSrvFreightOrderItemObjectPage: SrvFreightOrderItemObjectPage
                }
            },
            opaJourney.run
        );
    }
);