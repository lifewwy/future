## 3GPP ##
http://www.3gpp.org/  

3GPP是个什么组织 为啥5G标准离不开它?  
时光飞逝，转眼到了2017年，从1998年成立以来，3GPP不断扩大、由成员驱动，涉及数百家公司的大量工作和协作，包括网络运营商、终端制造商、芯片制造商、基础设施制造商、学术界、研究机构、政府机构，累积到2017年会议参与者突破6000多人，好家伙，厉害了。  
http://news.mydrivers.com/1/562/562043.htm


## 接入网与核心网 ##
从3G演进到4G，接入网与核心网“整体演进”到4G时代。  
到了5G就不一样了，3GPP组织把接入网(5G NR)和核心网(5G Core)拆开了，要各自独立演进到5G时代。

4G的无线接入称为eLTE，5G基站的无线接入叫 **New Radio**，简称 **NR**。  
在5G的第一阶段，eLTE与NR将沿用和共用4G的核心网。然后网络慢慢演进，NR将接入到自己的核心网，这可能发生在5G的第二阶段。

## 5G的3大场景 ##
1. eMBB: 增强型移动宽带(6GHz以下及以上频段)
2. URLLC: 超可靠低时延通信(6GHz以下频段)，例如无人驾驶等业务。
3. mMTC: 大规模机器通信/大规模物联网(6GHz以下频段)

注意这3个术语，在未来通信中将广泛使用。

## 5G NR ##
3G基站叫NodeB(NB)    
4G基站叫eNB  (enhanced NB)

那5G基站叫什么？  
3GPP给它取了个名，gNB  

5G基站的无线接入叫 **New Radio**，简称 **NR**

5G NR的“自我介绍”
http://www.eefocus.com/communication/408007

## LDPC/Polar ##

不知道朋友们记不记得2017年11月下旬，华为公司主推的**Polar Code**（极化码）方案拿下5G，作为控制信道的编码方案，这个方案便是3PGG制定的三个场景之一的**eMBB**场景，而高通主导的**LDPC**码作为数据信道的编码方案。

根据华为的实际测试来看，Polar码可以同时满足超高速率、低时延、大连接场景的需求，并且能够使蜂窝网络的频谱提升10%左右，与毫米波结合可以达到27Gbps的速率。

对于eMBB场景来说，有了华为这位主力，外加高通的扶持，相信能够将无线通讯技术提升到新的高度。
  

## 4G移动通信网络体系架构 ##
UE (用户设备)  
E-UTRAN（接入网）  
EPC（核心网络）

----------

<div style="float:left;margin:20px;"><img src="https://i.imgur.com/R6We5EX.jpg"  width="" height="230" ></div><div style="float:left;margin:20px;"><img src="https://i.imgur.com/CeM6e4h.jpg"  width="" height="230" ></div><div style="float:left;border:margin:20px;"><img src="https://i.imgur.com/emCLEWe.png"  width="" height="230" ></div><div style="float:left;margin:20px;"><img src="https://i.imgur.com/q8TotHR.jpg"  width="" height="230" ></div>



----------


MME: Mobility Management Entity   
S-GW: Serving GateWay,服务网关  
P-GW: PDN GateWay,PDN 网关  
E-UTRAN: Evolved Universal Terrestrial Radio Access Network   
EPC: Evlved Packet Core 演进分组核心网  
RRC: Radio Resource Control 是指无线资源控制  
PDCP: Packet Data Convergence Protocol 分组数据汇聚协议  
RLC: Radio Link Control 无线链路控制层协议  
PHY: Physical Layer Protocol 物理层协议  

### 用户面和控制面 ###
https://blog.csdn.net/wowricky/article/details/6907715  
用户面走数据   
控制面走信令  

### eNodeB功能 ###
包括物理层功能(HARQ等),MAC,RRC,调度,无线接入控制，移动性管理。



### 网关 ###
大家都知道，从一个房间走到另一个房间，必然要经过一扇门。同样，从一个网络向另一个网络发送信息，也必须经过一道“关口”，这道关口就是网关。顾名思义，网关(Gateway)就是一个网络连接到另一个网络的“关口”。  

假设你的名字叫小不点(很小)，你住在一个大院子里，你的邻居有很多小伙伴，父母是你的**网关**。当你想跟院子里的某个小伙伴玩，只要你在院子里大喊一声他的名字，他听到了就会回应你，并且跑出来跟你玩。

但是你家长不允许你走出大门，你想与外界发生的一切联系，都必须由父母（网关）用电话帮助你联系。假如你想找你的同学小明聊天，小明家住在很远的另外一个院子里，他家里也有父母（小明的网关）。但是你不知道小明家的电话号码，不过你的班主任老师有一份你们班全体同学的名单和电话号码对照表，你的老师就是你的DNS服务器。于是你在家里和父母有了下面的对话：

小不点：妈妈(或爸爸),我想找班主任查一下小明的电话号码行吗？  
家长：好，你等着。（接着你家长给你的班主任挂了一个电话，问清楚了小明的电话）问到了，他家的号码是211.99.99.99
小不点：太好了！妈(或爸),我想找小明，你再帮我联系一下小明吧。  
家长：没问题。（接着家长向电话局发出了请求接通小明家电话的请求，最后一关当然是被转接到了小明家家长那里，然后他家长把电话给转到小明）

就这样你和小明取得了联系。

如果搞清了什么是网关，默认网关也就好理解了。就好像一个房间可以有多扇门一样，一台主机可以有多个网关。默认网关的意思是一台主机如果找不到可用的网关，就把数据包发给默认指定的网关，由这个网关来处理数据包。默认网关。默认网关一般填写192.168.x.1





## 重传机制 ##
**ARQ**和**HARQ **   
HARQ: 混合自动重传请求(Hybrid Automatic Repeat reQuest,HARQ)
https://www.jianshu.com/p/f8650640660b  

## BBU与RRU ##
RRU是Remote Radio Unit 远端射频模块，BBU是Building Baseband Unit 室内基带处理单元。  

基带BBU集中放置在机房，RRU可安装至楼层，BBU与RRU之间采用光纤传输，RRU再通过同轴电缆及功分器(耦合器)等连接至天线，即主干采用光纤，支路采用同轴电缆。  

对于下行方向：光纤从BBU直接连到RRU，BBU和RRU之间传输的是基带数字信号，这样基站可以控制某个用户的信号从指定的RRU通道发射出去，这样可以大大降低对本小区其他通道上用户的干扰。  
对于上行方向：用户手机信号被距离最近的通道收到，然后从这个通道经过光纤传到基站，这样也可以大大降低不同通道上用户之间的干扰。

## 有源天线与无源天线 ##
无源天线：它纯粹是一个金属体，是平常看到很普通的各种天线。  
有源天线：是在这普通的天线后加放大器，提高灵敏度，降低信噪比。  

使用GPS天线有源和无源的区别  
http://www.arsgps.com/changjianwenti/30-80.html


## QoS ##

## IP地址 ##
所谓IP地址就是给每个连接在Internet上的主机分配的一个**32bit**地址。按照TCP/IP协议规定，IP地址用二进制来表示，每个IP地址长32bit，比特换算成字节，就是**4个字节**。例如一个采用二进制形式的IP地址是“00001010000000000000000000000001”，这么长的地址，人们处理起来也太费劲了。为了方便人们的使用，IP地址经常被**写成十进制的形式**，中间使用符号“.”分开不同的字节。于是，上面的IP地址可以表示为“10.0.0.1”。IP地址的这种表示法叫做“**点分十进制表示法**”，这显然比1和0容易记忆得多。

每个IP地址都包含两部分:**网络ID和主机ID**。整个Internet上的每个计算机都依靠各自唯一的IP地址来标识。IP地址构成了整个Internet的基础，它是如此重要，每一台联网的计算机无权自行设定IP地址。  有一个统一的机构(IANA)负责对申请的组织分配唯一的网络ID。该申请组织可以对自己的网络中的每一个主机分配一个唯一的主机ID，正如一个单位无权决定自己在所属城市的街道名称和门牌号，但可以自主决定本单位内部的各个办公室编号一样。

根据网络ID和主机ID的不同位数规则，可以将IP地址分为A（7位网络ID和24位主机ID）、B（14位网络ID和16位主机ID）、C（21位网络ID和8位主机ID）三类，由于历史原因和技术发展的差异，A类地址和B类地址几乎分配殆尽，目前能够供全球各国各组织分配的只有C类地址。所以说IP地址是一种非常重要的网络资源。

将IP地址和**子网掩码**进行与运算即可得到网络ID与主机ID。

对于一个设立了因特网服务的组织机构，由于其主机对外开放了诸如WWW、FTP、E-mail等访问服务，通常要对外公布一个固定的IP地址，以方便用户访问。当然，数字IP不便记忆和识别，人们更习惯于通过域名来访问主机，而域名实际上仍然需要被**域名服务器（DNS）**翻译为IP地址。例如，你的主页地址是www.myhost.com ，用户可以方便地记忆和使用，而域名服务器会将这个域名翻译为101.12.123.234，这才是你在网上的真正地址。

对于大多数拨号上网的用户，由于其上网时间和空间的离散性，为每个用户分配一个固定的IP地址（静态IP）是非常不可取的，这将造成IP地址资源的极大浪费。因此这些用户通常会在每次拨通ISP的主机后，自动获得一个**动态的IP地址**，该地址当然不是任意的，而是该ISP申请的网络ID和主机ID的合法区间中的某个地址。拨号用户任意两次连接时的IP地址很可能不同，但是在每次连接时间内IP地址不变。

## 5G NR频谱 ##
http://www.eefocus.com/communication/408007/p3

<div style="float:right;margin:20px;"><img src="https://i.imgur.com/Am8IJL2.png"  width="" height="100" ></div>

在R15版本中，定义了两大FR（频率范围）：


----------

LTE 频段号以B开头，比如LTE的B20（Band 20）
5G NR频段号标识以 n 开头，5G NR中的第20号频段称为n20。

http://www.sharetechnote.com/html/5G/5G_FR_Bandwidth.html#Operating_Band

## FDD/TDD/SDL/SUL##

https://zhidao.baidu.com/question/91344791.html

1. TDD表示时分双工
2. FDD表示频分双工
3. SDL只能用于下行传输
4. SUL只能用于上行传输


1. Frequency Division Duplex Bands (FDD)
2. Time Division Duplex Bands (TDD)
3. Supplementary Bands: Supplementary Downlink  Bands (SDL) 
4. Supplementary Bands: Supplementary Uplink Bands (SUL)


## PAPR ##
https://baike.baidu.com/item/PAPR/5310514?fr=aladdin

峰值平均功率比（PAPR: Peak to Average Power Ratio），简称峰均比(PAPR)。  

MIMO-OFDM系统能够提供更大的覆盖范围、更好的传输质量、更高的数据速率和频谱效率。
  
然而，由于OFDM 符号是由多个独立经过调制的子载波信号叠加而成的，当各个**子载波相位相同或者相近时**，叠加信号便会受到相同初始相位信号的调制，从而产生较大的瞬时功率峰值，由此进一步带来较高的峰值平均功率比（PAPR: Peak to Average Power Ratio），简称峰均比(PAPR)。  

由于一般的**功率放大器的动态范围都是有限的**，所以峰均比较大的MIMO-OFDM信号极易进入功率**放大器的非线性区域**，导致信号产生非线性失真，造成明显的**频谱扩展干扰以及带内信号畸变**，导致整个系统性能严重下降。高峰均比已成为MIMO-OFDM 的一个主要技术阻碍。

## 载波聚合 ##
载波聚合（Carrier Aggregation，CA）就是在满足一定前提条件下，把零碎的LTE频段合成一个**“虚拟”**的更宽的频段，以提高数据速率。  

载波聚合可以使用连续的带宽和不连续的带宽，带宽灵活性很大。载波聚合中单个载波称为CC（component carrier），每个CC可以使用LTE R8规定的任何带宽 (1.4, 3, 5, 10, 15, 和 20 MHz)。


<center class="half">
    <img src="https://i.imgur.com/vq5GFCa.gif" height="200" style="margin-right:45px"><img src="https://i.imgur.com/cJJwSwI.jpg" height="200">
</center>

<center class="half">
    <img src="https://i.imgur.com/15WJx2P.gif" height="200" style="margin-right:45px"><img src="https://i.imgur.com/qDThSDo.png" height="200">
</center>

<center class="half">
    <img src="https://i.imgur.com/DU8iIR7.jpg" height="200" style="margin-right:45px"><img src="https://i.imgur.com/DVG2SNo.jpg" height="200"/>
</center>

<center class="half">
    <img src="https://i.imgur.com/ubjw34A.png" height="100" style="margin-right:25px"><img src="https://i.imgur.com/GFNhTuY.png" height="100" style="margin-right:25px"><img src="https://i.imgur.com/Iur0AB0.png" height="100"/>
</center>

## 5G-NR 的物理层 ##
http://www.eefocus.com/communication/408007/p4


### OFDM 符号时长与子载波个数 ###
1. OFDM 符号的时长取决于子载波的间隔和CP长度。
2. 子载波间隔一定时，子载波的个数多少取决于信道带宽，**子载波个数的多少并不影响OFDM符号的时长**。
3. 当信道带宽一定时，子载波间隔小，可以放更多的子载波，但是OFDM Symbol Duration变长了，数据传输速率不变。(不考虑CP及其他开销，调制方式相同，且子载波占满信道带宽)。

例如，
设OFDM Symbol Duration为1ms，则子载波间隔为1kHz，当信道带宽为10kHz时，可以放置10个子载波，如果调制为BPSK，则数据传输率为 10×1bit/1ms = 10kbps。如果子载波间隔变为0.5kHz，则能放置20个子载波，此时的数据传输率为 20×1bit/2ms = 10kbps。

可见，OFDM波形的最高传输速率为：




### Waveform 波形 ###
目前3GPP Release 15已确定，CP-OFDM支持5G NR的上行和下行，也引入了DFT-S-OFDM波形与CP-OFDM波形互补。CP-OFDM波形可用于单流和多流（即MIMO）传输，而DFT-S-OFDM波形只限于针对链路预算受限情况的单流传输。

**Waveform** (for eMBB/URLLC and < 52.6 GHz)
• DL Waveform: CP-OFDM
• UL Waveform: CP-OFDM + DFT-s-OFDM 
>CP-OFDM targeted at high throughput scenarios
DFT-s-OFDM targeted at power limited scenarios

[Understanding the 5G NR Physical Layer](https://www.keysight.com/upload/cmc_upload/All/Understanding_the_5G_NR_Physical_Layer.pdf#page=17)
(转成网页文件可打开链接)
(使用相对路径)

### Multiple Access 多址接入方案 ###

- Orthogonal Multiple Access
- Non-Orthogonal Multiple Access (NOMA) not supported in Rel-15


### 物理信道带宽 ###
http://www.eefocus.com/communication/408007/p5

在小于6GHz频段（FR1）下，5G NR的最大信道带宽为100MHz    
在毫米波频段（FR2），5G NR的最大信道带宽达400MHz，远远大于LTE的最大信道带宽20MHz。
 
但更值得一提的是，5G NR的带宽利用率大幅提升到97%以上（LTE的带宽利用率只有90%）。  
如何理解5G NR带宽利用率提升？

10MHz的4G信道有50个RB，每个RB有12个子载波，那么10MHz 4G信道总共600个子载波。由于每个子载波有15kHz的间隔，15*600就等于9000kHz或9MHz，这意味着在10Mhz的信道中，只有9MHz被利用，而大约1MHz被留下作为保护频带，所以LTE的带宽利用率只有90%。 以此类推，20MHz的4G信道有100个RB，它仅使用了20MHz带宽中的18MHz；50MHz的4G信道有250个RB...
 
猜猜看，50MHz的5G信道有多少个RB呢？275个。
(270×12×15e3)/50e6 = 99%  


### Numerology ###
Numerology 这个概念可翻译为参数集，大概意思指一套参数，包括子载波间隔，符号长度，CP长度等。
http://www.eefocus.com/communication/408007/p4

#### Scalable subcarrier spacing ####

子载波间隔是符号时间长度(Symbol Duration)与CP开销之间的权衡：子载波间隔越小，符号时间长度越长；子载波间隔越大，CP开销越大。

5G NR最基本的子载波间隔与LTE一样，也是15kHz，但可以灵活扩展

<center class="half">
    <img src="https://i.imgur.com/lA6fbgU.png" height="30" style="margin-left:80px">
</center>



<center class="half">
    <img src="https://i.imgur.com/GJYcC69.png" height="100" style="margin-left:80px">
</center>



[Understanding the 5G NR Physical Layer](https://www.keysight.com/upload/cmc_upload/All/Understanding_the_5G_NR_Physical_Layer.pdf#page=18)


#### TTI (Time Transmission Interval)   ####
参考高通公司的网页  
https://www.qualcomm.com/invention/technologies/5g-nr/unified-air-interface  
https://www.eetimes.com/document.asp?doc_id=1278199  

### 帧结构 ###
http://www.sharetechnote.com/html/5G/5G_FrameStructure.html
http://www.eefocus.com/communication/408007/p5

<div style="float:right;margin:20px;"><img src="https://i.imgur.com/uAU3gm6.jpg"  width="" height="220" ></div>

5G无线帧和子帧的长度都是固定的，一个无线帧的长度固定为10ms，1个子帧的长度固定为1ms。这与LTE是相同的，从而更好的保持LTE与NR间共存，利于LTE和NR共同部署模式下时隙与帧结构同步，简化小区搜索和频率测量。
 
不同的是，5G NR定义了灵活的子构架，时隙和字符长度可根据子载波间隔灵活定义。
 
所以，我们简单将5G帧结构划分为由固定结构和灵活结构两部分组成（如图）。 
 
这就好比建房子，框架结构定好了，里面的空间可根据自己需要灵活布置。


----------
<center class="half">
    <img src="https://i.imgur.com/Ajtmqfs.png" height="320">
</center>


[Understanding the 5G NR Physical Layer](https://www.keysight.com/upload/cmc_upload/All/Understanding_the_5G_NR_Physical_Layer.pdf#page=23)

### Resource Block ###
Resource Block (RB)
Physical Resource Blocks (PRB)
http://niviuk.free.fr/store_fiveg.php

#### LTE资源块基本概念 ####
- RE (Resource Element)：物理层资源的最小粒度。时域：1个OFDM符号，频域：1个子载波
- RB（Resource Block） 物理层数据传输的资源分配频域**最小单位**。时域：1个slot，频域：12个连续子载波(Subcarrier)
- TTI：物理层数据传输调度的时域基本单位
1 TTI = 1 subframe = 2 slots
1 TTI = 14个OFDM符号 (Normal CP)
1 TTI = 12个OFDM符号 (Extended CP) 


<center class="half">
    <img src="https://i.imgur.com/wt0hxAi.png" height="150" style="margin-right:80px"><img src="https://i.imgur.com/DJsMLNI.png" height="350">
</center>




### Resource Grid ###
[Understanding the 5G NR Physical Layer](https://www.keysight.com/upload/cmc_upload/All/Understanding_the_5G_NR_Physical_Layer.pdf#page=25)


- Resource elements are grouped into Physical Resource Blocks (**PRB**)
– Each PRB consists of **12 subcarriers**

http://www.sharetechnote.com/html/5G/5G_FrameStructure.html#Resource_Grid

<center class="half">
    <img src="https://i.imgur.com/1vOLXx9.png" height="500" style="margin-left:0px">
</center>


### Slot ###
#### Slot Structure  ####
[Understanding the 5G NR Physical Layer](https://www.keysight.com/upload/cmc_upload/All/Understanding_the_5G_NR_Physical_Layer.pdf#page=27)
#### Slot Format ####
http://www.sharetechnote.com/html/5G/5G_FrameStructure.html#Slot_Format
(注意#及后面部分，可以链接到网页的某节)

http://www.sharetechnote.com/html/5G/5G_FrameStructure.html#Resource_Grid

### 信道编码 ###
5G NR的数据信道采用LDPC码，代替了LTE的Turbo码；5G NR的广播信道和控制信道采用Polar码，代替了LTE的TBCC码。
 
为什么数据信道用LDPC码代替Turbo码？
 
Turbo码的特点是**编码复杂度低，但解码复杂度高**，而**LDPC码刚好与之相反**。考虑在eMBB场景下，码块大于10000且码率要达到8/9，这对于解码复杂度高的Turbo码是硬伤，而LDPC的解码算法相对更简单实用，刚好合适。
 
这就像有首歌唱的，刚好遇见你。
 
此外，LDPC本质上采用并行的处理方式，而Turbo码本质上是串行的，因而**LDPC更适合支持低时延应用**。
 
至于Polar码，尽管提出较晚，但其兼具编码和解码复杂度低的特点，且非常灵活，在任何码长和码率下都具有良好的性能，当然成为了控制信道的不二选择。

### 初始接入与波束管理 ###

[Understanding the 5G NR Physical Layer](https://www.keysight.com/upload/cmc_upload/All/Understanding_the_5G_NR_Physical_Layer.pdf#page=32)
(转成网页文件可打开链接)
(使用相对路径)


<center class="half">
    <img src="https://i.imgur.com/wmvrHiW.png" height="200" style="margin-right:45px"><img src="https://i.imgur.com/evGncgf.png" height="200">
</center>

<left class="half">
    <img src="https://i.imgur.com/JsqYk0A.png" height="200" style="margin-left:80px">
</left>

## 调制的阶数 ##
Modulation Order

Wikipedia
The modulation order of a digital communication scheme is determined by the number of the different symbols that can be transmitted using it.


1. BPSK: The simplest forms of digital modulation are of second order because they can transmit only two symbols (usually denoted as "0" and "1"). 
2. QPSK: 4阶调制
3. 16QAM: 16阶调制

调制阶数可以用来计算每个调制符号所能代表的比特数，log2(调制阶数) = n bit/symbol


</br></br></br></br></br></br></br></br>
</br></br></br></br></br></br></br></br>
</br></br></br></br></br></br></br></br>





