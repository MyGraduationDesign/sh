# oracle生产常用sql
```
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
  
  
--锁表查询
SELECT object_name, machine, s.sid, s.serial#
  FROM gv$locked_object l, dba_objects o, gv$session s
 WHERE l.object_id　 = o.object_id
   AND l.session_id = s.sid;
--验证
SELECT 'ALTER system kill session ''' ||s.sid||','||s.serial#||''''
  FROM gv$locked_object l, dba_objects o, gv$session s
 WHERE l.object_id　 = o.object_id
   AND l.session_id = s.sid;
--杀掉
ALTER system kill session '4055,34642';

--存储过程终止
--0.查询正在执行的存储过程
select *
  from v$db_object_cache
 where locks > 0
   and pins > 0
   and type = 'PROCEDURE';
--1. 在V$ACCESS视图中找到要停止进程的SID: 
SELECT t.* FROM V$ACCESS t WHERE t.object='LXG_TOWERIDERR'; 
SELECT SID FROM V$ACCESS WHERE  object='LXG_TOWERIDERR';
--2. 在V$SESSION视图中查找到查出SID和SERIAL#
SELECT SID,SERIAL# FROM V$SESSION WHERE SID='1314';  
--3. 杀掉查找出来的进程
--alter system kill session 'SID,SERIAL#'
alter system kill session '1314,63759';  
```
