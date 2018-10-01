## TM (Transmission Modes) ##

 
### **TM1** ###

### **TM7** ###
Beamforming (antenna port 5)
This mode uses UE-specific reference signals (RS). **Both the data and the UE-specific RS are transmitted using the same antenna weightings**. Because the UE requires only the UE-specific RS for demodulation of the PDSCH, the data transmission for the UE appears to have been received from only one transmit antenna, and the UE does not see the actual number of transmit antennas. Therefore, this transmission mode is also called "single antenna port; port 5". The transmission appears to be transmitted from a single "virtual" antenna port 5.
在这里，用户端收到的 UE-specific RS 只能用来评估波束赋形的效果，因为 UE-specific RS 也经历了相同的波束赋形的加权。**接收端UE也无法通过 UE-specific RS 得知发射端所使用的赋形权向量**。发射端形成波束时使用什么样的权向量则需要发射端自己通过其他的途径获得。

(发射端获得波束赋形矢量的方式1：通过收到的上行信号来估计用户方向，这种方法存在一定的困难) There are different algorithms for calculating the optimum beamforming weightings. For example, it is possible to determine the direction of the received uplink signal (DoA or angle of arrival (AoA)), and from that calculate the beamforming weightings.  However, this requires an antenna array with a distance between the individual antenna elements of d ≤ λ/2. It can be difficult to determine the DoA if the angular spread is not small or if there is no dominant direction in the DoA.

(发射端获得波束赋形矢量的方式2：通过上行的 sounding reference signals) Alternatively, it is possible to determine the optimum beamforming weighting from the channel estimation. Because the uplink and downlink take place on the same frequency in a TD-LTE system, the uplink sounding reference signals can be used directly to estimate the channel, which can then be used to derive the weighting for the downlink beamforming. In this case, the beamforming vector is determined by channel estimation, and not from the DoA calculation.

(LTE没有指定用于确定波束成形参数的任何方法) LTE does not specify any methods for determining the beamforming parameters. Other methods, such as beamswitching, are also possible. Also the number of antennas and the antenna architecture are left up to implementation.



### **TM8** ###
[3.2.8 TM 8 – Dual layer beamforming (antenna ports 7 and 8)](https://cdn.rohde-schwarz.com/pws/dl_downloads/dl_application/application_notes/1ma186/1MA186_2e_LTE_TMs_and_beamforming.pdf#page=18)  
Specification of beamforming in LTE continues. While Release 8 of the LTE specification defines beamforming with one layer (as described in the above section), Release 9 specifies dual-layer beamforming. This will permit the base station to weight two layers individually at the antennas so that beamforming can be combined with spatial multiplexing for **one or more UEs**. 

<center class="half">
    <img src="https://i.imgur.com/roRKecD.png" height="430" style="margin-left:0px">
</center>

<center class="half">
    <img src="https://i.imgur.com/SgjpyRg.png" height="230" style="margin-left:0px"><img src="https://i.imgur.com/0UiHrFa.png" height="150" style="margin-left:0px">
</center>

**注意（wwy）**：
>1.每个波束对应一个天线端口，每个波束承载着1层数据流。  
2.每个天线端口的波束怎么形成，似乎不在LTE规范中，这跟TM7一样。
3.如果两层都指定给一个用户，该用户必须至少有两个天线。这样才能将传输的两层分开，进而进行合并。如果两层是相同的信息，则是空间分集，合并后会有分集增益； 如果两层是不同的信息，则是空间复用。  
4.如果两个波束分别分给两个UE，那么每个UE需要几个天线呢？ 如果两个UE不位于同一个波束内，并且在波束赋形时能保证主瓣和零陷的位置，这种情况下似乎UE只有一个天线也可以。否则，UE应该需要两个天线，从而将两层分开，从而取出自己的一层。  


### **TM 9** ###
[3.2.9 TM 9 – Up to 8 layer transmission (antenna ports 7 - 14)](https://cdn.rohde-schwarz.com/pws/dl_downloads/dl_application/application_notes/1ma186/1MA186_2e_LTE_TMs_and_beamforming.pdf#page=25)  
(最多可以到8层，实际使用的层数可以动态定义) Release 10 adds Transmission Mode 9. In this mode up to eight layers can be used, so up to eight physical transmit antennas are needed, this leads to up to 8x8 MIMO configurations. The number of used layers may be defined dynamically. The virtual antenna ports 7…14 are used.

(可以是 SU-MIMO，也可以是 MU-MIMO) Both single user (SU) and multi user (MU) MIMO is possible, dynamic switching between both modes is possible without special signaling by higher layers.  


<center class="half">
    <img src="https://i.imgur.com/m9NkPqr.png" height="430" style="margin-left:0px">
</center>


(UE不需要在上行信号中发送PMI来指示基站选择哪个预编码矩阵，UE也不需要提前知道基站使用的预编码。UE能够从UE-specific DM-RS推断出预编码矩阵。UE-specific DM-RS**在预编码之前**被插入数据流，UE将收到的UE-specific DM-RS与本地已知的UE-specific DM-RS进行对比即可知道基站发送信号时使用的预编码矩阵。) The UE-specific DM-RS is applied to the data streams **before the precoding**. That means the UE receives the known RS which is precoded and transmitted via the channel. Thus the **receiver does not need to know the used precoding in advance**. There is no need to use special codebooks anymore, **the UE does not send back the the PMI**. In other words the spatial multiplexing is able to use the full range of weighting (precoding) for beamforming now, not only discrete precoding via the codebook like in TM3…6.  

**注意（wwy）**：
>1. 每个端口**可能**对应一个传统方式赋形的波束，该波束的赋形方法不在LTE的规范中。每个波束可以由若干个天线加权形成，对接收端UE来说，每个波束的加权矢量不可分辨，每个波束为最小的分辨单位，相当于一个发射天线(天线端口)。如果基站的物理天线个数跟逻辑的天线端口数相同，则不在存在传统的波束赋行过程。
2. 如果天线端口数和物理天线个数相同，并且所有的层都分配给同一个用户，并且每层上面传相同的信息，这时预编码的效果跟传统的波束赋形基本相同。比如发射端4个天线，接收端4个天线，发射层数为4层，接收端接收到信号后将4层数据分开并进行最大合并，这就相当于发射波束和接收波束对准形成了波束增益。略微不同的是，传统波束赋形对天线间距的要求，不同天线端口对应的物理天线的间距一般会远远大于传统波束赋形的天线间距。这时，通过预编码形成的阵列方向图可能会有很多的波峰，从而形成对其他用户的干扰。所以在这种模式下，预编码矩阵必须要经过仔细设计。   

<center class="half">
    <img src="https://i.imgur.com/e4Ws8Lq.png" height="260" style="margin-left:0px"><img src="https://i.imgur.com/sJxWkzQ.png" height="260" style="margin-left:0px">
</center>

### TM 10 ###
3.2.10 TM 10 – Up to 8 layer transmission (antenna ports 7 - 14)  

**Release 11** adds Transmission Mode 10. **This mode is similar to TM9** (see 3.2.9). Again, up to eight layers can be used, so up to eight physical transmit antennas are needed, this leads to up to 8x8 MIMO configurations. The number of used layers may be defined dynamically. The virtual antenna ports 7…14 are used. TM10 uses the same reference signals like TM9, see figure 18.

**The main difference to TM9 is the used DCI format (2D)**. With TM10** Coordinated Multi Point Transmission (CoMP, see [10]) is supported**. CoMP uses in principle the same MIMO technique like TM9, but **the transmit antennas may be physically on different base station sites**. DCI format 2D allows to tell the UE, that it can assume a quasi colocation of the antenna ports with respect to Doppler shift, Doppler spread, average delay, and delay spread.

跟TM9类似，不同是TM10增加了多点协同传输功能。

[MIMO十年之路](http://www.52rd.com/S_TXT/2017_7/TXT97484.HTM?WebShieldDRSessionVerify=scY2toB3WIlVBo0lmclK)  

[LTE-Advanced Release 13 Multiple Antenna Technologies and ...](https://www.nttdocomo.co.jp/english/binary/pdf/corporate/technology/rd/technical_journal/bn/vol18_2/vol18_2_010en.pdf)  


[☆ 波束赋形 vs. 预编码](http://www.txrjy.com/thread-784438-1-1.html)  

**Angle Spread**
由于多径反射、散射，信号在接收天线上的到达角度会展宽，称为角度扩展。

[LTE Channel State Information (CSI)](https://www.keysight.com/upload/cmc_upload/All/31May2012_LTE.pdf)  

[5G;Study on New Radio (NR) access technology (3GPP TR 38.912 version 14.0.0 Release 14 8.3.1.6 Multi-antenna scheme)](https://www.etsi.org/deliver/etsi_tr/138900_138999/138912/14.00.00_60/tr_138912v140000p.pdf)   

## 3GPP: 组织结构和协议 ##
[3GPP: 组织结构和协议查找小技巧](https://blog.csdn.net/milkbusy/article/details/80834014)   

[[通信标准] 3GPP 如何查询及常用规范列表！（下载方法）](http://txrjy.com/thread-1032340-1-1.html)   

[3GPP资源使用、查找教程](https://blog.csdn.net/jxwxg/article/details/73520841)   

## 5G NR 码本 ##
[码本](https://blog.csdn.net/zhihuiyu123/article/details/79294251)  

[5G NR详解，看完秒变大神](http://op.inews.qq.com/m/20180116A0R15Y00?refer=100000355&chl_code=kb_news_tech&h=0)

增强的多天线技术

5G NR引入了多项多天线增强技术，大幅提高了频谱效率、小区覆盖和系统灵活性。

提高频谱效率：

对于单用户而言，**基于非码本的上行传输机制**，减少了前代通信技术使用码本进行预编码，所产生的量化误差，可提供更精确的信道信息，有效的增强上行频谱效率；

对于多用户而言，相对于LTE所支持的4流，5G NR上下行支持正交12流的多用户配对，并且通过增强的干扰测量和反馈技术，可显著提高上下行频谱效率。

对于TDD来说，探测参考信号 （SRS） 可以在不同的载波之间，或者同一载波的不同天线之间切换发送，利用信道互易性，进一步提升TDD系统的信道反馈精度和频谱效率；  

增强小区覆盖：

**5G NR采用波束赋型的测量和反馈机制**，可同时应用于初始接入、控制和数据信道。波束赋型（Beamforming）是多天线技术的一种，是指gNodeB/UE对PDSCH/PUSCH（Physical Downlink /Uplink Shared CHannel）上/下行信号进行加权，形成对准UE/gNodeB的窄波束，将发射能量对准目标用户，从而提高目标UE/gNodeB的解调信噪比。

**对于初始接入来说，改进了LTE时期基于广播的机制，升级为基于波束赋型的机制**，从而提高了系统覆盖率；采用波束赋形，可增强控制信道的覆盖范围，从而扩大了小区半径，也可以提高传输成功率，尤其适应于高频传输。

此外，还有增强的导频设计，如解调导频、相位跟踪导频和时频跟踪导频，相对于LTE来说，可以有效地减小开销，提供更精确信道的信息。

[5G New Radio –Technology and Performance](http://mmwrcn.ece.wisc.edu/wp-uploads/2017/05/5G-NR-Ghosh-Nokia-Keynote.pdf) 
<center class="half">
    <img src="https://i.imgur.com/zK9hhAF.png" height="230" style="margin-left:0px"><img src="https://i.imgur.com/FS5sSQ6.png" height="230" style="margin-left:0px">
</center> 
<center class="half">
    <img src="https://i.imgur.com/zLhbtmC.png" height="230" style="margin-left:0px"><img src="https://i.imgur.com/7YDvlRH.png" height="230" style="margin-left:0px">
</center>   

<center class="half">
    <img src="https://i.imgur.com/HDYWWV9.png" height="230" style="margin-left:0px">
</center>  


[5G New Radio Design](http://www.ieeevtc.org/conf-admin/vtc2017fall/51.pdf)  
<center class="half">
    <img src="https://i.imgur.com/XHvcgQN.png" height="330" style="margin-left:0px">
</center>  


>1. 高分辨率的CSI feedback的目的是做MU-MIMO。
>2. **Tpye II Codebooks 需要 Non-precoded 以及 precoded CSI-RS。**


[Full Dimension MIMO for LTE-Advanced and 5G](http://www.ita.ucsd.edu/workshop/15/files/paper/paper_3822.pdf)  
This paper will give introduction on newly developed 3D channel models , current development of FD-MIMO scenarios, antenna and RF (radio frequency) transceiver architecutres and potential performance benefits. In addition, **challenges related to channel state information (CSI) feedback** will be discussed. Candidate methods for reducing CSI feedback overhead will be introduced.

<center class="half">
    <img src="https://i.imgur.com/Vl07gMA.png" height="480" style="margin-left:0px">
</center>

[Understanding 5G Standards](https://wireless.engineering.nyu.edu/presentations/5GStandards_IEEE.pdf)   

http://www.5gsummit.org/hawaii/docs/slides/Amitava-Ghosh.pdf
http://www.microwavejournal.com/ext/resources/pdf-downloads/chapter1-Spirent.pdf#page=15

[5G NR: Key features and enhancements](https://www.slideshare.net/3G4GLtd/5g-nr-key-features-and-enhancements)  

![](https://i.imgur.com/9LMLo1l.png)
![](https://i.imgur.com/3HUFNpy.jpg)
![](https://i.imgur.com/WRqLW6x.jpg)
![](https://i.imgur.com/Iph5p3c.png)
![](https://i.imgur.com/xnzamu6.png)
![](https://i.imgur.com/8v73usn.jpg) 
![](https://i.imgur.com/OM0YAco.jpg)


https://books.google.com/books?id=SKtTDwAAQBAJ&pg=PA295&lpg=PA295&dq=TRP+(Tx/Rx+Point)&source=bl&ots=nUOv_0ENky&sig=LzW0IOq5J4C3OO87HcsMWJw5SrI&hl=en&sa=X&ved=2ahUKEwj_u5e3huPdAhVihOAKHWW0A1YQ6AEwBXoECAMQAQ#v=onepage&q=TRP%20(Tx%2FRx%20Point)&f=false

![](https://i.imgur.com/WQdQvDh.png)

>1. RI: describing the rank of the MIMO channel, i.e., the number of sufficiently spatially separable channels.  
>2. PMI: describing the preferred from a set of pre-defined codebooks.  
>3. CQI: Used for adaptive transmission and multi-user scheduling.  

![](https://i.imgur.com/gxNO41x.png)

>L1: refers to the PHY sublayer
>L2: refers to MAC/PLC/PDCP sublayers

![](https://i.imgur.com/wiLioCD.png)
![](https://i.imgur.com/om0KBDA.png)

> 1. 对NR来说，每个PDSCH信道分配给一个UE的码字数量为1个或2个。1个码字可以用1~4层传输，2个码字可以用5~8层传输。
> 2. 支持基于DL DMRS的空间复用。对于SU-MIMO，至少支持8个正交的DL DMRS端口。


![](https://i.imgur.com/prxB5Qj.png)

>1. 支持两种类型的 CSI feedback。 
>2. Type I CSI feedback 跟 3GPP LTE 一样，反馈PMI，normal的空间分辨率。PMI 码本至少有两个阶段，第一个阶段...。 Type I feedback 至少包括Resource slection indicator,RI,PMI,Channel quality。它还支持 multi-panel scenarios...
>3. Type II CSI feedback 是一种增强的 CSI feedback 方案。可以进行 explicit feedback (直接反馈码本而不是码本的序号？这样的话需要许多的开销) 以及 基于码本的反馈，它们具有更高空间分辨率。


Type II CSI 至少需要支持下面三种情况中的一种，
>1. 
>2. 
>3. 


![](https://i.imgur.com/UW468Tp.png)



[解读Ericsson的3GPP LTE Release 13技术白皮书](http://www.istis.sh.cn/list/list.aspx?id=8681)   


[Release 13 Multiple Antenna Technologies](https://www.nttdocomo.co.jp/english/binary/pdf/corporate/technology/rd/technical_journal/bn/vol18_2/vol18_2_010en.pdf)

**搜索关键词：CSI n1 n2 o1 o2**
[MIMO Status in 3GPP](http://std-share.itri.org.tw/Content/Files/Event/Files/1.Elevation%20Beamforming%20and%20Full%20Dimension.pdf)   

[](http://qaistc.com/2017/wp-content/uploads/2017/09/test_strategy_towards_massive_mimo.pptx)

![](https://i.imgur.com/x5JpFco.png)
![](https://i.imgur.com/aYmRcHB.png)

Two types of CSI-RS transmission,  
>CLASS-A (Non-Precoded)  
CLASS-B (Beamformed)  

Class-A  or Class-B is configurable by higher layers  

**Class-A**

Codebook Config for Non-precoded type  
Number of CSI-RS ports determined by codebookconfig  
>(N1, N2) corresponds to number of antenna ports **per polarization**
(O1, O2) corresponds to spatial over-sampling rate in dimension x

(N1, N2) 天线端口为N1行N2列，即垂直方向的天线端口为N1个，水平方向的天线端口为N2个。
(O1, O2) 确定扫描波束的个数，垂直方向用O1个波束扫描，水平方向由O2个波束扫描。

![](https://i.imgur.com/doYe6t9.png)

Class-A type supports total upto 32 CSI-RS Antenna ports.


**Class-B **

1. Beamformed CSI-RS transmission (Class-B)   
2. Precoded like DMRS (跟DMRS一样经历预编码过程)    
3. Dedicated to selected UEs (专用于选定的UE)   
4. UE通过测量多个Beamformed CSI-RS来选择波束（可能是分时发送的），并反馈给基站。   
5. Base station schedules data based on CRI+CSI feedback(基站根据CRI + CSI反馈来调度数据)   

![](https://i.imgur.com/dtSbFVF.jpg)

Scenario of Class-A and Class-B transmission  
1. Class-A: (当基站不知道UE信道条件时) Applicable when base station does not have current awareness of UE channel condition (during scheduling request for DL traffic). This is applicable for cell-center UEs.   
2. Class-B: (基站和UE已经建立连接，基站已经知道该UE的信道条件，当UE移动时，用作波束切换的测量；或者UE收到class-A CSI-RS后上报了较差的CSI，这时基站发送Class-B CSI-RS，以便UE来选择较好的波束，并反馈给基站) Applicable when base station has current awareness of UE channel condition (during on-going traffic with moving users) or UE reporting bad CSI in class-A because of cell edge. This also increases cell coverage area.   

![](https://i.imgur.com/LMZzFC4.png)

[MIMO ADAPTIVE CODEBOOK FOR CLOSELY SPACED ANTENNA ARRAYS](https://www.eurasip.org/Proceedings/Eusipco/Eusipco2011/papers/1569422769.pdf)  

We discuss the design of a double structure codebook, in which the final precoding codeword is obtained as the product of codewords from two separate codebooks.  
>1. The first codeword W1, representing long-term and wideband channel properties.  
2. the second one W2, representing short-term and narrowband properties.

We study optimization of both codebooks, and discuss low complexity codeword selection algorithms to allow increased quantization granularity (量化粒度) for the first codeword.  

Closed-loop MIMO transmission schemes are currently widely used in wireless industrial standards.    


However, **the large number of antennas brings new challenges** for closed-loop MIMO systems. The precoding space is growing with the increasing number of antennas while feedback remains limited to a small number of bits.   

Such large antenna arrays are typically implemented with closely spaced antennas, for example as uniform linear arrays (ULA) or cross-polarized (XP) linear antenna arrays, both of which have the advantage of being compact and therefore easy to deploy. The properties of such **closely spaced arrays may be taken into account** in the feedback design. Specifically, such arrays impose certain kind of **spatial correlation effectively limiting the precoding space**.   


Several techniques have been developed that employ the spatial covariance matrix R or the long-term channel mean to **adjust the codebook according to the correlation**.  

we feedback **codeword W1 consisting of M beams** such that the beams cover almost the full signal space over the wideband with closely spaced arrays, hence capturing the  correlation properties of the channel. Then, **the second codeword W2 combines the beams for each sub-band**. This double structure codeword W = W1W2 is simple and can adapt to angular spread of the channel by covering the instantaneous subspace over the entire band.

wwy:
1. 波束方向图是还有一维频率参数，所以有宽带波束赋形的概念。
2. **W1和W2都是矩阵**。



**transceiver unit (TXRU)**
**TX---发**
**RX---收**
**ISD (Inter-site distance) **
intersite distance: 站点间距离
**TRP (Tx/Rx Point)**
**TRP Transmission Reception Point**

## MIMO 参考信号 ##
**Multiple orthogonal DMRSs** can be allocated to support MIMO transmission.
**Sounding Reference Signal (SRS)**
As a UL-only signal, the SRS is transmitted by the UE to help the gNB obtain the channel state information (CSI) for each user. Channel State Information describes how the NR signal propagates from the UE to the gNB and represents the combined effect of scattering, fading, and power decay with distance. The system uses the SRS for resource scheduling, link adaptation, Massive MIMO, and beam management.
**Channel State Information Reference Signal (CSI-RS)**
As a DL-only signal, the CSI-RS the UE receives is used to estimate the channel and report channel quality information back to the gNB. During MIMO operations, NR uses different antenna approaches based on the carrier frequency.

### CSI reference signals ###
[3GPP TS 38.211 7.4.1.5 CSI reference signals ](https://www.etsi.org/deliver/etsi_ts/138200_138299/138211/15.02.00_60/ts_138211v150200p.pdf#page=90)  

The UE **is not expected** to receive CSI-RS and DM-RS on the same resource elements.

The UE shall assume that a CSI-RS is transmitted using antenna ports p numbered according to  

>p=3000+s+jL;  
j=0,1,...,N/L-1  
s=0,1,...,L-1  

L∈{1,2,4,8} is the CDM group size, and N is the number of CSI-RS ports.      
The CDM groups are numbered in order of increasing frequency domain allocation first and then increasing time domain allocation.

## Beam Management Implementation in 5G NR ##
[5G NR Beam Managament SA, NSA | Beam Management in 5G NR](http://www.rfwireless-world.com/5G/5G-NR-Beam-Management.html)   
This page describes 5G NR Beam Management basics in **IDLE and CONNECTED modes**. It mentions Beam management operations viz. beam sweeping, beam measurement, beam determination and beam reporting. It mentions 5G NR beam management frameworks for **NSA (Non StandAlone) and SA (StandAlone) modes**
> beam sweeping,   
> beam measurement,   
> beam determination and   
> beam reporting

5G NR supports FR1 and FR2 frequency bands. FR1 is sub-6 GHz, from 450 to 6000 MHz where as FR2 is mmwave band (from 24.25 GHz to 52.6 GHz).   

(在毫米波频段，天线阵列的作用: 提供阵列增益和空间复用) As the **mmwave band **uses very high frequency, it leads to propagation loss and other losses. To compensate for the losses, directional communication is essential at such frequencies. Antenna arrays with large number of antenna elements make it possible due to smaller wavelengths. This concept provide **beamforming gain to the RF link budget which helps in compensation of propagation loss**. Moreover, large antenna array helps to achieve higher data rate due to **spatial multiplexing** technique.

These directional links require accurate alignment of transmitted and received beams. In order to achieve alignment(对准) of beam pair and to have required end to end performance with desired delay, beam management operations are introduced in the 5G NR. Beam management operations are essential during **Initial Access (i.e. IDLE mode)** when UE is not in connection with gNB and during **tracking (i.e. CONNECTED mode)** when UE is exchanging data with the gNB (i.e. network).

Beam management procedure is used in 5G NR in order to **acquire and maintain a set of TRxP (s) and/or UE beams** which can be used for DL and UL transmission/reception. **TRxP stands for Transmission Reception Point**.(什么是Transmission Reception Point？似乎与多点协同传输的概念有关)

>Coordinated Multi-Point (CoMP) transmission and reception: By coordinating and combining signals from **multiple antennas**, CoMP, will make it possible for mobile users to ...


<center class="half">
    <img src="https://i.imgur.com/RrdZeBz.png" height="380" style="margin-left:0px">
</center>



<div style="float:right;margin:20px;"><img src="https://i.imgur.com/Wio9vff.jpg"  width="" height="280" ></div>

Following operations are performed in 5G NR beam management procedure. They are applied to both the modes viz. SA (StandAlone) and NSA (Non StandAlone).   

>1. Beam Sweeping: It refers to covering a spatial area with a set of beams transmitted and received according to pre-specified intervals and directions.	
>2. Beam measurement: It refers to evaluation of the quality of the received signal at the gNB or at the UE. Different metrics(指标) could be used such as RSRP, RSRQ and SINR or SNR for this purpose.	
>3. Beam determination: It refers to the selection of the suitable beam or beams either at the gNB or at the UE, according to the measurements obtained with the beam measurement procedure.	
>4. Beam reporting: It refers to the procedure used by the UE to send beam quality and beam decision information to the Radio Access Network (RAN).  


----------


• It uses PSS/SSS/PBCH DMRS (i.e. SSB) during **IDLE mode**.
• It uses **CSI-RS** (in the downlink) and **SRS** (in the uplink) during **CONNECTED mode**.

DOWNLINK SIGNAL MEASUREMENTS FOR BEAM MANAGEMENT(下行)
>Using SS Blocks: Here DMRS (Demodulation Reference Signal) associated with PBCH channel is used to estimate **RSRP (Reference signal received power)** is calculated from the received SS blocks at the UE.   
>Using CSI-RS

UPLINK SIGNAL MEASUREMENTS FOR BEAM MANAGEMENT
>Using SRS: Sounding Reference Signals (i.e.SRSs) are transmitted by UEs and received by gNB. These signals are used to monitor uplink channel quality. UEs are configured with **multiple SRSs** for beam management purposes.   


![](https://i.imgur.com/lD4w6WN.png)
![](https://i.imgur.com/Do4rkPS.png)

![](https://i.imgur.com/LnLLw8X.png)


## 发射分集 ##
**接收端可以单天线接收**。
[无线通信中的发射分集技术](https://wenku.baidu.com/view/721a5a2158fb770bf78a555f.html)     

[36.211 6.3.4.3 Transmit diversity](https://www.etsi.org/deliver/etsi_ts/136200_136299/136211/14.02.00_60/ts_136211v140200p.pdf#page=91)   

[Diversity Schemes In LTE](https://communities.theiet.org/blogs/426/419)   


</br></br></br></br></br></br></br></br>
</br></br></br></br></br></br></br></br>
</br></br></br></br></br></br></br></br>