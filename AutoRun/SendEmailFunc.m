function SendEmailFunc
% clc; close all; clear;
%% 给自己发没问题
myaddress = 'lifewwy@163.com';%这个地方你要输入自己的邮箱，我举个例子而已！但是你这个邮箱必须是开启了smpt服务的！
mypassword = 'wangxichen75';%输入该邮箱的密码！如果用163邮箱，那么代码中填写的密码不是原始密码，而是“客户端授权码”
setpref('Internet','E_mail',myaddress);
setpref('Internet','SMTP_Server','smtp.163.com');%这个地方你最好搞清楚，因为如果是163邮箱，这地方就是smpt.163.com，但是！！你的这个邮箱必须开启了smpt服务
setpref('Internet','SMTP_Username',myaddress);
setpref('Internet','SMTP_Password',mypassword);

props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', ...
                  'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');
% subject = '明天的日程';
% content = '明天早晨9点集合';
subject = '数据维护与策略加载';
content = '';

diary off;
sendmail('lifewwy@163.com', subject,content ,...
    {get(0,'DiaryFile')});



end






