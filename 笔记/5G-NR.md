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
1. eMBB (Enhanced Mobile Broadband): 增强型移动宽带(6GHz以下及以上频段)  
2. URLLC (Ultra-Reliable Low-Latency Communications): 超可靠低时延通信(6GHz以下频段)，例如无人驾驶等业务。  
3. mMTC (massive Machine Type Communications): 大规模机器通信/大规模物联网(6GHz以下频段)    

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

<center class="half">
    <img src="https://i.imgur.com/77IhjuG.jpg" height="400" style="margin-left:80px">
</center>

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

1. TDD表示时分双工。(**指双工方式**)TDD**用时间来分离接收和发送信道**。在TDD方式的移动通信系统中, 接收和发送使用同一频率载波的不同时隙作为信道的承载，时间资源在两个方向上进行了分配。在某个时间段由基站发送信号给移动台，而中间的时间间隙由移动台发送信号给基站，基站和移动台之间必须协同一致才能顺利工作。
2. FDD表示频分双工。(**指双工方式，及收发采用不同的频率**)FDD是在分离的两个对称频率信道上进行接收和发送，用保护频段来分离接收和发送信道。FDD的缺点就是必须采用成对的频率，依靠频率来区分上下行链路，其单方向的资源在时间上是连续的。
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

☆ http://niviuk.free.fr/lte_resource_grid.html ☆


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


<center class="half">
    <img src="https://i.imgur.com/wmvrHiW.png" height="200" style="margin-right:45px"><img src="https://i.imgur.com/evGncgf.png" height="200">
</center>

<left class="half">
    <img src="https://i.imgur.com/JsqYk0A.png" height="200" style="margin-left:80px">
</left>


[Physical Channels and Signals](https://www.keysight.com/upload/cmc_upload/All/Understanding_the_5G_NR_Physical_Layer.pdf#page=44)
<center class="half">
    <img src="https://i.imgur.com/ImL7jKo.png" height="160" style="margin-left:0px">
</center>

**
SS Block
SS Burst
SS Burst Set**
<center class="half">
    <img src="https://i.imgur.com/kWimhm9.png" height="230" style="margin-left:0px"><img src="https://i.imgur.com/2FG1stS.png" height="230" style="margin-left:0px">
</center>





## 5G/NR - Synchronization   ##
http://www.sharetechnote.com/html/5G/5G_Phy_Synchronization.html

### NR Synchronization Process ###
When we say '**Synchronization**' in communication technology, it usually mean '**synchronization for transmission**' and '**synchronization for reception**'.

In UE's point of view, 'transmitting direction' is called 'Uplink' and 'receiving direction' is called 'Downlink'. Applying this terms to synchronization process, we have two types of synchronization in cellular communication including 5G/NR called '**Downlink Synchronization**' and '**Uplink Synchronization**'.


Donwlink Synchronization : This is the process in which UE detect the radio boundary (i.e, the exact timing when a radio frame starts) and OFDM symbo boundary(i.e, the exact timing when an OFDM symbol starts). This process is done by detecting and analyzing SS Block. This is a pretty complicated process and follow through [SS Block Page](http://www.sharetechnote.com/html/5G/5G_SS_Block.html) for the detailed understanding.


Uplink Synchronization : This is the process in which UE figure out the exact timing when it should send uplink data (i.e, PUSCH / PUCCH).  Usually a network (gNB) is handling multiple UEs and the network has to ensure that the uplink signal from every UE should be aligned with a common receiver timer of the network. So this involves much more complicated process and sometimes it has to adjust UE Tx timing (uplink timing) of each UE. This is called **RACH process**. Of course, you need to go through much longer pages of reading. Read through [RACH page](http://www.sharetechnote.com/html/5G/5G_RACH.html) for the details.

### Overal Procedure of Synchronization and Initial Access ###
[Overal Procedure of Synchronization and Initial Access](http://www.sharetechnote.com/html/5G/5G_Phy_Synchronization.html#Overal_Procedure_of_Synch_InitialAccess)  
when we just say "Synchronization", it usually mean Downlink Synchronization. Of course, Uplink Synchronization is very important as well, but usually the uplink process is regarded as part of RACH process and normaly treated under "RACH Procedure" or "Initial Access" process.

### How Synchronization work ? ###
The most common way to implement the Synchronization is

i) Create a predefined signal (a predefined data sequence : This signal is called Sync signal)  
ii) Put the signal into a specific OFDMA symbol in a specific subframe and transmit

Since UE already have (or can derive) all the details of the predefined sync signal, it can search and detect the data from the stream of data reaching the UE. Because the sync signal is located in the predefined location in time, UE can detect the exact timing from the decoded sync signal.

### What kind of Information can be derived from the Synchronizaiton Signal ? ###
[What kind of Information can be derived from the Synchronizaiton Signal ?](http://www.sharetechnote.com/html/5G/5G_Phy_Synchronization.html#InformationInSyncSignal)

### Synchronization Signal in Frame Structure ###
[Synchronization Signal in Frame Structure](http://www.sharetechnote.com/html/5G/5G_Phy_Synchronization.html#Synchronization_Signal_in_Frame_Structure)


## 调制的阶数 ##
Modulation Order

Wikipedia
The modulation order of a digital communication scheme is determined by the number of the different symbols that can be transmitted using it.


1. BPSK: The simplest forms of digital modulation are of second order because they can transmit only two symbols (usually denoted as "0" and "1"). 
2. QPSK: 4阶调制
3. 16QAM: 16阶调制

调制阶数可以用来计算每个调制符号所能代表的比特数，log2(调制阶数) = n bit/symbol


## LTE 随机接入 ##
随机接入本质上说就是**实现终端跟基站之间的上行同步**，是空口层面的。
附着的本质是在让终端成功接入核心网，成功拿到IP地址，是核心网层面的。

http://www.sharetechnote.com/html/RACH_LTE.html

- RACH stands for Random Access Channel.   
- This is the first message from UE to eNB when you power it on.  
- In terms of eNB point of view, it would seem that it is getting this initial UE signal in almost random fashion (e.g, in Random timing , Random Frequency and in Random Identification) because it has no idea when a user turn on the UE (Actually it is not completely random, there are a certain range of agreement between UE and Network about the timing, frequency location and possible indentification, but in large scale it would look like working in random fashion). 

### Why RACH ? (为什么需要 RACH) ###
The **main purpose** of RACH can be described as follows.
i) Achieve** UP link synchronization** between UE and eNB
ii) Obtain the resource for Message 3 (e.g, RRC Connection Request)

In most of the communication (especially digital comunication regardless of whether it is wired or wireless), the most important precondition is to establish the **timing synchronization** between the reciever and transmitter. So whatever communication technology you would study, you would see some kind of synchronization mechanism that is specially designed for the specific communication.

**synchronization in downlink**: In LTE, the synchronization in downlink (Transmitter = eNB, Reciever = UE), this synchronization is achieved by the special synchronization channel (special physical signal pattern). Refer to [Time Sync Process](http://www.sharetechnote.com/html/BasicProcedure_LTE_TimeSync.html) page for the details. This downlink sync signal gets **broadcasted** to everybody and it is get transmitted all the time with a certain interval.

**synchronization in uplink**: However in Uplink(Transmitter = UE, Reciever = eNB), it is not efficient (actually waste of energy and causing a lot of interference to other UEs) if UE is using this kind of broadcasting/always-on synchronization mechanism. In case of uplink, this synchronization process should meet following criteria
i) The synchronization process should happen only when there is immediate necessity
ii) The synchronization should be dedicated to only a specific UE
All the complicated/confusing stories in this page is mostly about the process specially designed mechanism to meet these criteria.

 
Another purpose of RACH process is to obtain the resource for Msg3 (Message 3). RRC Connection Request is one example of Msg3 and there are several different types of Msg3 depending on situation. 

### Two types of RACH process ###
(http://www.sharetechnote.com/html/RACH_LTE.html#Two_types_of_RACH_process)  
Two types of RACH process : Contention-based and Contention-free

### RACH Process Overview In Diagrams ###
http://www.sharetechnote.com/html/RACH_LTE.html#RACH_Process_Overview_In_Diagrams


## CRC ##
CRC即循环冗余校验码（Cyclic Redundancy Check）：是数据通信领域中最常用的一种查错校验码，其特征是信息字段和校验字段的长度可以任意选定。循环冗余检查（CRC）是一种数据传输检错功能，对数据进行多项式计算，并将得到的结果附在帧的后面，接收设备也执行类似的算法，以保证数据传输的正确性和完整性。

https://blog.csdn.net/weicao1990/article/details/51669853  
http://www.sharetechnote.com/html/Handbook_Communication_CRC.html  


## 术语 ##

- PSS (Primiary Synchronization Signal)  
http://www.sharetechnote.com/html/5G/5G_PSS.html  
- SSS (Secondary Synchronization Signal)  
http://www.sharetechnote.com/html/5G/5G_SSS.html  
- PBCH (Physical Broadcast Channel)   
http://www.sharetechnote.com/html/Handbook_LTE_PBCH.html    
http://rfmw.em.keysight.com/wireless/helpfiles/89600b/webhelp/subsystems/lte/content/ lte_sym_tbl_framesummary_pbch.htm  
-  PRACH Channel (Physical Random Access Channel)  
http://www.sharetechnote.com/html/5G/5G_RACH.html   
http://www.sharetechnote.com/html/RACH_LTE.html   
- MIB (Essential system information)   
- Downlink **physical channels**:    
• Physical Broadcast channel (PBCH)(物理广播信道)。承载小区ID等系统信息，用于小区搜索过程。  
• Physical Downlink Control Channel (PDCCH)(物理下行控制信道)。承载导呼和用户数据的资源分配信息，以及与用户数据相关的HARQ信息。  
• Physical Downlink Shared Channel (PDSCH)(物理下行共享信道) 。 主要用于传输业务数据，也可以传输信令。  
- Downlink **physical signals**:  
• Primary Synchronization Signal (PSS)  
• Secondary Synchronization Signal (SSS)  
• Channel State Information Reference Signal (CSI-RS)  
• Tracking Reference Signal (TRS)  
- 上行物理信道  
• PRACH: Physical Random Access Channel(物理随机接入信道) 承载随机接入前导。Carries random access preamble.  
• PUSCH: Physical Uplink Shared Channel(物理上行共享信道) 承载上行用户数据。  
• PUCCH: Physical Uplink Control Channel(物理上行共享信道) 承载HARQACK/NACK，调度请求，信道质量指示等信息。Carries ACK/NACKs in response to downlink transmission. Carries CQI (Channel Quality Indicator) report and SR (Scheduling Request).    
- Uplink physical signals:   
• Demodulation Reference Signal (UL-RS), associated with transmission of PUSCH and PUCCH.  
• Sounding Reference Signal (SRS), not associated with transmission of PUSCH and PUCCH.  
http://www.artizanetworks.com/resources/tutorials/phy_cha.html   
https://www.mathworks.com/help/lte/physical-channels.html     
- RRC (Radio Resource Control) protocol  


## 物理信道与物理信号 ##
**物理信道(physical channels)**: 对应于一系列资源粒子(RE: Resource Elements)的集合， 用于承载来自高层的信息。  
**物理信号(physical signals)**: 对应于物理层使用的一系列RE，但这些 RE 不传递任何来自高层的信息。如参考信号(RS)，同步信号。RS(Reference Signal)：参考信号，通常也称为导频信号；SCH(PSCH,SSCH)：同步信号，分为主同步信号和辅同步信号。

## 逻辑信道与传输信道 ##
逻辑信道(Logical Channel)  
传输信道(Transport Channe)  
http://www.techplayon.com/2411-2/  
https://www.tutorialspoint.com/lte/lte_communication_channels.htm  
http://www.rfwireless-world.com/Tutorials/LTE-logical-transport-physical-channels.html  

<center class="half">
    <img src="https://i.imgur.com/nnrRuH5.jpg" height="260" style="margin-left:0px"><img src="https://i.imgur.com/yqpmUHC.jpg" height="300" style="margin-left:0px">
</center>



## LTE的同步信号 ##

<center class="half">
    <img src="https://i.imgur.com/4WZK0Yu.png" height="300" style="margin-left:0px">
</center>

## CSI ##
CSI(Channel State Information ) : 信道状态信息  

https://blog.csdn.net/m_052148/article/details/72824979  
在LTE里，我们通常所说的信道状态信息CSI（Channel State Information），主要包括PMI、RI和CQI。PMI的意思是预编码矩阵，UE通过PMI告诉eNB当前DL-SCH传输的最佳预编码矩阵。RI是秩指示的意思，告诉eNB当前DL-SCH传输的最佳层数。CQI是信道质量指示，表示在采用了建议的RI和PMI之后，为确保下行DL-SCH接收的误码率不超过10%，可用的最高调制编码方案，也就是说，CQI的值将影响下行MCS的取值。

### What is CSI ###
http://www.sharetechnote.com/html/Handbook_LTE_CSI.html#What_is_CSI

CSI is a kind of collective name of several different type of indicators (UE report) as listed below.
- Channel Quality Indicator(CQI)
- precoding matrix indicator (PMI)
- precoding type indicator (PTI)
- rank indication (RI)

## 层映射 与 预编码 ##
### 层映射 ###
<center class="half">
    <img src="https://i.imgur.com/yc3HWA8.png" height="150" style="margin-left:0px">
</center>

http://www.sharetechnote.com/html/PhyProcessing_LTE.html  
http://www.sharetechnote.com/html/BasicProcedure_LTE_PHY_Precoding.html  
https://blog.csdn.net/zhihuiyu123/article/details/81461189  
https://blog.csdn.net/cun_yun/article/details/45580965  
https://blog.csdn.net/zhihuiyu123/article/details/79264513  
http://blog.sina.com.cn/s/blog_65a28d8a0102x9g1.html  
https://link.springer.com/content/pdf/10.1155/2009/302092.pdf  


在LTE里面，空间复用的模式下，层数等于信道矩阵的秩，也就是说能够独立并行传输的数据流数。
https://communities.theiet.org/blogs/426/430  
There are mainly **two types** of layer mapping: one for **spatial multiplexing** and the other for **transmit diversity**.  

- In case of **spatial multiplexing**, there may be one or two code-words. But the number of layers is restricted. On one hand, it should be equal to or more than the number of codewords. On the other hand, the number of layers cannot exceed the number of antenna ports. The most important concept is ‘layer’. The layers in spatial multiplexing have the same meaning as ‘streams’. They are used to transmit multiple data streams in parallel, so the number of layers here is often referred to as the transmission rank. In spatial multiplexing, the number of layers may be adapted to the transmission rank, by means of the feedback of a Rank Indicator (RI) to the layer mapping.
- In case of **transmit diversity**, there is only one codeword and the number of layers is equal to the number of antenna ports. The number of layers in this case is** not related **to the transmission rank, because transmit-diversity schemes are always single-rank transmission schemes. The layers in transmit diversity are used to conveniently carry out the following precoding by some pre-defined matrices.



[MIMO in LTE and LTE-Advanced](https://www.commsys.isy.liu.se/MIMO/frenger_slides.pdf)
<center class="half">
    <img src="https://i.imgur.com/JnDwgmG.png" height="400" style="margin-left:0px">
</center>


###  预编码 ###
http://rfmw.em.keysight.com/wireless/helpfiles/89600b/webhelp/subsystems/lte/content/lte_overview.htm  
https://www.mathworks.com/help/lte/examples/lte-dl-sch-and-pdsch-processing-chain.html  

## 空间分集 VS 空间复用 ##

## 发射分集 VS 波束赋形 ##

## LTE MIMO modes ##
https://www.radio-electronics.com/info/cellulartelecomms/lte-long-term-evolution/lte-mimo.php  
http://www.sharetechnote.com/html/BasicProcedure_LTE_MIMO.html  

## sharetechnote ##
☆ http://www.sharetechnote.com/ ☆

  

## 5G NR physical layer ##
[5G physical layer specifications](https://medium.com/5g-nr/5g-physical-layer-specifications-e025f8654981)  
[5G New Radio: Unveiling the Essentials of the Next Generation Wireless Access Technology](https://arxiv.org/ftp/arxiv/papers/1806/1806.06898.pdf)  
[5G New Radio - Unveiling the Essentials of the Next Generation Wireless Access Technology](../笔记/5G-NR/5G_New_Radio_Unveiling_the_Essentials_of_the_Next_Generation_Wireless_Access_Technology.pdf#page=3)（本地文件）


子载波间隔、CP长度以及每个子帧的时隙个数都受**同一个参数**控制。
\\(\mu (0,1,2,3,4)\\)  
>子载波间隔：\\(2^\mu\cdot 15kHz\\)  
CP时长：\\(2^{-\mu}\cdot 4.7{\mu}s\\)  
每个子帧的时隙个数：\\(2^\mu \\)   

每个时隙(slot)包含14或7个OFDM符号。  
However, the number of symbols within a slot does not change with the numberology, it only changes with slot configuration type. For slot configuration 0, the number of symbols for a slot is always 14 and for slot configuration 1, the number of symbols for a slot is always 7.  
一个资源块包含12个连续子载波。(A resource block (RB) consists of 12 consecutive subcarriers in the frequency domain.)   

**思考：**
Numerology 配置的最小级别是什么，是子帧么？子帧内的不同时隙或者不同OFDM符号可以配置不同的Numerology么？   
**BWP is configured with a single numerology.  ** 
Each BWP is associated with a specific numerology, i.e., SCS and CP type. Therefore, the BWP is also a means to reconfigure a UE with a certain numerology. 



**SSB**

<center class="half">
    <img src="https://i.imgur.com/oC8tRpl.png" height="430" style="margin-left:0px">
</center>

The combination of SS and PBCH is referred to as SSB in NR.  
NR SS consists of primary SS (PSS) and secondary SS (SSS).   

By detecting SS, a UE can  
>obtain the physical cell identity,   
>achieve downlink synchronization in both time and frequency domain,   
>and acquire the timing for PBCH. PBCH carries the very basic system information.  


**物理层的起点**是MAC层传下来的传输块(TB: Transport Block)，终点是生成基带OFDM信号。然后上变频或下变频将基带OFDM信号变成射频信号，通过天线发射出去。  
**TB(传输块)**是供物理层处理的MAC层和物理层之间数据交换的基本单元。物理层为每一个TB加上CRC校验信息。  
[5G New Radio: Unveiling the Essentials of the Next Generation Wireless Access Technology](https://arxiv.org/ftp/arxiv/papers/1806/1806.06898.pdf#page=5)   





## 帧结构 ##

SFN  
[SFN System Frame Number 系统帧号](http://www.txrjy.com/thread-532340-1-1.html)   
LTE中用10bit承载该数据，在MIB中承载，在PBCH中传输。SFN位长为10bit，也就是取值从0-1023循环。在PBCH的MIB广播中只广播前8位，剩下的两位根据该帧在PBCH 40ms周期窗口的位置确定，第一个10ms帧为00，第二帧为01，第三帧为10，第四帧为11。PBCH的40ms窗口手机可以通过盲检确定。   


[LTE物理传输资源（1）-帧结构和OFDM符号](https://blog.csdn.net/m_052148/article/details/51305338)  
3.TDD帧结构  
协议上对LTE-TDD的帧结构模式，一般又称为Frame structure type 2，这里为了指代明确，还是称呼为TDD帧结构。  
在TDD里，每个无线帧的长度Tf=10ms，由2个**“半帧”**组成，每个“半帧”的长度等于5ms，由5个连续的子帧组成，每个子帧长度等于1ms。  

相同的子帧在不同的上下行配置（Uplink-downlink configuration）时，可能会发送不同方向的数据。下图是各种上下行子帧配置下，所有子帧发送数据的方向。D表示该子帧只能发送下行数据，U表示该子帧只能发送上行数据，S表示特殊子帧，一般用作下行数据发送。  

<center class="half">
    <img src="https://i.imgur.com/6iMAxeC.png" height="160" style="margin-left:0px">
</center>  

下行-上行切换周期(downlink-to-uplink switch-point periodicity)  
**下行-上行切换周期与10ms内特殊子帧的个数有关**，计算方式参考下图。
<center class="half">
    <img src="https://i.imgur.com/3BwDIBa.png" height="260" style="margin-left:0px">
</center>  

**在5G NR中，上行和下行分配的变换是OFDM符号级的，而在LTE中是子帧级别的。**
[☆ In 5G NR, DL and UL assignment changes at a symbol level (in LTE TDD the UL/DL assignment is done in a subframe level)](http://www.sharetechnote.com/html/5G/5G_FrameStructure.html#Slot_Format) 

<center class="half">
    <img src="https://i.imgur.com/bjgd2Rc.png" height="260" style="margin-left:0px">
</center>   


## TD-LTE系统为何需要时间同步 ##
### 基站(BTS)、小区(CELL)、扇区(SECTOR) ###
小区是个逻辑的概念，基站和扇区都是物理的概念，是实实在在存在的。  
 
基站可设在小区的中心，用全向天线形成圆形的覆盖区，这就是“中心激励”方式。也可将基站设在每个小区六边形的三个顶点上，每个基站采用三副120度扇形辐射的定向天线，分别覆盖三个相邻小区的各三分之一的区域，每个小区由三副120度扇形天线共同覆盖，这就是“顶点激励”方式，而每副天线覆盖的区域就是一个基站扇区。  

与小区相比，扇区是一个具有地理意义的概念，而小区是一种逻辑概念，主要是为了方便移动交换中心进行参数配置以及控制用，因此一个扇区可能包含几个小区，通常扇区与基站的天线方向对应，对于全向天线的基站就只有一个扇区，而只具有定向天线的基站就会包含有多个扇区。**一般只要无线参数上有不同就是不同的小区，例如频率不同或者频率相同但扰码不同都分成不同的小区。**
  
全向基站本身就是一个小区，没有扇区的概念了。  


### 同频组网 VS 异频组网 ###


同频组网 
同频组网指的是 LTE系统网覆盖的所有小区都使用相同的频点。LTE一般采用同频组网的方式进行组网。  
<center class="half">
    <img src="https://i.imgur.com/yddbtif.png" height="260" style="margin-left:0px">
</center> 

### TDD系统同步方式(同频组网) ###

基站的同步是靠 GPS/北斗等来实现的，GPS/北斗的作用是实现基站的时间同步，**时间同步的作用是在距离较近的周围基站实现“大家一起发，大家一起收”**，这样可以增加频谱的利用率，这也就是 TD 典型的“同步技术”。TD 在这种同步的技术下完全可以用同一个频点进行上行和下行传输，因为在上行的时候不会下行，在下行的时候不会上行。也就是说，n个UE一起上发，m个小区一起下发。

因此，在TD-LTE组网时，各基站必须保持严格的时间同步，才能保证各个基站间的上下行链路不会相互干扰。


[LTE 中的上行时间同步](http://blog.sina.com.cn/s/blog_673b30dd0100lhty.html)  

LTE中，不同UE的上行信号到达eNodeB时要时间对齐，以保证UE之间上行信号的正交性，从而有助于消除小区内的干扰。

信号在空间传输是有延迟的，如果UE在呼叫期间向远离基站的方向移动，则从基站发出的信号将“越来越迟”的到达UE，与此同时，UE的信号也会“越来越迟”的到达基站，延迟过长会导致基站收到的UE在本时隙上的信号与基站收下一个其它UE信号的时隙相互重叠，引起码间干扰。
  

上行传输的时间对齐是通过在UE发送侧应用TA（Timing Advance）来实现的。TA的主要目的就是为了**消除UE之间不同的传输时延**。  

UE在获得初始同步以后，随着时间的推移，由于信道情况的改变或者UE（以及eNodeB）的时钟漂移，UE可能重新变为失步状态。为此eNodeB会周期性的为UE发送TA命令，指导UE进行上行的同步，并且eNodeB为每个UE配置了一个Time Alignment Timer，规定了TA的有效期，为此eNodeB需要在UE的能力和系统的开销之间进行折中。UE在每次接收到eNodeB的TA命令后，都将此定时器重置为零。在Time Alignment Timer超时以后，如果UE未能收到任何的TA命令，那么UE认为上行已经失步，此时UE不能再进行任何的上行数据传输，而必须通过随机接入的过程来对上行的TA进行重新初始化。  

[为什么TDD-LTE上行时隙转下行时隙不需要保护间隔？而下行时隙转上行时隙需要保护间隔？](https://zhidao.baidu.com/question/1381930293850184180.html)  

在一个小区中，所有UE要保持上行同步。  
下行即eNodeB发送给UE，无线电波从eNodeB到UE需要一段时间，由于各个UE和eNodeB的距离不同，因此距离eNodeB近的UE会先接收到下行信号，而距离eNodeB远的UE后接收到下行信号。在一段下行时隙后，需要留出来一段保护间隔，在该保护间隔内，保证所有UE都接收到了下行信号，并对信号进行处理。然后，所有UE才能在即将到来的上行时隙同时发送上行信号，即小区内UE同步。    
保护间隔大部分的时间是用于无线信号传播，还有一小部分是UE为即将到来的上行发送做准备，如启动功放电路等。  
若没有保护间隔，显而易见各个UE会在不同时刻进行上行信号的发送，从而导致UE间失步。  

[LTE的上行同步过程](https://www.pttcn.net/plus/m_view.php?aid=23716)   
为了保证上行传输的正交性，避免小区内（intra-cell）干扰，eNodeB要求来自同一子帧但不同频域资源(不同的RB)的不同UE的信号到达eNodeB的时间基本上是对齐的。eNodeB只要在循环前缀（Cyclic Prefix）范围内接收到UE所发送的上行数据，就能够正确地解码上行数据，因此上行同步要求来自同一子帧的不同UE的信号到达eNodeB的时间都落在循环前缀范围之内。  

为了保证接收侧（eNodeB侧）的时间同步，LTE提出了上行定时提前（Uplink Timing Advance）的机制。  

[上行定时提前（Uplink Timing Advance）](http://blog.sina.com.cn/s/blog_927cff010101cwju.html)  
为了保证上行传输的正交性，避免小区内（intra-cell）干扰，eNodeB要求来自同一子帧但不同频域资源（不同的RB）的不同UE的信号到达eNodeB的时间基本上是对齐的。eNodeB只要在CP（Cyclic Prefix）范围内接收到UE所发送的上行数据，就能够正确地解码上行数据，因此上行同步要求来自同一子帧的不同UE的信号到达eNodeB的时间都落在CP之内。  

为了保证接收侧（eNodeB侧）的时间同步，LTE提出了上行定时提前（Uplink Timing Advance）的机制。  



## BWP ##
**BWP is configured with a single numerology.  **    

Each BWP is associated with a specific numerology, i.e., SCS and CP type. Therefore, the BWP is also a means to reconfigure a UE with a certain numerology.    

A BW Part (BWP) is a new term that defines a fixed band over which the communication taking place uses the same numerology throughout the existence of the BWP.  

5G的带宽最小可以是5MHz，最大能到400MHz。如果要求所有终端UE都支持最大的400MHz，无疑会对UE的性能提出较高的要求，不利于降低UE的成本。同时，一个UE不可能同时占满整个400M带宽，如果UE采用400M带宽对应的采样率，无疑是对性能的浪费。   

BWP，英文全称为Bandwidth Part，即**一部分带宽**。我们有时也用Bandwidth Adaptation指代这个技术，即带宽自适应变化。 

在LTE中，UE的带宽跟系统的带宽保持一致，解码MIB信息配置带宽后便保持不变。  

在NR中，UE的带宽可以动态的变化。第一个时刻，UE的业务量较大，系统给UE配置一个大带宽（BWP1）；第二时刻，UE的业务量较小，系统给UE配置了一个小带宽（BWP2），满足基本的通信需求即可；第三时刻，系统发现BWP1所在带宽内有大范围频率选择性衰落，或者BWP1所在频率范围内资源较为紧缺，于是给UE配置了一个新的带宽（BWP3）。  

[5G/NR - Carrier Bandwith Part](http://www.sharetechnote.com/html/5G/5G_CarrrierBandwidthPart.html)    
38.211中是这样定义Carrier Bandwith Part的
>A bandwidth part is a subset of **contiguous** common resource blocks for a given numerology (u) in bandwidth part on a given carrier.

大概翻译一下就是一个bwp是给定载波带宽上连续资源块的子集。

NOTE : **CRB** in this illustration stands for Carrier Resource Block which is numbered from the one end through the other end of Carrier Band (this is a kind of global resource block), the **PRB** stands for Physical Resource Block is the resource blocks numbered within each BWP. 下图中的 CRB 指的是 Carrier Resource Block
<center class="half">
    <img src="https://i.imgur.com/rxgdpdk.png" height="360" style="margin-left:0px">
</center> 

<center class="half">
    <img src="https://i.imgur.com/y7N8SwB.png" height="100" style="margin-left:0px">
</center> 


<center class="half">
    <img src="https://i.imgur.com/RoVoFh5.png" height="270" style="margin-left:0px">
</center> 


[NR Wide Bandwidth Operations](https://arxiv.org/ftp/arxiv/papers/1712/1712.09724.pdf)  

[BWP Switch Transition Time](http://ziyubiti.github.io/2018/03/07/5gnrbwt/)  
对于带宽配置改变后，需要重新进行RF retuning，设置ADC/DAC。


### 参考资源块、公共资源块、物理资源块、虚拟资源块 ###
http://marshallcomm.cn/2017/12/17/nr-v200-l1-channel-modulation/

资源块（resource block）定义为12个连续频域子载波。  

参考资源块（reference resource block）在频域上从0开始编号。参考资源块0的子载波0对于所有的子载波配置 是公共的，也被称为“参考点A”，并且用作其他资源块格的公共参考点。参考点A从以下高层参数获得。  

物理资源块（physical resource block）在BWP中定义。

## EVM ##
误差向量幅度（Error Vector Magnitude，简称：EVM），是在一个给定时刻理想无误差基准信号与实际发射信号的向量差，能全面衡量调制信号的幅度误差和相位误差。

以百分比的形式表示。EVM越小，信号质量越好。  

误差矢量幅度是实际测量到的波形和理论调制波形之间的偏差。  

<center class="half">
    <img src="https://i.imgur.com/BIEsQzU.jpgg" height="270" style="margin-left:0px">
</center> 


## Carrier Bandwidth VS Channel Bandwidth ##
Carrier Aggregation 载波聚合  
One of the major features of LTE-Advanced is Carrier Aggregation.

## 上行调度 VS 下行调度 ##
Scheduling 

[上行调度请求（Scheduling Request，SR）](http://blog.sina.com.cn/s/blog_927cff010101a7yh.html)  
如果UE没有上行数据要传输，eNodeB并不需要为该UE分配上行资源，否则会造成资源的浪费。因此， UE需要告诉eNodeB自己是否有上行数据需要传输，以便eNodeB决定是否给UE分配上行资源。为此LTE提供了一个上行调度请求（Scheduling Request，SR）的机制。  

UE通过SR告诉eNodeB是否需要上行资源以便用于UL-SCH传输。  

eNodeB不知道UE什么时候需要发送上行数据，即不知道UE什么时候会发送SR。因此，eNodeB需要在已经分配的SR资源上检测是否有SR上报。  

 由于SR资源是UE专用且由eNodeB分配的，因此SR资源与UE一一对应且eNodeB知道具体的对应关系。也就是说，UE在发送SR信息时，并不需要指定自己的ID（C-RNTI），eNodeB通过SR资源的位置，就知道是哪个UE请求上行资源。  

 UE在某些情况下可能没有SR资源。
>场景一：  
场景二：当UE丢失了上行同步，它也会释放SR资源，如果此时有上行数据要发送，也需要触发随机接入过程。  

从上面的描述可以看出，当UE没有被分配SR资源时，基于竞争的随机接入过程可以替代SR的功能用于申请上行资源。但这只适用于低密集度的上行资源请求的情况。

UE发送SR以后，无法确定eNodeB什么时候会下发UL Grant，这取决于上行资源的调度以及优先级等。如果UE等待超时（超时时间由sr-ProhibitTimer决定）就重发SR，重发次数超过了SR的最大重传次数（由IE：SchedulingRequestConfig的dsr-TransMax决定）就会触发随机接入。（见36.321的5.4.4节）


[LTE 调度机制](https://wenku.baidu.com/view/68692868e87101f69e319599.html)    
由于 LTE 系统中资源调度和链路自适应完全由 eNodeB 控制，因此上行信道CQI 的测量值可以由 eNodeB 直接获取并使用，也不需要标准化；而下行信道的 CQI 值需要在 UE 侧获取，并由 UE 反馈给 eNodeB。

**下行链路调度**
当 UE 能够进行下行链路数据接收时，为了得到可能分配给该 UE 的下行资源，**UE 需要一直监视 PDCCH**。


下行资源的分配方案通过 PDCCH 信道发下去，通知某个 UE 在什么时频资源块、以什么样的调制编码方案、什么样的 MIMO 工作模式向该 UE 发送下行数据； 随后，下行数据通过 PDSCH 信道发送给该 UE，UE 则根据 PDCCH 信道上的指示找到 eNodeB 发给自己的数据，如下图所示。
<center class="half">
    <img src="https://i.imgur.com/TKuUohf.png" height="330" style="margin-left:0px">
</center> 

UE 的 CQI 报告是下行资源调度的重要依据，但不是唯一的依据。eNodeB 还有其它考虑，比如 UE 能力（Capability）、业务 QoS 要求、公平性等。CQI 信息不仅仅用于下行资源调度，还用于干扰协调、功率控制、AMC 等重要过程。UE 测量 eNodeB 的导频信号，得到不同频域的资源块的信噪比，然后以 CQI 报告的形式上报 eNodeB。CQI 报告周期可以调整，如果周期过小，则信令开销太大；如 果周期过大，则下行调度器就不能全面了解下行信道的质量信息。  
下行调度控制指令指导 UE 对下行发送信号进行接收处理，包括三种指示（如下表）：
<center class="half">
    <img src="https://i.imgur.com/eSxB1OP.png" height="280" style="margin-left:0px">
</center> 

**上行链路调度**
在上行方向，UE 不能随时随意地发送自己的数据，必须服从 eNodeB 的安排。上行资源的调度由 eNodeB 的 MAC 层的上行调度器决定。

由于无线资源调度由 eNodeB 完成，因此 UE 需要适时向 eNodeB 发送调度请求（SR），用于请求 UL-SCH 资源。UE 发送调度请求的规则是：
>如果在当前 TTI 配置由 PUCCH 来发送调度请求，且没有可用的 UL-SCH 资源，则 UE 的 MAC 层将指示物理层在 PUCCH 上发送调度请求；  
如果 UE 在任何 TTI 都没有配置 PUCCH来发送调度请求，则 UE 将发起随机接入过程；  
如果一个调度请求已经被触发， UE 将在每个 TTI 进行请求，直到获得 UL-SCH 资源。  

UE 还需要向 eNodeB 发送缓冲区状态报告（BSR），用于为 eNodeB 提供 UE 上行链路缓冲区中数据量的信息。  

eNodeB 的上行调度器根据 UE 缓存状态报告 BAR、上行调度请求 SR、上行信道状况决定给 UE 调度什么样的无线资源，把调度结果通过 PDCCH 信道的上行调度准许（UL Grant）告知 UE；UE 根据 eNodeB 的指示，在 PUSCH 信道发送业务数据。
<center class="half">
    <img src="https://i.imgur.com/7bVogfb.png" height="330" style="margin-left:0px">
</center> 


根据反馈的信道质量条件，调度器可以决定每一个调度周期内无线资源采取的调制编码方案（MCS）和混合自动重传（HARQ）方式。调度算法有两个重要的设计参数：一个是吞吐量，另一个是公平性。调度算法是数据业务系统的一个特色，目的是充分利用信道的时变特性，得到多用户分集增益，提供系统的吞吐量。吞吐量用小区单位时间内传输的数据量来衡量。公平性指小区所有用户是否都获得一定的服务机会，最公平的算法是所有用户享有相同的服务机会。好的调度算法应该兼顾吞吐量和公平性。  

根据算法的特点，调度算法可以分为：轮询（Round Robin, RR）算法、最大 C/I 算法（Max C/I）、比例公平算法（Proporonal Fair，PF）等。

## PDSCH 物理下行共享信道 ##
需要注意的是PDSCH的资源是基于VRB而非PRB的。VRB是逻辑概念，需要经过一定的映射关系才能转换到PRB。  

LTE下行除了MIB外，所有高层控制信息及用户数据最终都通过PDSCH信道传输，也就是说，UE所需的绝大部分信息都直接来源于PDSCH信道，因此PDSCH信道的接收质量就代表了LTE下行的服务质量。  

PDSCH信道由PDCCH信道进行调度，UE需要首先解调PDCCH，以确定是否需要进行PDSCH信道的接收。  

[PDSCH (Physical Downlink Shared Channel)](http://www.sharetechnote.com/html/Handbook_LTE_PDSCH.html)  
In terms of channel processing, PDSCH is going through the most complicated process. If you understand full details of PDSCH channel processing, you can say you have understood almost everything of LTE Physical Layer.

[LTE PDSCH allocation calculator](http://niviuk.free.fr/lte_pdsch_calc.html) 


[Frame Structure - Downlink](http://www.sharetechnote.com/html/FrameStructure_DL.html)  
http://dhagle.in/LTE  
<center class="half">
    <img src="https://i.imgur.com/JG2kjFn.png" height="430" style="margin-left:0px">
</center> 


## 3GPP 文档命名 ##

[3GPP文档命名规则](http://www.cnblogs.com/hesicong/archive/2005/08/21/219616.html)  

每份3GPP技术文档，技术报告(TR)或者技术规范(TR)，都被一个Reference唯一标示。  
这个Reference以3GPP前缀开始，后跟两个字符表示文档的类型(TS为技术报告，TR为技术规范）。  
在文档类型之后紧接着是规范的号码。规范号码具有aa.bbb或者aa.bb两种形式。其中aa指示文档的适用范围（见表1）。  
规范号码后面是版本Vx.y.z，其中x表示release，y表示技术版本，z表示修订版本。    
另外注意每个release都有一个冻结日期，一般3GPP协议在冻结以后就不再修改。一般冻结日期为1年。

规范号（aa.bbb） = 规范系列号.文档号，其中 aa 为规范系列号，指示文档的适用范围（见表 1），bbb 是文档号。规范号后面是版本号 Vx.y.z，其中 x 表示 release，y 表示技术版本，z 表示修订版本。


[3GPP TR 38.912 version 14.1.0 Release 14](https://www.etsi.org/deliver/etsi_tr/138900_138999/138912/14.01.00_60/tr_138912v140100p.pdf)   
Study on new radio access technology    
[Multi-antenna scheme - Downlink transmission scheme ](https://www.etsi.org/deliver/etsi_tr/138900_138999/138912/14.01.00_60/tr_138912v140100p.pdf#page=22)    
[Multi-antenna scheme - Uplink transmission scheme](https://www.etsi.org/deliver/etsi_tr/138900_138999/138912/14.01.00_60/tr_138912v140100p.pdf#page=36)    
  
 
## 参考信号的正交性(orthogonality) ##
参考信号(Reference Signal,RS),就是常说的“导频”信号,是由发射端提供给接收端用于信道估计或信道探测的一种已知信号。

## Channel Hardening in Massive MIMO ##
[Channel Hardening in Massive MIMO - A Measurement Based Analysis](https://arxiv.org/abs/1804.01690)

More specifically, when increasing the number of base station antennas in a massive MIMO systems the channel variations decrease and the so-called channel hardening effect appears. This means that the variations of the channel gain in time and frequency decrease. 

## TM (Transmission Modes) ##
[MIMO in (4G) cellular systems](https://web.stanford.edu/~apaulraj/workshop70/pdf/MIMO_Cellular_Gorokhov.pdf)  

[LTE DL Transmission Modes](https://www.keysight.com/upload/cmc_upload/All/25April2013WebcastSlides.pdf#page=19)  

[PDSCH Throughput for Non-Codebook Based Precoding Schemes: Port 5 (TM7), Port 7 or 8 or Port 7-8 (TM8), Port 7-14 (TM9 and TM10)](https://www.mathworks.com/help/lte/examples/pdsch-throughput-for-non-codebook-based-precoding-schemes-port-5-tm7-port-7-or-8-or-port-7-8-tm8-port-7-14-tm9-and-tm10.html)  

[3GPP LTE Release 9 and 10 requirement analysis to physical layer UE testing](https://core.ac.uk/download/pdf/18617020.pdf)  

[BeamForming](http://www.sharetechnote.com/html/Handbook_LTE_BeamForming.html#Beamforming_in_LTE)  


[OFDM VS OFDMA](https://www.slideshare.net/peichechang/lte-introduction-part1)  

[Antenna Port](http://www.sharetechnote.com/html/Handbook_LTE_AntennaPort.html)   

[RS (Reference Signal ) - Cell Specific](http://www.sharetechnote.com/html/FrameStructure_DL.html#RS)   


[RS (Reference Signal ) - UE Specific](http://www.sharetechnote.com/html/FrameStructure_DL.html#RS_UE_Specific)  

[36.211 6.3.3 Layer mapping](https://www.etsi.org/deliver/etsi_ts/136200_136299/136211/14.02.00_60/ts_136211v140200p.pdf#Ppage=86)   

[36.101 B.4 Beamforming Model](https://www.etsi.org/deliver/etsi_ts/136100_136199/136101/14.03.00_60/ts_136101v140300p.pdf#page=1305)

[MIMO(Multiple Input Multiple Output)](http://www.sharetechnote.com/html/BasicProcedure_LTE_MIMO.html)   

[Precoding](http://www.sharetechnote.com/html/BasicProcedure_LTE_PHY_Precoding.html)  


[Design of Simulation System for LTE-U Using 5 GHz Band in MATLAB](https://link.springer.com/article/10.1007/s11277-018-5660-2)    
<center class="half">
    <img src="https://i.imgur.com/Ds97WJJ.gif" height="230" style="margin-left:0px">
</center> 

首先理解端口的实质：端口是从接受者的角度定义的（下行的接受是UE，上行的接受是基站），一个端口对于接受者来说就认为是一个独立的天线信道；如发送端有4根天线，且是相干的小间距天线，所以只能将这个4个天线定义为一个端口，对于接受端来说，这4根天线与一根没有区别。

在发送端，物理天线（阵元）与逻辑端口之间的对应关系属于内部实现。如上面说，这种映射关系的定义存在一个准则，即：非相干的物理天线（阵元）定义为不同的端口才有意义。  

空间间距大于10波长的阵元可视为非相干天线，对于2G左右的载波，10波长意味着1.5米左右。间距小于0.5波长的阵元视为相干天线，这些天线只能归到一个端口做动态赋型。  

[MIMO and Smart Antennas for Mobile Broadband Systems](http://www.5gamericas.org/files/4614/0622/2152/MIMO_and_Smart_Antennas_July_2013_FINAL.pdf#page=9)  

** “4x2 MIMO” VS “2T4R”   两种表示形式**
MIMO schemes are characterized by the number of antennas transmitting into the air, M, and the number of antennas receiving those same signals at the receiver(s), N; designated as “MxN.” So, for example, the downlink may use, for example, 4 transmit antennas at the base station, and two receive antennas in the terminal, which is referred to as “4x2 MIMO.” The uplink might use one single transmit antenna in the terminal and 4 receive antennas at the base station, for “1x4 SIMO” operation. **The “MxN” refers to the number of antennas in each end of the link (downlink or uplink) and not to the number of antennas at just one end of the link**. As another typical example, an operator uses 2 transmit antennas and 4 receive antennas in the base stations while the terminal uses two receive antennas and one transmit antenna, so the downlink is 2x2 MIMO and the uplink is 1x4 SIMO. The base station is said to have 2T4R and the terminal, 1T2R.  
下行 “4x2 MIMO” ： 基站使用4个发射天线，用户端使用2个接收天线。  
上行 “1x4 SIMO” ： 用户端使用1个发射天线，基站使用4个接收天线。  
这种情况下，我们说  
基站端：4T4R（基站发射时使用4个天线，接收时也使用4个天线）
用户端：1T2R（用户端发射时使用1个天线，接收时使用2个天线）



  
The base station’s scheduler dynamically adapts the modes to adjust the number of streams as the rank of the channel changes with time, and the terminals may be requested to signal back channel state information; or open loop transmit diversity can be used if spatial multiplexing is less effective. The rank refers to how many **separate signal paths** can be **recognized by the receiver**(**接收端**能辨识的独立路径数). Mathematically, this corresponds to the rank of the matrix representing the connectivity of the input to the output antennas – the number of independent paths.  

If all antennas are co-polarized, **in free space or in an anechoic chamber** where there are **no reflections**, the rank collapses to 1 and no MIMO gains can be had.（相同极化的发射天线发射的信号在自由空间中传播， the rank collapses to 1）   

**Polarization diversity increases the rank to the extent to which the channel sustains the independence of the signals transmitted on separate polarizations**. Thus, a cross-polarized transmission pair in the same anechoic chamber can communicate with a cross-polarized pair of receive antennas with a rank of 2.  

We say that the channel is rich in multipath when the rank is high. Mathematically, the rank is limited to the minimum of the number of rows and columns corresponding to the lesser of the number of transmit and receive antennas. Therefore, a 4x2 MIMO system can have a rank of no more than 2, and we can transmit no more than 2 streams to that receive terminal.  

We recognize that currently hand held terminals are limited by power and cost to having a single transmit antenna (at least for a particular carrier frequency) limiting uplink to 1xN SIMO, consequently we **focus on the downlink MIMO operation**.  


<div style="float:right;margin:20px;"><img src="https://i.imgur.com/VlaWc4z.png"  width="" height="280" ></div>
(波束赋形适用的场景) Angle of Arrival (AoA) beamforming schemes form beams which work well **when the base station is clearly above the clutter** and when the angular spread of the arrival is small, corresponding to users that are well localized in the field of view of the sector; in rural areas, for example.   
(**波束赋形使用的列必须是：极化方向相同的列，而且间距不能太大，一般在二分之一左右;  MIMO 使用的列必须是：极化方式不同的列，或者极化方式相同但是间距较远的列**)To form a beam, one uses co-polarized antenna elements spaced rather closely together, typically wavelength/2, while the spatial diversity required of MIMO requires either cross-polarized antenna columns or columns that are relatively far apart.Path diversity will couple more when the antennas columns are farther apart, often about 10 wavelengths (1.5m or 5’ at 2 GHz). That is why most 2G and 3G tower sites have two receive antennas located at far ends of the sector’s platform, as seen in the photo to the right.   
(波束形成的权向量可以通过反馈获得)The signals to be transmitted are multiplied by complex-valued precoding weights from standardized codebooks to form the antenna patterns with their beam-like main lobes and their nulls that can be directed toward sources of interference. The beamforming can be created, for example, by the **UE PMI feedback pointing out the preferred precoder (fixed beam)** to use when operating in the closed loop MIMO mode TM4.   




<center class="half">
    <img src="https://i.imgur.com/DBJ8CpB.png" height="380" style="margin-left:0px"><img src="https://i.imgur.com/ntG1Njy.png" height="380" style="margin-left:0px">
</center>   
<center class="half">
    <img src="https://i.imgur.com/t0Nln2N.jpg" height="480" style="margin-left:0px">
</center> 


In the closed loop MIMO mode, the terminals provide channel feedback to the eNodeB with **Channel Quality Information (CQI), Rank Indications (RI) and Precoder Matrix Indications (PMI)**. These mechanisms enable channel state information at the transmitter which improves the peak data rates, and is the most commonly used scheme in current deployments. However, this scheme provides the best performance only when the channel information is accurate and when there is a rich multi-path environment. Thus, closed loop MIMO is most appropriate in low mobility environments such as with fixed terminals or at pedestrian speeds. 

In the case of high vehicular speeds, Open Loop MIMO may be used, but because the channel state information is not timely, the PMI is not considered reliable and is typically not used. 

[Multiple Antenna Technologies](https://arxiv.org/ftp/arxiv/papers/0909/0909.3342.pdf)   

<center class="half">
    <img src="https://i.imgur.com/hvV67X3.png" height="330" style="margin-left:0px">
</center> 

[LTE Transmission Modes and Beamforming White Paper](https://cdn.rohde-schwarz.com/pws/dl_downloads/dl_application/application_notes/1ma186/1MA186_2e_LTE_TMs_and_beamforming.pdf)  
2.3 Base Station Antennas
<center class="half">
    <img src="https://i.imgur.com/FH0mOI4.png" height="330" style="margin-left:0px">
</center>
At present, conventional **passive** base station antennas are typically made up of multiple **cross-polarized** elements. In the y-axis, multiple elements are combined in order to set the illumination (cell radius).** All elements that have the same polarity radiate the same signal (shown in color at the left antenna of Figure 5)**. Especially relevant for MIMO and beamforming is the arrangement of the cross-polarized elements and the columns in the x-axis. 
看最左边的图：红色的天线单元发射相同的信号。蓝色的天线单元发射相同的信号。相同颜色的4个阵元组成了传统意义上的波束赋形来保证小区的覆盖半径（阵列方向图在垂直方向上被压扁）。

The antenna at the left consists of two elements arranged at 90° to each other (crosspolarized). Each "polarization column" (blue or red) represents an antenna element that can transmit a different signal. This makes it possible to transmit two signals with a compact antenna arrangement, such as for 2x2 MIMO or TX diversity. Analogously, the antenna at the middle can radiate four independent signals (4xN MIMO), while the antenna at the right can radiate eight independent signals (8xN MIMO).

The antennas shown in Figure 5 could also be used for beamforming. However, beamforming requires correlated channels; that is, elements with the same polarization (+45° or –45°) must be used. Also the distance between the columns should not be too large. Beamforming could be carried out with two antenna elements (columns with the same polarization) in the antenna layout in the middle, or with four antenna elements in the layout on the right.  
图5中所示的天线也可用于波束赋形（传统意义上的）。 然而，波束赋形需要相关信道，也就是说，必须使用具有相同极化（+ 45°或-45°）的元件。 列之间的距离也不应太大。 中间的子图，具有相同极化的列为2列，右边的图中具有相同极化的列为4列。每列相同极化的阵元形成一个固定方向图，可以看成一个天线单元，所以中间的图就可以看成2阵元的波束赋形(两个天线端口，每个天线端口对应着一个由2阵元赋形的波束)，右边的图可以看成4阵元的波束赋形(两个天线端口，每个天线端口对应着一个由4阵元赋形的波束)。


>Passive Antenna（“无源天线”或“被动天线”）
Active Antenna (“有源天线”或“主动天线”) 

Base station antenna architectures are currently evolving. Active antennas are an important trend that allow seamless integration of beamforming concepts, e.g. by implementing dedicated transceivers for the required number of antenna elements.（基站天线架构目前正在发展。 有源天线是一种重要的趋势，它允许波束成形概念的无缝集成，例如， 通过为所需数量的天线元件实现专用收发器。谷歌翻译。）






