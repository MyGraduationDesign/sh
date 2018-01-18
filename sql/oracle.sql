--查看回收站的当前状态  果返回值为“on”表明回收站是启动的，“off”表明是关闭的
SELECT Value FROM V$parameter WHERE Name = 'recyclebin';

--启动或者关闭回收站里的每个会话（session）和系统（system）
ALTER SYSTEM SET recyclebin = ON;      
ALTER SESSION SET recyclebin = ON;      
ALTER SYSTEM SET recyclebin = OFF;
ALTER SESSION SET recyclebin = OFF;

--获取回收站里的内容  
SELECT * FROM RECYCLEBIN;      
SELECT * FROM USER_RECYCLEBIN;      
SELECT * FROM DBA_RECYCLEBIN; 

--还原被删除的对象
FLASHBACK TABLE <<Dropped_Table_Name>> TO BEFORE DROP RENAME TO <<New_Table_Name>>;

--清空回收站
PURGE TABLE <<Table_NAME>>; --清空一个特定的表
PURGE INDEX <<Index_NAME>>; --清空一个特定的索引
PURGE TABLESPACE<<Table_NAME>>; --清空与该表空间有关联的对象
PURGE TABLESPACE<<Table_NAME>> USER <<User_Name>>; --清空一个特定用户的表空间对象
PURGE RECYCLEBIN; --清空回收站
DROP TABLE <<Table_Name>> PURGE;--当一个表被删除（drop）时就直接从回收站中清空
  
