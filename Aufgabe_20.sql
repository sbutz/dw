DROP DIMENSION Customer_Dim;

CREATE DIMENSION Customer_Dim
    LEVEL Place     IS DCustomer.Place
    LEVEL State     IS DCustomer.State
    LEVEL Country   IS DCustomer.Country
    
    HIERARCHY Place_rollup
        (Place CHILD OF State CHILD OF Country)
    ;
    
    
DROP DIMENSION Product_Dim;

CREATE DIMENSION Product_Dim
    LEVEL ArtId     IS DProduct.ArtId
    LEVEL ProdgrId  IS DProduct.ProdgrId

    HIERARCHY Prodgr_rollup
        (ArtId CHILD OF ProdgrId)
    
    ATTRIBUTE ArtID DETERMINES (Name, Color, Price)
    ATTRIBUTE ProdgrId DETERMINES (Prodgroup)
    ;