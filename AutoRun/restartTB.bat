
@echo off
tasklist /fi "imagename eq TradeBlazer.exe" |find "TradeBlazer.exe" > nul
if errorlevel 0 (
	taskkill /f /t /im "TradeBlazer.exe" 
	ping 127.0.0.1 -n 10 > nul % 等一段时间 %
)

tasklist /fi "imagename eq TBDatabase.exe" |find "TBDatabase.exe" > nul
if errorlevel 0 (
	taskkill /f /t /im "TBDatabase.exe" 
	ping 127.0.0.1 -n 10 > nul % 等一段时间 %
)

tasklist /fi "imagename eq TBDdataCenter.exe" |find "TBDdataCenter.exe" > nul
if errorlevel 0 (
	taskkill /f /t /im "TBDdataCenter.exe" 
	ping 127.0.0.1 -n 10 > nul % 等一段时间 %
)

cd C:\D\xyz\future\TBSoftware\tbv5543_x64_portable
start "" "TradeBlazer.exe"


:: 1
:: 当年的DOS，所有操作都用键盘命令来完成，
:: 当你每次都要输入相同的命令时，
:: 可以把这么多命令存为一个批处理，
:: 从此以后，只要运行这个批处理，
:: 就相当于打了几行、几十行命令。
:: DOS在运行批处理时，
:: 会依次执行批处理中的每条命令，
:: 并且会在显示器上显示，
:: 如果你不想让它们显示，
:: 可以加一个“echo off”
:: 当然，“echo off”也是命令，
:: 它本身也会显示，
:: 如果连这条也不显示，
:: 就在前面加个“@”。

:: dos中经常会看到  .bat(批处理)文件的开头都会有 @echo off 这个命令
:: echo off 表示在批处理文件执行过程中，只显示结果，而不显示执行的命令。

:: 2
:: 可以在 CMD 窗口中逐条执行

:: 3
:: /fi 筛选符合条件的进程(filter)
:: "imagename eq MATLAB.exe" 表示映像名称为 matlab.exe

:: 4
:: 管道符 | ，就是让前一命令的输出当做后一命令的输入,就是说前面命令的结果当做一个参数传递给后面命令处理

:: 5
:: 重定向符 > 
:: dos命令是用户敲入命令，计算机执行，然后返回。无论其结果是否有错，都有所返回，返回计算结果或者错误信息。——默认情况是这样。
:: dos命令是可以控制输出方的，可以把结果输出到屏幕（控制台），也可以把结果输出到文件。
:: 控制输出到哪里就需要一个dos的重定向符，“>”或者“>>”。（其实还有输入定向的，如“<”。）
:: 我们平时敲命令，默认定向是控制台。例如dir命令，其实实际运行了“dir >con”。
:: 当我们希望把文件列表到文件，就可以把重定向转到文件，可以“dir >list.txt”，但若原来存在list.txt则会覆盖。
:: 若list.txt本来已经有内容，希望把dir到的结果追加到文件，可以“dir >>list.txt”。
:: “nul”是空的意思。把执行结果定向到空，意思便是不返回任何结果，无论它是错是对。
:: 这样做对于批处理里面的命令有一个好处，就是在运行的时候你看不到它逐条运行的结果。
::（当然，逐条运行的命令符还是会看到的，除非开始就用echo off命令或者@命令。）

:: 6
:: errorlevel 与 %errorlevel%
:: 他们都是判断上个命令的返回值。
:: 当使用 if errorlevel 值 cmmand 句式时，它的含义是：如果返回的错误码值大于或等于值 的时候，将执行cmmand操作；
:: 当使用 if %errorlevel%==值 cmmand 句式时，它含义是：如果返回的错误码值等于值的时候，将执行cmmand操作。
:: 一般上一条命令的执行结果返回的值只有两个，"成功"用0 表示 "失败"用 1 表示，实际上，errorlevel 返回值可以在0~255 之间，
:: 例如xcopy 默认的errorlevel 值就有5 个，分别表示5 种执行状态：
:: 											0 复制文件成功 
:: 											1 未找到复制文件 
:: 											2 用户通过CTRL C 终止了xcopy操作 
:: 											4 出现了初始化错误  
:: 											5 出现了磁盘写入错误
:: if %ERRORLEVEL% 全部的比较参数如下：
:: 			EQU - 等于
:: 			NEQ - 不等于
:: 			LSS - 小于
:: 			LEQ - 小于或等于
:: 			GTR - 大于
:: 			GEQ - 大于或等于
:: 比如：IF %ERRORLEVEL% LEQ 1 goto okay
























