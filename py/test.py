#!/usr/bin/python
#coding=utf-8
import commands 
import sys
import os
import time
#指定的目录必须存在
tomcat_home='/root/tomcat-7-elephant_cust/'
webapp_name='elephant_cust'
backup_home='/root/backups/'
source_home='/root/elephant_cust/'

#关闭tomcat
def shutdown():
    print "准备关闭tomcat......"
    status,output=commands.getstatusoutput('ps -ef|grep -i '+tomcat_home+'|wc -l')
    if(int(output)>2): #判断是否有tomcat进程
        print "    开始关闭tomcat"
        status,output=commands.getstatusoutput(tomcat_home+'bin/shutdown.sh') 
        if(status!=0):
            print output 
            sys.exit(1)
        time.sleep(0.5) #关闭程序缓存时间
        status,output=commands.getstatusoutput('ps -ef|grep -i '+tomcat_home+'|wc -l')
        if(int(output)>2): #判断是否关闭成功
            print "    强制关闭tomcat"
            status,output=commands.getstatusoutput('kill -9 `ps -ef|grep -i '+tomcat_home+' |awk \'NR==1{print $2}\'`')
            if(status!=0):
                print output 
                sys.exit(1)
        print "    已关闭tomcat"
        return 0 
    print "    tomcat未启动"
	
#备份之前的版本
def backup():
    print "开始备份......"
    nowdate=time.strftime('%Y%m%d',time.localtime())
    #判断今日备份目录是否存在，不存在则创建
    if(not os.path.exists(backup_home+'/'+webapp_name+'/'+nowdate)):
        status,output=commands.getstatusoutput('mkdir -p '+backup_home+'/'+webapp_name+'/'+nowdate)  
        if(status!=0):
            print output 
            sys.exit(1)
    #删除今天前一次的备份数据
    status,output=commands.getstatusoutput('rm -rf '+backup_home+'/'+webapp_name+'/'+nowdate+'/*')
    if(status!=0):
        print output 
        sys.exit(1)
    #备份当前版本，备份前先判断目录是否是空的
    if(len(os.listdir(tomcat_home+'webapps/'))>0):
        status,output=commands.getstatusoutput('mv '+tomcat_home+'webapps/* '+backup_home+'/'+webapp_name+'/'+nowdate)
        if(status!=0):
            print output 
            sys.exit(1)
    print '    备份成功' 

#部署新程序
def deploy():
    print "开始部署....."
    #重命名由Jenkins上传的war包名
    status,output=commands.getstatusoutput('mv '+source_home+'*.war '+source_home+webapp_name+'.war') 
    if(status!=0):
        print output 
        sys.exit(1)
    #部署新war包到tomcat里
    status,output=commands.getstatusoutput('mv '+source_home+webapp_name+'.war '+tomcat_home+'webapps/') 
    if(status!=0):
        print output 
        sys.exit(1)
    #启动tomcat
    status,output=commands.getstatusoutput(tomcat_home+'bin/startup.sh') 
    print output