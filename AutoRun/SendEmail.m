clc; close all; clear;
%% ���Լ���û����
myaddress = 'lifewwy@163.com';%����ط���Ҫ�����Լ������䣬�Ҿٸ����Ӷ��ѣ������������������ǿ�����smpt����ģ�
mypassword = 'wangxichen75';%�������������룡�����163���䣬��ô��������д�����벻��ԭʼ���룬���ǡ��ͻ�����Ȩ�롱
setpref('Internet','E_mail',myaddress);
setpref('Internet','SMTP_Server','smtp.163.com');%����ط�����ø��������Ϊ�����163���䣬��ط�����smpt.163.com�����ǣ���������������뿪����smpt����
setpref('Internet','SMTP_Username',myaddress);
setpref('Internet','SMTP_Password',mypassword);

props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', ...
                  'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');
subject = '������ճ�';
content = '�����糿9�㼯��';
sendmail('lifewwy@163.com', subject,content ,...
    {'C:\D\future\AutoRun\SendEmail.m','C:\D\future\AutoRun\SendEmail.m'});








