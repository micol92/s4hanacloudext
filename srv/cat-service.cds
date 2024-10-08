using my.bookshop as my from '../db/data-model';

service CatalogService {
    @readonly entity Books as projection on my.Books;
}

using { sap.ui.riskmanagement as my2 } from '../db/schema';

@path: 'service/risk'
service RiskService  @(requires: 'authenticated-user'){
  entity Risks as projection on my2.Risks;
    annotate Risks with @odata.draft.enabled;
  entity Mitigations as projection on my2.Mitigations;
    annotate Mitigations with @odata.draft.enabled;

    @readonly
    entity Suppliers as projection on my2.Suppliers;    

    @readonly
    entity Suppliers2 as projection on my2.Suppliers2;    

    @readonly
    entity ExtSvrBooks as projection on my2.Books;

    //@readonly
    //entity Suppliers @(restrict : [
    //          {
    //              grant : [ 'READ' ],
    //              to : [ 'RiskViewer', 'RiskManager' ]
    //          }
    //      ]) as projection on my2.Suppliers;

}