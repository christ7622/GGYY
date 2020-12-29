# GGYY

gdisk /dev/mmcblk0
Type r for recovery options.
Type l (lowercase L) to load the partition table from the file.
Type w to write the partition table.
If the gdisk prompts a fix for anything, select No.
If the gdisk prompts a confirmation message, select Yes.


#所有空資料底下新增一個檔案
find . -name .git -prune -o -type d -empty -exec touch {}/.gitignore \;

# 消除多餘空白:搜尋\s\n 取代成為\n
DIR /S /A:-D /B /O:N


SELECT * FROM lawOfRetribution
GROUP BY obj, kills, death, obj_time, player_op, game_type
HAVING count(*)>1

SELECT * FROM JordasVerdict
GROUP BY obj, kills, death, obj_time, player_op, game_type
HAVING count(*)>1



git config --global user.email "you@example.com"

git config --global user.name "Your Name"

git config --global color.ui true

git config --global core.editor vim

git config --global merge.tool opendiff

git config --global alias.co commit

git config --global alias.l "log --color --graph --all --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"

git config --global alias.co checkout

git config --global alias.ci commit

git config --global alias.s status

git config --global alias.br branch






# ubuntu 12.04 關閉圖型介面
sudo vim /etc/default/grub

GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
改成
GRUB_CMDLINE_LINUX_DEFAULT="text"

sudo update-grub

sudo reboot





UPDATE JordasVerdict SET system_time_int = UNIX_TIMESTAMP(system_time) 
select from_unixtime()





$ mkdir sdk
$ cd sdk
--------------------------------------Tunnel need--------------------------------------------------------
sdk$ repo init -u ssh://127.0.1.10/manifest -b spd/puma6/atom/general/rel -m manifest-full.xml --mirror
sdk$ repo sync
sdk$ repo forall -c 'git symbolic-ref refs/heads/master refs/heads/spd/puma6/atom/general/rel'
--------------------------------------Tunnel no need-----------------------------------------------------

sdk$ git clone spd/intelcerel-yocto-build
sdk$ source intelcerel-yocto-build/intelce-setup-yocto-build -u file:///home/christ/Share/sdk/spd/intelcerel-meta -b master
sdk$ export TEMPLATECONF=/home/christ/Share/sdk/yocto/meta-intelce/conf

sdk$ vi ~/Share/sdk/yocto/meta-intelce/conf/distro/intelce.conf
a. Change the line INTELCE_SCM_PATH = "git://git-amr-2.devtools.intel.com:29418" to INTELCE_SCM_PATH = "git:///home/christ/Share/sdk/spd".
b. Change the line INTELCE_SRCREV ?= "spd/puma6/atom/general/20150918-2015_ww38_6.0.0.20_r6.0-GA"
c. Change the line INTELCE_PKG_BRANCH ?= "spd/puma6/atom/general/20150918-2015_ww38_6.0.0.20_r6.0-GA"
d. Remove all of the lines at the bottom of the file that start with this prefix: INTEL_SCM_PATH_pn-

sdk$ vi ~/Share/sdk/yocto/meta-intelce/classes/intelce_package.bbclass
INTELCE_SCM_PATH = "git://git-amr-2.devtools.intel.com:29418" to INTELCE_SCM_PATH = "git:///home/christ/Share/sdk/spd"
INTELCE_PKG_BRANCH ?= "spd/puma6/atom/general/20150918-2015_ww38_6.0.0.20_r6.0-GA"
INTELCE_REPO_PREFIX ?= to INTELCE_REPO_PREFIX ?= "intelcerev"
INTELCE_ENABLE_GIT_SSH ?= "yes" to INTELCE_ENABLE_GIT_SSH ?= "no"

sdk/build$ bitbake -k core-image-gateway
After the build is complete, the target processor's kernel and root file system image files are located in the <project_directory>/build/tmp/deploy/images/intelce directory.


"20150918-2015_ww38_6.0.0.20_r6.0-GA" is the BRANCH name can display via the command:
sdk$ git ls-remote spd/intelcerel-utils
sdk$ git ls-remote christ@172.16.0.76:/home/christ/Share/sdk/spd/intelcerel-utils

if encountered the error:  /bin/sh: pushd: not found
$ rm -f /bin/sh
$ ln -s /bin/bash /bin/sh


# ssh login
ssh-keygen
ssh-copy-id christ@172.16.0.76




mkdir user_git_repo
cd user_git_repo/

git clone ssh://christ@172.16.0.76:22/home/christ/Share/sdk/spd/intelcerel-yocto-build
source intelcerel-yocto-build/intelce-setup-yocto-build -u ssh://christ@172.16.0.76:22/home/christ/Share/sdk/spd/intelcerel-meta/ -b ggyy

During a first build, the system downloads many different source code Git* repositories from various upstream projects. This can take a while, particularly if your network connection is slow. The DL_DIR variable indicates what subdirectory these downloaded files are stored in. The default is /project_directory/build/download/.
When wiping and rebuilding, you can preserve this directory to speed up this part of subsequent builds. This directory is also safe to share between multiple builds on the same machine. The default is a downloads directory under TOPDIR, which is the build directory:
DL_DIR ?= "${TOPDIR}/downloads"
git clone ssh://christ@172.16.0.76:22/home/christ/Share/test2/build -b master

Edit the intelce.conf and intelce_package.bbclass files as:
INTELCE_SCM_PATH = "git://christ@172.16.0.76:/home/christ/Share/sdk/spd"
Edit intelce_package.bbclass files as:
INTELCE_ENABLE_GIT_SSH ?= "yes"

export TEMPLATECONF=/home/christ/Share/test3/yocto/meta-intelce/conf
source /home/christ/Share/test3/yocto/oe-init-build-env


BitBake* accelerates builds based on the previously built output by using "shared state" files, which are similar to cache objects. This option determines where those files are placed. When wiping out TMPDIR leaving this directory intact, the build regenerates from these files if no changes were made to the configuration. If changes were made to the configuration, only shared-state files in which the state was still valid would be used (done using checksums).
The default is a state-cache directory under TOPDIR:
SSTATE_DIR ?= "${TOPDIR}/sstate-cache"


# 找build code目錄
bitbake -e virtual/kernel |grep ^S=



# git remote add [shortname] [url]
$ git remote -v


$ git add .
$ git reset .
fatal: Failed to resolve 'HEAD' as a valid ref.

git rm --cached -r .

git push [remote-name] [branch-name]


git pull ssh://christ@172.16.0.76/home/christ/Share/sdk
git reset --hard FETCH_HEAD


git checkout master
git branch new-branch-to-save-current-commits
git fetch --all
git reset --hard origin/master

http://stackoverflow.com/questions/3293607/difference-between-git-head-and-the-current-project-state

# show a list of the files that are being tracked.
git ls-tree -r wayne --name-only


log --pretty=oneline --abbrev-commit --graph --decorate


# show List all the files for a commit in Git 顯示所有commit的檔案
git show --pretty="format:" --name-only 27fde21b3546469646bc64c3cc98cd8d534c37e6


# 複製該commit所有的檔案到test資料夾
cp --parents `git show --pretty="format:" --name-only 25cc164` test
cd test/ && rm -rf * && cd -

git rm --cached file

# 顯示單一commit改動的檔案
git show --pretty="" --name-only 6db514f





# 產生從V1到現在所有的patch
git tag v1

git format-patch v1..HEAD

# 修改commit message
git commit --amend

# 觀看文件變更統計
git log --stat

# 精簡輸出模式
git status -s

# 還原至指定commit(history也會還原)
git reset --hard xxx

# 挽救錯誤的reset
git reflog show master

# 還原到master上一次reset的狀態
git reset --hard master@{1}

# git add 的反向操作
git reset -- filename  or  git reset HEAD filename


# 顯示被忽略的檔案
git status --ignored -s

git ls-files --others -i --exclude-standard


Makefile debug
1. info, error
SOME_VARIABLE := $(SOME_OTHER_VARIABLE)/$(ANOTHER_VARIABLE)
$(info SOME_VARIABLE = $(SOME_VARIABLE)) -> 相當於 echo $(error SOME_VARIABLE = $(SOME_VARIABLE)) -> echo + exit

2. make -p
可以把所有的 target 展開，方便追找不到的 rule




看磁碟空間
df -h 
看檔案大小
du --max-depth=1 -h 


$@ | 工作目標檔名
$% | 程式庫成員結構中的檔名元素.
$< | 第一個必要條件的檔名.
$? | 時間戳記在工作目標(時間戳記)後的所有必要條件, 並以空格隔開這些必要條件.
$^ | 所有必要條件的檔名, 並以空格隔開這些檔名. (這份清單已經拿掉重複的檔名)
$+ | 同上, 但是包含重複的檔名.
$* | 工作目標的主檔名.

# puma6
tftp get 192.168.100.10 0x900000 puma6
cache flush
----------
update -t arm 1

# puma7
tftp -p 0x10000000 -d 192.168.100.10 puma7
update -s 0x10000000


# diff
diff -bur ./ ../er6 --exclude=.git


#ifdef _DEBUG
#define DEBUG(format, args...) printf("[%s:%d] "format, __FILE__, __LINE__, ##args)
#else
#define DEBUG(args...)
#endif


#snmp

void Mib_Snmp_clabWIFIRadioEntry_Set(
{
    /* VT_NUMBER + VT_STRING */
    Int error = NO_ERROR;
    Int32 int32val = VB_GET_INT32(vbp);
    Uint32 uint32val = VB_GET_UINT32(vbp);
    ALENGTH_T len = EBufferUsed(VB_GET_STRING(vbp));
    Uint8 *octetStr = EBufferStart(VB_GET_STRING(vbp));

Int Mib_Snmp_clabWIFIRadioEntry_Get_Value(
{
    /* VT_NUMBER */
    void *data = NULL;
    ALENGTH_T len = 0;
    OCTET_T data_type = VT_NUMBER;
    Int dynamic = 0;
    Int32 int32val = 0;
    Uint32 uint32val = 0;
    data = (void *)&int32val;


{
    OCTET_T *octet = (OCTET_T*)SNMP_memory_alloc(MAX_DYNAM_SIZE);
    if(octet == NULL) return GEN_ERR;
    memset(octet, 0, MAX_DYNAM_SIZE);

    dynamic = 1;
    data = (void *)octet;
    data_type = VT_STRING;
    len = (ALENGTH_T)strlen(octet);
    break;
}
    data = (void *)&uint32val;
    data_type = VT_GAUGE;
    break;

    data = (void *)&uint32val;
    data_type = VT_IPADDRESS;
    break;

    data = (void *)&uint32val;
    data_type = VT_TIMETICKS;
    break;

    data = (void *)&uint64val;
    data_type = VT_COUNTER64;
    break;

INTEGER             VT_NUMBER 
TruthValue          VT_NUMBER
Unsigned32          VT_GAUGE
Integer32           VT_NUMBER
SnmpAdminString     VT_STRING
DateAndTime         VT_STRING
Counter32           VT_COUNTER uint32val
InetAddressType     VT_NUMBER
IpAddress           VT_IPADDRESS uint32val
InetAddress         VT_STRING
RowStatus           VT_NUMBER
OCTET STRING        VT_STRING
MacAddress          VT_STRING   len = (ALENGTH_T)MAC_ADDR_LEN;
InetPortNumber      VT_GAUGE
PhysAddress         VT_STRING
DocsX509ASN1DEREncodedCertificate VT_STRING
BITS                VT_STRING
TimeInterval        VT_NUMBER
DisplayString       VT_STRING
InetAddressIPv6     VT_STRING
Counter64           VT_COUNTER64 uint64val 
TimeTicks           VT_TIMETICKS uint32val


         "This data type defines the CM connectivity state as reported
         by the CM.
         The enumerated values associated with the CmRegState are:
         'other'
          indicates any state not described below.
         'notReady'
          indicates that the CM has not started the registration process
          yet.
         'notSynchronized'
          indicates that the CM has not initiated or completed the
          synchronization of the downstream physical layer
         'phySynchronized'
          indicates that the CM has completed the synchronization of
          the downstream physical layer
         'dsTopologyResolutionInProgress'
          indicates that the CM is attempting to determine its MD-DS-SG
         'usParametersAcquired'
          indicates that the CM has completed the upstream parameters
          acquisition or have completed the downstream and upstream
          service groups resolution, whether the CM is registering in
          a pre-3.0 or a 3.0 CMTS.
         'rangingInProgress'
          indicates that the CM has initiated the ranging process.
         'rangingComplete'
          indicates that the CM has completed initial ranging and
          received a Ranging Status of success from the CMTS in the
          RNG-RSP message.
         'eaeInProgress'
          indicates that the CM has sent an Auth Info message for EAE.
         'dhcpv4InProgress'
          indicates that the CM has sent a DHCPv4 DISCOVER to gain
          IP connectivity.
         'dhcpv6InProgress'
          indicates that the CM has sent an DHCPv6 Solicit message.
         'dhcpv4Complete'
          indicates that the CM has received a DHCPv4 ACK message from
          the CMTS.
         'dhcpv6Complete'
          indicates that the CM has received a DHCPv6 Reply message from
          the CMTS.
         'todEstablished'
          indicates that the CM has successfully acquired time of day.
          If the ToD is acquired after the CM is operational, this
          value should not be reported.
         'securityEstablished'
          indicates that the CM has successfully completed the BPI
          initialization process.
         'configFileDownloadComplete'
          indicates that the CM has completed the config file download
          process.
         'registrationInProgress'
          indicates that the CM has sent a Registration Request
          (REG-REQ or REG-REQ-MP)
         'registrationComplete'
          indicates that the CM has successfully completed the
          Registration process with the CMTS.
         'accessDenied'
          indicates that the CM has received a registration aborted
          notification from the CMTS
         'operational'
          indicates that the CM has completed all necessary
          initialization steps and is operational.
         'bpiInit'
          indicates that the CM has started the BPI initialization
          process as indicated in the CM config file. If the CM already
          performed EAE, this state is skipped by the CM.
         'forwardingDisabled'
          indicates that the registration process was completed, but
          the network access option in the received configuration file
          prohibits forwarding.
         'rfMuteAll'
          indicates that the CM is instructed to mute all channels
          in the CM-CTRL-REQ message from CMTS."
