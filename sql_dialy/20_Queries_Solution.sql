/*Cau1 a)*/
select TEN_T_TP, DS 
from[dbo].[TINH_TP]
where (DT>=5000);
/*Cau2 a) */
select TEN_T_TP, DT 
from TINH_TP
where (MIEN = N'Trung');
/*Cau3 */
select TEN_T_TP
from TINH_TP b
join BIENGIOI a on  a.MA_T_TP = b.MA_T_TP
where (MIEN = 'Trung');
/*Cau4 */
Select sum(DT)/count(TEN_T_TP) as DTB
from TINH_TP;
/*Cau5 */
select DS, TEN_T_TP 
from TINH_TP
where (DT >7000);
/*Cau6 */
select DS, TEN_T_TP
from TINH_TP
where (MIEN = N'Bắc');
/*Cau7 */
select NUOC
from BIENGIOI a
join TINH_TP b on b.MA_T_TP = a.MA_T_TP
where (MIEN = 'Nam');
/*Cau8 */
SELECT AVG(ttp.DT) AS [Diện tích trung bình]
FROM TINH_TP ttp;
/*Cau9 */
select DT/DS as MDDS,TEN_T_TP
from TINH_TP
/*Cau 10 */
select TEN_T_TP
from TINH_TP a
join LANGGIENG b on b.MA_T_TP= a.MA_T_TP
where (LG = 'LA');
/*Cau 11 */
select TEN_T_TP 
from TINH_TP a
join BIENGIOI b on b.MA_T_TP = a.MA_T_TP
where (NUOC = 'CPC');
/*Cau 12 */
select TOP 10 TEN_T_TP
from TINH_TP
order by DT DESC;
/*Cau 13 */
select TOP 1 TEN_T_TP
from TINH_TP
order by (DS/DT) DESC;
/*Cau 14 */
select TEN_T_TP
from TINH_TP a
join BIENGIOI b on b.MA_T_TP = a.MA_T_TP
group by a.MA_T_TP, a.TEN_T_TP
HAVING COUNT (b.MA_T_TP) = 2;
/*Cau 15 */
select MIEN,TEN_T_TP
from TINH_TP
order by MIEN ASC;
/*Cau 16 */
select top 10 TEN_T_TP
from TINH_TP a
join LANGGIENG b on b.MA_T_TP = a.MA_T_TP
group by a.MA_T_TP, a.TEN_T_TP
order by count(b.LG) DESC; 
/*Cau 17 */
SELECT *
FROM TINH_TP ttp
WHERE ttp.DT < (
SELECT AVG(ttp.DT) AS [Diện tích trung bình]
FROM TINH_TP ttp
);
/*Cau 18*/
SELECT TEN_T_TP
	FROM TINH_TP
	WHERE MIEN!='Nam' AND MA_T_TP IN (
		SELECT LANGGIENG.LG 
		FROM TINH_TP, LANGGIENG
		WHERE TINH_TP.MA_T_TP=LANGGIENG.MA_T_TP AND MIEN='Nam'
	);
/*Cau 19*/
select a.MA_T_TP , a.LG , b.DT 'T1'  , c.DT  'LG'
from LANGGIENG a
join  TINH_TP  b  on a.MA_T_TP = b.MA_T_TP
join  TINH_TP c on a.LG = c.MA_T_TP
where b.DT > c.DT
/*Cau 20*/
select a.MA_T_TP 'DD1',
a.LG 'DD2', b.LG 'DD3', c.LG 'DD4'
from LANGGIENG a
join  LANGGIENG  b on a.LG = b.MA_T_TP
join  LANGGIENG  c on b.LG = c.MA_T_TP
where a.MA_T_TP =  'HCM'  and a.MA_T_TP   != c.LG  and 
b.LG != c.LG and a.LG != c.LG and a.LG != b.LG and a.MA_T_TP != b.LG
