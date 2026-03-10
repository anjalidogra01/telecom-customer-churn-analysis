CREATE VIEW	vw_ChurData as
 Select * from prod_churn where Customer_Status IN ('Churned','Stayed')

CREATE VIEW	vw_JoinData as
 Select * from prod_churn where Customer_Status IN ('Joined')

