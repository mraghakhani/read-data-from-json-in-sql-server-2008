declare @jsons nvarchar(max)

set @jsons=N'[{"genCode":"294001174110500008000010239719","payTime":"1399/03/20 05:27:26","rowNum":5,"warrantyType":"عادی","trxType":1,"rows":[{"amount":1000425,"code":"110401"},{"amount":1082092,"code":"100019"},{"amount":31442,"code":"1104011"},{"amount":10004,"code":"110405"},{"amount":530225,"code":"100018"}],"bankKeyTransaction":"CBI20889504011399032005:27:26","status":"تسویه"},{"genCode":"234001174110500008000010241078","payTime":"1399/03/20 05:27:26","rowNum":5,"warrantyType":"عادی","trxType":1,"rows":[{"amount":1637059,"code":"110401"},{"amount":1770696,"code":"100019"},{"amount":51450,"code":"1104011"},{"amount":16371,"code":"110405"},{"amount":867641,"code":"100018"}],"bankKeyTransaction":"CBI20889504401399032005:27:26","status":"تسویه"},{"genCode":"261001174110500008000010213490","payTime":"1399/03/20 05:27:27","rowNum":5,"warrantyType":"عادی","trxType":1,"rows":[{"amount":3145982,"code":"110401"},{"amount":3402797,"code":"100019"},{"amount":98874,"code":"1104011"},{"amount":31460,"code":"110405"},{"amount":1667371,"code":"100018"}],"bankKeyTransaction":"CBI20889506141399032005:27:27","status":"تسویه"},{"genCode":"257001174110500008000010234008","payTime":"1399/03/20 05:27:27","rowNum":5,"warrantyType":"عادی","trxType":1,"rows":[{"amount":2518324,"code":"100019"},{"amount":2328261,"code":"110401"},{"amount":73174,"code":"1104011"},{"amount":23283,"code":"110405"},{"amount":1233979,"code":"100018"}],"bankKeyTransaction":"CBI20889505641399032005:27:27","status":"تسویه"},{"genCode":"280001174110500008000010240834","payTime":"1399/03/20 05:27:29","rowNum":5,"warrantyType":"عادی","trxType":1,"rows":[{"amount":5410462,"code":"100019"},{"amount":5002125,"code":"110401"},{"amount":157209,"code":"1104011"},{"amount":50021,"code":"110405"},{"amount":2651126,"code":"100018"}],"bankKeyTransaction":"CBI20889507581399032005:27:29","status":"تسویه"},{"genCode":"244001174110500008000010231121","payTime":"1399/03/20 05:27:30","rowNum":5,"warrantyType":"عادی","trxType":1,"rows":[{"amount":2328261,"code":"110401"},{"amount":2518324,"code":"100019"},{"amount":73174,"code":"1104011"},{"amount":23283,"code":"110405"},{"amount":1233979,"code":"100018"}],"bankKeyTransaction":"CBI20889509301399032005:27:30","status":"تسویه"},'
-----------main variables------------
declare @Shenase varchar(30)
declare @Date varchar (10)
declare @Time varchar (10)
declare @RowNum int
declare @warrantytype nvarchar(20) 
declare @TrxType varchar(10)
declare @BankKeyTransaction nvarchar(100)
declare @Status nvarchar(20)
declare @RowValueandCode table(	RowCode int	,	RowValue nvarchar(20)	)
--------variables for main loop--------
declare @gencodeindex int =0
declare @firstGencode int =-1

declare @datetimeindex int =0
declare @RowNumindex int =0
declare @warrantytypeindex int =0
declare @TrxTypeindex int =0
declare @BankKeyTransactionindex int =0
declare @Statusindex int =0
declare @amountindex int=0
declare @codeindex int =0
  
  set @firstGencode=CHARINDEX('"genCode":"', @jsons) + LEN('"genCode":"')
		
--while(1>0)
--begin 
-------the break statement---------------
--	if(CHARINDEX('"genCode":"', @jsons,@gencodeindex)+ LEN('"genCode":"')<@firstGencode )
--	begin 
--	break
--	end
--	set @Shenase= (select  SUBSTRING(
--        @jsons
--        ,CHARINDEX('"genCode":"', @jsons,@gencodeindex) + LEN('"genCode":"')
--        ,CHARINDEX('"', @jsons, CHARINDEX('"genCode":"',@jsons) + LEN('"genCode":"'))
--		- CHARINDEX('"genCode":"', @jsons) - LEN('"genCode":"')
--    ))
--		set @RowNum= (select cast((select SUBSTRING(
--        @jsons
--        ,CHARINDEX('"rowNum":', @jsons,@RowNumindex) + LEN('"rowNum":')
--        ,CHARINDEX(',', @jsons, CHARINDEX('"rowNum":',@jsons,@RowNumindex) + LEN('"rowNum":'))
--		- CHARINDEX('"rowNum":', @jsons,@RowNumindex) - LEN('"rowNum":') 
--    ))as int))

--	set @gencodeindex=CHARINDEX('"genCode":"', @jsons,@gencodeindex) + LEN('"genCode":"')--13--420--11
--		print @Shenase
--	print @gencodeindex
--	declare @i int=0
--  	while(@RowNum>@i)
--	begin
--	--if(CHARINDEX('"amount":', @jsons,0) + LEN('"amount":')<@gencodeindex)
--	--begin 
--	--break
--	--end
--	insert into @RowValueandCode (RowValue,RowCode) values(
--	(select  SUBSTRING(
--        @jsons
--        ,CHARINDEX('"amount":', @jsons,@amountindex) + LEN('"amount":')
--        ,CHARINDEX(',', @jsons, CHARINDEX('"amount":',@jsons,@amountindex)) 
--		-CHARINDEX('"amount":', @jsons,@amountindex) - LEN('"amount":')
--    ))
--	,
--	(select  SUBSTRING(
--        @jsons
--        ,CHARINDEX('"code":"', @jsons,@codeindex) + LEN('"code":"')
--        ,CHARINDEX('"', @jsons, CHARINDEX('"code":"',@jsons,@codeindex) + LEN('"code":"'))
--		- CHARINDEX('"code":"', @jsons,@codeindex) - LEN('"code":"')
--    )))
--	set @amountindex=CHARINDEX('"amount":', @jsons,@amountindex) + LEN('"amount":')
--	set @codeindex=CHARINDEX('"code":"', @jsons,@codeindex) + LEN('"code":"')
--	set @i=@i+1
--	end
--	select * from  @RowValueandCode

--	delete 
--	from @RowValueandCode
--	set @RowNumindex=CHARINDEX('"rowNum":', @jsons,@RowNumindex) + LEN('"rowNum":')

--end



while(LEN(@jsons)>0)
begin
	if(CHARINDEX('"genCode":"', @jsons,@gencodeindex) + LEN('"genCode":"')<@firstGencode)
	begin 
	break
	end
	set @Shenase= (select  SUBSTRING(
        @jsons
        ,CHARINDEX('"genCode":"', @jsons,@gencodeindex) + LEN('"genCode":"')
        ,CHARINDEX('"', @jsons, CHARINDEX('"genCode":"',@jsons) + LEN('"genCode":"'))
		- CHARINDEX('"genCode":"', @jsons) - LEN('"genCode":"')
    ))

	set @Date=(select LEFT( SUBSTRING(
        @jsons
        ,CHARINDEX('"payTime":"', @jsons,@datetimeindex) + LEN('"payTime":"')
        ,CHARINDEX('"', @jsons, CHARINDEX('"payTime":"',@jsons) + LEN('"payTime":"')) 
		- CHARINDEX('"payTime":"', @jsons) - LEN('"payTime":"')
    ),10))


	set @Time=(select RIGHT( SUBSTRING(
        @jsons
        ,CHARINDEX('"payTime":"', @jsons,@datetimeindex) + LEN('"payTime":"')
        ,CHARINDEX('"', @jsons, CHARINDEX('"payTime":"',@jsons) + LEN('"payTime":"'))
		- CHARINDEX('"payTime":"', @jsons) - LEN('"payTime":"')
    ),8))

	set @RowNum= (select cast((select SUBSTRING(
        @jsons
        ,CHARINDEX('"rowNum":', @jsons,@RowNumindex) + LEN('"rowNum":')
        ,CHARINDEX(',', @jsons, CHARINDEX('"rowNum":',@jsons) + LEN('"rowNum":'))
		- CHARINDEX('"rowNum":', @jsons) - LEN('"rowNum":') 
    ))as int))
	set @warrantytype=(select (select  SUBSTRING(
        @jsons
        ,CHARINDEX('"warrantyType":"', @jsons,@warrantytypeindex) + LEN('"warrantyType":"')
        ,CHARINDEX('"', @jsons, CHARINDEX('"warrantyType":"',@jsons) + LEN('"warrantyType":"')) 
		- CHARINDEX('"warrantyType":"', @jsons) - LEN('"warrantyType":"')
    )))
	set @TrxType=(select  SUBSTRING(
        @jsons
        ,CHARINDEX('"trxType":', @jsons,@TrxTypeindex) + LEN('"trxType":')
        ,CHARINDEX(',', @jsons, CHARINDEX('"trxType":',@jsons) + LEN('"trxType":')) 
		- CHARINDEX('"trxType":', @jsons) - LEN('"trxType":')
    ))
	
	set @BankKeyTransaction=(select  SUBSTRING(
        @jsons
        ,CHARINDEX('"bankKeyTransaction":"', @jsons,@BankKeyTransactionindex) + LEN('"bankKeyTransaction":"')
        ,CHARINDEX('"', @jsons, CHARINDEX('"bankKeyTransaction":"',@jsons) + LEN('"bankKeyTransaction":"'))
		- CHARINDEX('"bankKeyTransaction":"', @jsons) - LEN('"bankKeyTransaction":"')
    ))
	set @Status=( select  SUBSTRING(
        @jsons
        ,CHARINDEX('"status":"', @jsons,@Statusindex) + LEN('"status":"')
        ,CHARINDEX('"', @jsons, CHARINDEX('"status":"',@jsons) + LEN('"status":"'))
		- CHARINDEX('"status":"', @jsons) - LEN('"status":"')
    ))

	set @gencodeindex=CHARINDEX('"genCode":"', @jsons) + LEN('"genCode":"')

	declare @i int =0
	while(@RowNum>@i)
	begin
	--if(CHARINDEX('"amount":', @jsons,0) + LEN('"amount":')<@gencodeindex)
	--begin 
	--break
	--end
	insert into @RowValueandCode (RowValue,RowCode) values(
	(select  SUBSTRING(
        @jsons
        ,CHARINDEX('"amount":', @jsons,@amountindex) + LEN('"amount":')
        ,CHARINDEX(',', @jsons, CHARINDEX('"amount":',@jsons,@amountindex)) 
		-CHARINDEX('"amount":', @jsons,@amountindex) - LEN('"amount":')
    ))
	,
	(select  SUBSTRING(
        @jsons
        ,CHARINDEX('"code":"', @jsons,@codeindex) + LEN('"code":"')
        ,CHARINDEX('"', @jsons, CHARINDEX('"code":"',@jsons,@codeindex) + LEN('"code":"'))
		- CHARINDEX('"code":"', @jsons,@codeindex) - LEN('"code":"')
    )))
	set @amountindex=CHARINDEX('"amount":', @jsons,@amountindex) + LEN('"amount":')
	set @codeindex=CHARINDEX('"code":"', @jsons,@codeindex) + LEN('"code":"')
	set @i=@i+1
	end
	select * from  @RowValueandCode

	
	
	set @gencodeindex=CHARINDEX('"payTime":"', @jsons,@datetimeindex) + LEN('"payTime":"')
	set @RowNumindex=CHARINDEX('"rowNum":', @jsons,@RowNumindex) + LEN('"rowNum":')
	set @warrantytypeindex=CHARINDEX('"warrantyType":"', @jsons,@warrantytypeindex) + LEN('"warrantyType":"')
	set @TrxTypeindex=CHARINDEX('"trxType":', @jsons,@TrxTypeindex) + LEN('"trxType":')
	set @BankKeyTransactionindex=CHARINDEX('"bankKeyTransaction":"', @jsons,@BankKeyTransactionindex)
	+ LEN('"bankKeyTransaction":"')
	set @Statusindex=CHARINDEX('"status":"', @jsons,@Statusindex) + LEN('"status":"')
	insert into ACCJornalFromService 
	(Shenase,Date,Time,RowNum,warrantytype,TrxType,BankKeyTransaction,Status
	,RowCode1,RowValue1,RowCode2,RowValue2--,RowCode3,RowValue3,RowCode4,RowValue4,RowCode5,RowValue5
	--,RowCode6,RowValue6,RowCode7,RowValue7,RowCode8,RowValue8,RowCode9,RowValue9,RowCode10,RowValue10,
	--RowCode11,RowValue11,RowCode12,RowValue12,RowCode13,RowValue13,RowCode14,RowValue14,RowCode15,RowValue15,
	--RowCode16,RowValue16,RowCode17,RowValue17,RowCode18,RowValue18,RowCode19,RowValue19,RowCode20,RowValue20,
	--RowCode21,RowValue21,RowCode22,RowValue22,RowCode23,RowValue23,RowCode24,RowValue24,RowCode25,RowValue25,
	--RowCode26,RowValue26,RowCode27,RowValue27,RowCode28,RowValue28,RowCode29,RowValue29,RowCode30,RowValue30,
	--RowCode31,RowValue31,RowCode32,RowValue32,RowCode33,RowValue33,RowCode34,RowValue34,RowCode35,RowValue35,
	--RowCode36,RowValue36,RowCode37,RowValue37,RowCode38,RowValue38,RowCode39,RowValue39,RowCode40,RowValue40,
	--RowCode41,RowValue41,RowCode42,RowValue42,RowCode43,RowValue43,RowCode44,RowValue44,RowCode45,RowValue45,
	--RowCode46,RowValue46,RowCode47,RowValue47,RowCode48,RowValue48,RowCode49,RowValue49,RowCode50,RowValue50,
	)values
	(
	@Shenase,@Date,@Time,@RowNum,@warrantytype,@TrxType,@BankKeyTransaction,@Status,(select RowCode from @RowValueandCode),
	(select RowValue from @RowValueandCode),(select RowCode from @RowValueandCode),(select RowValue from @RowValueandCode)
	)
	delete 
	from @RowValueandCode
	
end
--Row_number(order by )