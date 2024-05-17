namespace sap.ui.riskmanagement;
using { managed } from '@sap/cds/common';

entity Risks : managed {
    key ID      : UUID  @(Core.Computed : true);
    title       : String(100);
    prio        : String(5);
    descr       : String;
    miti        : Association to Mitigations;
    impact      : Integer;
    criticality : Integer;
    supplier    : Association to Suppliers;
}


  entity Mitigations : managed {
    key ID       : UUID  @(Core.Computed : true);
    description  : String;
    owner        : String;
    timeline     : String;
    risks        : Association to many Risks on risks.miti = $self;
  }

using {  API_BUSINESS_PARTNER_0001 as bupa } from '../srv/external/API_BUSINESS_PARTNER_0001';

    entity Suppliers as projection on bupa.A_BusinessPartner {
        key BusinessPartner as ID,
        BusinessPartnerFullName as fullName,
        BusinessPartnerIsBlocked as isBlocked,
}

using {  API_BUSINESS_PARTNER_0002 as bupa2 } from '../srv/external/API_BUSINESS_PARTNER_0002';

    entity Suppliers2 as projection on bupa2.A_BusinessPartner {
        key BusinessPartner as ID,
        BusinessPartnerFullName as fullName,
        BusinessPartnerIsBlocked as isBlocked,
}