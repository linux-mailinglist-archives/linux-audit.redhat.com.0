Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8B8D32BBBA0
	for <lists+linux-audit@lfdr.de>; Sat, 21 Nov 2020 02:39:15 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-h-MZPLjbO7u9MaTpTdhD6Q-1; Fri, 20 Nov 2020 20:39:09 -0500
X-MC-Unique: h-MZPLjbO7u9MaTpTdhD6Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57CBF1DDED;
	Sat, 21 Nov 2020 01:39:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 330CA60BD8;
	Sat, 21 Nov 2020 01:39:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D37C34EEF6;
	Sat, 21 Nov 2020 01:39:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AL0beCW001186 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 19:37:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 11F5C10E60FB; Sat, 21 Nov 2020 00:37:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C532101F0C5
	for <linux-audit@redhat.com>; Sat, 21 Nov 2020 00:37:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3109103B801
	for <linux-audit@redhat.com>; Sat, 21 Nov 2020 00:37:37 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-301-CtEs685hMqG8ntQmIvs9lg-1; Fri, 20 Nov 2020 19:37:33 -0500
X-MC-Unique: CtEs685hMqG8ntQmIvs9lg-1
IronPort-SDR: vndZCSucjIT93m7pO4cAE8pZY/+rQj6W6D+Mf0YhakBiigmYSus7adF23ZGpweqtVPlbtY4pMY
	YJWuRz0r22yQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9811"; a="235707327"
X-IronPort-AV: E=Sophos;i="5.78,357,1599548400"; 
	d="gz'50?scan'50,208,50";a="235707327"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	20 Nov 2020 16:37:31 -0800
IronPort-SDR: LbQnR6/KmqZz9QFg3mgsdLyVeA+1wsfFpCgQafFLWTGUUuT/Cas5DJAxaynUyBM4xR8oFXXDY1
	1iQeWeSaOnDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,357,1599548400"; 
	d="gz'50?scan'50,208,50";a="342223924"
Received: from lkp-server01.sh.intel.com (HELO 00bc34107a07) ([10.239.97.150])
	by orsmga002.jf.intel.com with ESMTP; 20 Nov 2020 16:37:27 -0800
Received: from kbuild by 00bc34107a07 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1kgGu6-00008O-OI; Sat, 21 Nov 2020 00:37:26 +0000
Date: Sat, 21 Nov 2020 08:36:27 +0800
From: kernel test robot <lkp@intel.com>
To: Casey Schaufler <casey@schaufler-ca.com>, casey.schaufler@intel.com,
	jmorris@namei.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org
Subject: Re: [PATCH v23 19/23] audit: add support for non-syscall auxiliary
	records
Message-ID: <202011210807.nc2aEN7W-lkp@intel.com>
References: <20201120201507.11993-20-casey@schaufler-ca.com>
MIME-Version: 1.0
In-Reply-To: <20201120201507.11993-20-casey@schaufler-ca.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 20 Nov 2020 20:38:50 -0500
Cc: john.johansen@canonical.com, kbuild-all@lists.01.org,
	clang-built-linux@googlegroups.com, linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline

--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Casey,

I love your patch! Perhaps something to improve:

[auto build test WARNING on nf/master]
[also build test WARNING on linus/master v5.10-rc4 next-20201120]
[cannot apply to nf-next/master security/next-testing]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Casey-Schaufler/LSM-Module-stacking-for-AppArmor/20201121-044616
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf.git master
config: x86_64-randconfig-a011-20201120 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 3ded927cf80ac519f9f9c4664fef08787f7c537d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # https://github.com/0day-ci/linux/commit/3b464b0251cffe5ac73c81b701fd8d146664a7a3
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Casey-Schaufler/LSM-Module-stacking-for-AppArmor/20201121-044616
        git checkout 3b464b0251cffe5ac73c81b701fd8d146664a7a3
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:68:
   In file included from include/net/xfrm.h:15:
   include/linux/audit.h:563:1: error: expected external declaration
   +static inline struct audit_context *audit_alloc_local(gfp_t gfpflags)
   ^
>> drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:6693:30: warning: shift count >= width of type [-Wshift-count-overflow]
           if (!pci_set_dma_mask(pdev, DMA_BIT_MASK(64))) {
                                       ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:6695:43: warning: shift count >= width of type [-Wshift-count-overflow]
                   err = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64));
                                                           ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   2 warnings and 1 error generated.

vim +6693 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c

76f919ebffe2f66 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ayush Sawal          2020-09-09  6606  
1dd06ae8db716e1 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Greg Kroah-Hartman   2012-12-06  6607  static int init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6608  {
e8d452923ae6cdc drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-05-24  6609  	struct net_device *netdev;
e8d452923ae6cdc drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-05-24  6610  	struct adapter *adapter;
e8d452923ae6cdc drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-05-24  6611  	static int adap_idx = 1;
e8d452923ae6cdc drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-05-24  6612  	int s_qpp, qpp, num_seg;
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6613  	struct port_info *pi;
c8f44affb7244f2 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Michał Mirosław      2011-11-15  6614  	bool highdma = false;
d86bd29e0b31f30 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-08-04  6615  	enum chip_type chip;
e8d452923ae6cdc drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-05-24  6616  	void __iomem *regs;
e8d452923ae6cdc drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-05-24  6617  	int func, chip_ver;
e8d452923ae6cdc drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-05-24  6618  	u16 device_id;
e8d452923ae6cdc drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-05-24  6619  	int i, err;
e8d452923ae6cdc drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-05-24  6620  	u32 whoami;
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6621  
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6622  	err = pci_request_regions(pdev, KBUILD_MODNAME);
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6623  	if (err) {
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6624  		/* Just info, some other driver may have claimed the device. */
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6625  		dev_info(&pdev->dev, "cannot obtain PCI resources\n");
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6626  		return err;
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6627  	}
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6628  
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6629  	err = pci_enable_device(pdev);
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6630  	if (err) {
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6631  		dev_err(&pdev->dev, "cannot enable PCI device\n");
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6632  		goto out_release_regions;
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6633  	}
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6634  
d6ce2628f32271c drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2014-09-16  6635  	regs = pci_ioremap_bar(pdev, 0);
d6ce2628f32271c drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2014-09-16  6636  	if (!regs) {
d6ce2628f32271c drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2014-09-16  6637  		dev_err(&pdev->dev, "cannot map device registers\n");
d6ce2628f32271c drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2014-09-16  6638  		err = -ENOMEM;
d6ce2628f32271c drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2014-09-16  6639  		goto out_disable_device;
d6ce2628f32271c drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2014-09-16  6640  	}
d6ce2628f32271c drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2014-09-16  6641  
baf5086840ab181 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-16  6642  	adapter = kzalloc(sizeof(*adapter), GFP_KERNEL);
baf5086840ab181 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-16  6643  	if (!adapter) {
baf5086840ab181 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-16  6644  		err = -ENOMEM;
baf5086840ab181 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-16  6645  		goto out_unmap_bar0;
baf5086840ab181 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-16  6646  	}
baf5086840ab181 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-16  6647  
baf5086840ab181 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-16  6648  	adapter->regs = regs;
8203b509c5b7aab drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2014-10-09  6649  	err = t4_wait_dev_ready(regs);
8203b509c5b7aab drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2014-10-09  6650  	if (err < 0)
e729452ec333042 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Christophe JAILLET   2018-02-06  6651  		goto out_free_adapter;
8203b509c5b7aab drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2014-10-09  6652  
d6ce2628f32271c drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2014-09-16  6653  	/* We control everything through one PF */
e8d452923ae6cdc drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-05-24  6654  	whoami = t4_read_reg(adapter, PL_WHOAMI_A);
e8d452923ae6cdc drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-05-24  6655  	pci_read_config_word(pdev, PCI_DEVICE_ID, &device_id);
e8d452923ae6cdc drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-05-24  6656  	chip = t4_get_chip_type(adapter, CHELSIO_PCI_ID_VER(device_id));
286183147666fb7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Dan Carpenter        2019-09-25  6657  	if ((int)chip < 0) {
e8d452923ae6cdc drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-05-24  6658  		dev_err(&pdev->dev, "Device %d is not supported\n", device_id);
e8d452923ae6cdc drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-05-24  6659  		err = chip;
e8d452923ae6cdc drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-05-24  6660  		goto out_free_adapter;
e8d452923ae6cdc drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-05-24  6661  	}
e8d452923ae6cdc drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-05-24  6662  	chip_ver = CHELSIO_CHIP_VERSION(chip);
e8d452923ae6cdc drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-05-24  6663  	func = chip_ver <= CHELSIO_T5 ?
d86bd29e0b31f30 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-08-04  6664  	       SOURCEPF_G(whoami) : T6_SOURCEPF_G(whoami);
baf5086840ab181 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-16  6665  
baf5086840ab181 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-16  6666  	adapter->pdev = pdev;
baf5086840ab181 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-16  6667  	adapter->pdev_dev = &pdev->dev;
baf5086840ab181 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-16  6668  	adapter->name = pci_name(pdev);
baf5086840ab181 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-16  6669  	adapter->mbox = func;
baf5086840ab181 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-16  6670  	adapter->pf = func;
016764de8b0d17e drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-03-07  6671  	adapter->params.chip = chip;
016764de8b0d17e drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-03-07  6672  	adapter->adap_idx = adap_idx;
baf5086840ab181 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-16  6673  	adapter->msg_enable = DFLT_MSG_ENABLE;
baf5086840ab181 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-16  6674  	adapter->mbox_log = kzalloc(sizeof(*adapter->mbox_log) +
baf5086840ab181 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-16  6675  				    (sizeof(struct mbox_cmd) *
baf5086840ab181 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-16  6676  				     T4_OS_LOG_MBOX_CMDS),
baf5086840ab181 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-16  6677  				    GFP_KERNEL);
baf5086840ab181 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-16  6678  	if (!adapter->mbox_log) {
baf5086840ab181 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-16  6679  		err = -ENOMEM;
baf5086840ab181 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-16  6680  		goto out_free_adapter;
baf5086840ab181 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-16  6681  	}
baf5086840ab181 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-16  6682  	spin_lock_init(&adapter->mbox_lock);
baf5086840ab181 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-16  6683  	INIT_LIST_HEAD(&adapter->mlist.list);
aca06eafd09f48c drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-05-09  6684  	adapter->mbox_log->size = T4_OS_LOG_MBOX_CMDS;
baf5086840ab181 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-16  6685  	pci_set_drvdata(pdev, adapter);
baf5086840ab181 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-16  6686  
d6ce2628f32271c drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2014-09-16  6687  	if (func != ent->driver_data) {
d6ce2628f32271c drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2014-09-16  6688  		pci_disable_device(pdev);
d6ce2628f32271c drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2014-09-16  6689  		pci_save_state(pdev);        /* to restore SR-IOV later */
baf5086840ab181 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-16  6690  		return 0;
d6ce2628f32271c drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2014-09-16  6691  	}
d6ce2628f32271c drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2014-09-16  6692  
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01 @6693  	if (!pci_set_dma_mask(pdev, DMA_BIT_MASK(64))) {
c8f44affb7244f2 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Michał Mirosław      2011-11-15  6694  		highdma = true;
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6695  		err = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64));
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6696  		if (err) {
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6697  			dev_err(&pdev->dev, "unable to obtain 64-bit DMA for "
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6698  				"coherent allocations\n");
baf5086840ab181 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-16  6699  			goto out_free_adapter;
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6700  		}
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6701  	} else {
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6702  		err = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6703  		if (err) {
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6704  			dev_err(&pdev->dev, "no usable DMA configuration\n");
baf5086840ab181 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-16  6705  			goto out_free_adapter;
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6706  		}
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6707  	}
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6708  
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6709  	pci_enable_pcie_error_reporting(pdev);
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6710  	pci_set_master(pdev);
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6711  	pci_save_state(pdev);
7829451c695e5b7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2016-08-11  6712  	adap_idx++;
29aaee65bc28cc7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Anish Bhatt          2014-08-20  6713  	adapter->workq = create_singlethread_workqueue("cxgb4");
29aaee65bc28cc7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Anish Bhatt          2014-08-20  6714  	if (!adapter->workq) {
29aaee65bc28cc7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Anish Bhatt          2014-08-20  6715  		err = -ENOMEM;
29aaee65bc28cc7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Anish Bhatt          2014-08-20  6716  		goto out_free_adapter;
29aaee65bc28cc7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Anish Bhatt          2014-08-20  6717  	}
29aaee65bc28cc7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Anish Bhatt          2014-08-20  6718  
144be3d9f72fca5 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Gavin Shan           2014-01-23  6719  	/* PCI device has been enabled */
80f61f19e542aed drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Arjun Vynipadath     2019-03-04  6720  	adapter->flags |= CXGB4_DEV_ENABLED;
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6721  	memset(adapter->chan_map, 0xff, sizeof(adapter->chan_map));
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6722  
b0ba9d5fded9590 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Casey Leedom         2017-08-15  6723  	/* If possible, we use PCIe Relaxed Ordering Attribute to deliver
b0ba9d5fded9590 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Casey Leedom         2017-08-15  6724  	 * Ingress Packet Data to Free List Buffers in order to allow for
b0ba9d5fded9590 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Casey Leedom         2017-08-15  6725  	 * chipset performance optimizations between the Root Complex and
b0ba9d5fded9590 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Casey Leedom         2017-08-15  6726  	 * Memory Controllers.  (Messages to the associated Ingress Queue
b0ba9d5fded9590 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Casey Leedom         2017-08-15  6727  	 * notifying new Packet Placement in the Free Lists Buffers will be
b0ba9d5fded9590 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Casey Leedom         2017-08-15  6728  	 * send without the Relaxed Ordering Attribute thus guaranteeing that
b0ba9d5fded9590 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Casey Leedom         2017-08-15  6729  	 * all preceding PCIe Transaction Layer Packets will be processed
b0ba9d5fded9590 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Casey Leedom         2017-08-15  6730  	 * first.)  But some Root Complexes have various issues with Upstream
b0ba9d5fded9590 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Casey Leedom         2017-08-15  6731  	 * Transaction Layer Packets with the Relaxed Ordering Attribute set.
b0ba9d5fded9590 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Casey Leedom         2017-08-15  6732  	 * The PCIe devices which under the Root Complexes will be cleared the
b0ba9d5fded9590 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Casey Leedom         2017-08-15  6733  	 * Relaxed Ordering bit in the configuration space, So we check our
b0ba9d5fded9590 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Casey Leedom         2017-08-15  6734  	 * PCIe configuration space to see if it's flagged with advice against
b0ba9d5fded9590 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Casey Leedom         2017-08-15  6735  	 * using Relaxed Ordering.
b0ba9d5fded9590 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Casey Leedom         2017-08-15  6736  	 */
b0ba9d5fded9590 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Casey Leedom         2017-08-15  6737  	if (!pcie_relaxed_ordering_enabled(pdev))
80f61f19e542aed drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Arjun Vynipadath     2019-03-04  6738  		adapter->flags |= CXGB4_ROOT_NO_RELAXED_ORDERING;
b0ba9d5fded9590 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Casey Leedom         2017-08-15  6739  
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6740  	spin_lock_init(&adapter->stats_lock);
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6741  	spin_lock_init(&adapter->tid_release_lock);
e327c225c911529 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Anish Bhatt          2014-10-29  6742  	spin_lock_init(&adapter->win0_lock);
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6743  
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6744  	INIT_WORK(&adapter->tid_release_task, process_tid_release_list);
881806bc155c0d5 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Vipul Pandya         2012-05-18  6745  	INIT_WORK(&adapter->db_full_task, process_db_full);
881806bc155c0d5 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Vipul Pandya         2012-05-18  6746  	INIT_WORK(&adapter->db_drop_task, process_db_drop);
8b7372c101a5f9f drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-03-16  6747  	INIT_WORK(&adapter->fatal_err_notify_task, notify_fatal_err);
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6748  
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6749  	err = t4_prep_adapter(adapter);
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6750  	if (err)
d6ce2628f32271c drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2014-09-16  6751  		goto out_free_adapter;
d6ce2628f32271c drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2014-09-16  6752  
1dde532dd0520a9 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Rahul Lakkireddy     2018-05-02  6753  	if (is_kdump_kernel()) {
1dde532dd0520a9 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Rahul Lakkireddy     2018-05-02  6754  		/* Collect hardware state and append to /proc/vmcore */
1dde532dd0520a9 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Rahul Lakkireddy     2018-05-02  6755  		err = cxgb4_cudbg_vmcore_add_dump(adapter);
1dde532dd0520a9 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Rahul Lakkireddy     2018-05-02  6756  		if (err) {
1dde532dd0520a9 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Rahul Lakkireddy     2018-05-02  6757  			dev_warn(adapter->pdev_dev,
1dde532dd0520a9 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Rahul Lakkireddy     2018-05-02  6758  				 "Fail collecting vmcore device dump, err: %d. Continuing\n",
1dde532dd0520a9 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Rahul Lakkireddy     2018-05-02  6759  				 err);
1dde532dd0520a9 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Rahul Lakkireddy     2018-05-02  6760  			err = 0;
1dde532dd0520a9 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Rahul Lakkireddy     2018-05-02  6761  		}
1dde532dd0520a9 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Rahul Lakkireddy     2018-05-02  6762  	}
22adfe0a85ca380 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Santosh Rastapur     2013-03-14  6763  
d14807dd8e7eaa4 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2013-12-03  6764  	if (!is_t4(adapter->params.chip)) {
f612b815d75b054 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-01-05  6765  		s_qpp = (QUEUESPERPAGEPF0_S +
f612b815d75b054 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-01-05  6766  			(QUEUESPERPAGEPF1_S - QUEUESPERPAGEPF0_S) *
b261272276777f0 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-05-27  6767  			adapter->pf);
f612b815d75b054 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-01-05  6768  		qpp = 1 << QUEUESPERPAGEPF0_G(t4_read_reg(adapter,
f612b815d75b054 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-01-05  6769  		      SGE_EGRESS_QUEUES_PER_PAGE_PF_A) >> s_qpp);
22adfe0a85ca380 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Santosh Rastapur     2013-03-14  6770  		num_seg = PAGE_SIZE / SEGMENT_SIZE;
22adfe0a85ca380 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Santosh Rastapur     2013-03-14  6771  
22adfe0a85ca380 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Santosh Rastapur     2013-03-14  6772  		/* Each segment size is 128B. Write coalescing is enabled only
22adfe0a85ca380 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Santosh Rastapur     2013-03-14  6773  		 * when SGE_EGRESS_QUEUES_PER_PAGE_PF reg value for the
22adfe0a85ca380 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Santosh Rastapur     2013-03-14  6774  		 * queue is less no of segments that can be accommodated in
22adfe0a85ca380 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Santosh Rastapur     2013-03-14  6775  		 * a page size.
22adfe0a85ca380 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Santosh Rastapur     2013-03-14  6776  		 */
22adfe0a85ca380 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Santosh Rastapur     2013-03-14  6777  		if (qpp > num_seg) {
22adfe0a85ca380 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Santosh Rastapur     2013-03-14  6778  			dev_err(&pdev->dev,
22adfe0a85ca380 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Santosh Rastapur     2013-03-14  6779  				"Incorrect number of egress queues per page\n");
22adfe0a85ca380 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Santosh Rastapur     2013-03-14  6780  			err = -EINVAL;
d6ce2628f32271c drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2014-09-16  6781  			goto out_free_adapter;
22adfe0a85ca380 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Santosh Rastapur     2013-03-14  6782  		}
22adfe0a85ca380 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Santosh Rastapur     2013-03-14  6783  		adapter->bar2 = ioremap_wc(pci_resource_start(pdev, 2),
22adfe0a85ca380 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Santosh Rastapur     2013-03-14  6784  		pci_resource_len(pdev, 2));
22adfe0a85ca380 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Santosh Rastapur     2013-03-14  6785  		if (!adapter->bar2) {
22adfe0a85ca380 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Santosh Rastapur     2013-03-14  6786  			dev_err(&pdev->dev, "cannot map device bar2 region\n");
22adfe0a85ca380 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Santosh Rastapur     2013-03-14  6787  			err = -ENOMEM;
d6ce2628f32271c drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2014-09-16  6788  			goto out_free_adapter;
22adfe0a85ca380 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Santosh Rastapur     2013-03-14  6789  		}
22adfe0a85ca380 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Santosh Rastapur     2013-03-14  6790  	}
22adfe0a85ca380 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Santosh Rastapur     2013-03-14  6791  
636f9d371f70f22 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Vipul Pandya         2012-09-26  6792  	setup_memwin(adapter);
86e8f2988786cb7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Vishal Kulkarni      2019-11-05  6793  	err = adap_init0(adapter, 0);
5b377d114f2b9ce drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-05-27  6794  #ifdef CONFIG_DEBUG_FS
5b377d114f2b9ce drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-05-27  6795  	bitmap_zero(adapter->sge.blocked_fl, adapter->sge.egr_sz);
5b377d114f2b9ce drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-05-27  6796  #endif
636f9d371f70f22 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Vipul Pandya         2012-09-26  6797  	setup_memwin_rdma(adapter);
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6798  	if (err)
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6799  		goto out_unmap_bar;
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6800  
2a485cf7db2815c drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-09-08  6801  	/* configure SGE_STAT_CFG_A to read WC stats */
2a485cf7db2815c drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-09-08  6802  	if (!is_t4(adapter->params.chip))
676d6a753066e9b drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-12-23  6803  		t4_write_reg(adapter, SGE_STAT_CFG_A, STATSOURCE_T5_V(7) |
676d6a753066e9b drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-12-23  6804  			     (is_t5(adapter->params.chip) ? STATMODE_V(0) :
676d6a753066e9b drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-12-23  6805  			      T6_STATMODE_V(0)));
2a485cf7db2815c drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-09-08  6806  
b539ea60f5043b9 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Arjun Vynipadath     2018-11-20  6807  	/* Initialize hash mac addr list */
b539ea60f5043b9 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Arjun Vynipadath     2018-11-20  6808  	INIT_LIST_HEAD(&adapter->mac_hlist);
b539ea60f5043b9 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Arjun Vynipadath     2018-11-20  6809  
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6810  	for_each_port(adapter, i) {
ab0367ea42217d4 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Rahul Lakkireddy     2019-11-07  6811  		/* For supporting MQPRIO Offload, need some extra
ab0367ea42217d4 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Rahul Lakkireddy     2019-11-07  6812  		 * queues for each ETHOFLD TIDs. Keep it equal to
ab0367ea42217d4 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Rahul Lakkireddy     2019-11-07  6813  		 * MAX_ATIDs for now. Once we connect to firmware
ab0367ea42217d4 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Rahul Lakkireddy     2019-11-07  6814  		 * later and query the EOTID params, we'll come to
ab0367ea42217d4 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Rahul Lakkireddy     2019-11-07  6815  		 * know the actual # of EOTIDs supported.
ab0367ea42217d4 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Rahul Lakkireddy     2019-11-07  6816  		 */
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6817  		netdev = alloc_etherdev_mq(sizeof(struct port_info),
ab0367ea42217d4 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Rahul Lakkireddy     2019-11-07  6818  					   MAX_ETH_QSETS + MAX_ATIDS);
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6819  		if (!netdev) {
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6820  			err = -ENOMEM;
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6821  			goto out_free_dev;
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6822  		}
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6823  
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6824  		SET_NETDEV_DEV(netdev, &pdev->dev);
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6825  
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6826  		adapter->port[i] = netdev;
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6827  		pi = netdev_priv(netdev);
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6828  		pi->adapter = adapter;
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6829  		pi->xact_addr_filt = -1;
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6830  		pi->port_id = i;
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6831  		netdev->irq = pdev->irq;
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6832  
2ed28baa7076083 drivers/net/cxgb4/cxgb4_main.c                  Michał Mirosław      2011-04-16  6833  		netdev->hw_features = NETIF_F_SG | TSO_FLAGS |
2ed28baa7076083 drivers/net/cxgb4/cxgb4_main.c                  Michał Mirosław      2011-04-16  6834  			NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM |
012475e3c59cbe4 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Arjun Vynipadath     2019-02-28  6835  			NETIF_F_RXCSUM | NETIF_F_RXHASH | NETIF_F_GRO |
d8931847488d250 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Rahul Lakkireddy     2016-09-20  6836  			NETIF_F_HW_VLAN_CTAG_TX | NETIF_F_HW_VLAN_CTAG_RX |
c8729cac2a11e4b drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Vishal Kulkarni      2020-06-19  6837  			NETIF_F_HW_TC | NETIF_F_NTUPLE;
d0a1299c6bf7d80 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-10  6838  
e8d452923ae6cdc drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-05-24  6839  		if (chip_ver > CHELSIO_T5) {
c50ae55e41ee226 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-05-11  6840  			netdev->hw_enc_features |= NETIF_F_IP_CSUM |
c50ae55e41ee226 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-05-11  6841  						   NETIF_F_IPV6_CSUM |
c50ae55e41ee226 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-05-11  6842  						   NETIF_F_RXCSUM |
c50ae55e41ee226 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-05-11  6843  						   NETIF_F_GSO_UDP_TUNNEL |
64f40cdd07e19b5 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Arjun Vynipadath     2019-02-28  6844  						   NETIF_F_GSO_UDP_TUNNEL_CSUM |
c50ae55e41ee226 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-05-11  6845  						   NETIF_F_TSO | NETIF_F_TSO6;
c50ae55e41ee226 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-05-11  6846  
1435d9970378999 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Atul Gupta           2019-01-17  6847  			netdev->hw_features |= NETIF_F_GSO_UDP_TUNNEL |
64f40cdd07e19b5 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Arjun Vynipadath     2019-02-28  6848  					       NETIF_F_GSO_UDP_TUNNEL_CSUM |
1435d9970378999 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Atul Gupta           2019-01-17  6849  					       NETIF_F_HW_TLS_RECORD;
ad166a8ec26521a drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Jakub Kicinski       2020-07-14  6850  
ad166a8ec26521a drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Jakub Kicinski       2020-07-14  6851  			if (adapter->rawf_cnt)
ad166a8ec26521a drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Jakub Kicinski       2020-07-14  6852  				netdev->udp_tunnel_nic_info = &cxgb_udp_tunnels;
c50ae55e41ee226 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-05-11  6853  		}
d0a1299c6bf7d80 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-01-10  6854  
c8f44affb7244f2 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Michał Mirosław      2011-11-15  6855  		if (highdma)
c8f44affb7244f2 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Michał Mirosław      2011-11-15  6856  			netdev->hw_features |= NETIF_F_HIGHDMA;
c8f44affb7244f2 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Michał Mirosław      2011-11-15  6857  		netdev->features |= netdev->hw_features;
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6858  		netdev->vlan_features = netdev->features & VLAN_FEAT;
a8c16e8ed624f24 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Rohit Maheshwari     2020-09-10  6859  #if IS_ENABLED(CONFIG_CHELSIO_TLS_DEVICE)
a3ac249a1ab5755 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Rohit Maheshwari     2020-06-01  6860  		if (pi->adapter->params.crypto & FW_CAPS_CONFIG_TLS_HW) {
a3ac249a1ab5755 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Rohit Maheshwari     2020-06-01  6861  			netdev->hw_features |= NETIF_F_HW_TLS_TX;
a3ac249a1ab5755 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Rohit Maheshwari     2020-06-01  6862  			netdev->tlsdev_ops = &cxgb4_ktls_ops;
a3ac249a1ab5755 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Rohit Maheshwari     2020-06-01  6863  			/* initialize the refcount */
a3ac249a1ab5755 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Rohit Maheshwari     2020-06-01  6864  			refcount_set(&pi->adapter->chcr_ktls.ktls_refcount, 0);
a3ac249a1ab5755 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Rohit Maheshwari     2020-06-01  6865  		}
76f919ebffe2f66 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ayush Sawal          2020-09-09  6866  #endif /* CONFIG_CHELSIO_TLS_DEVICE */
76f919ebffe2f66 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ayush Sawal          2020-09-09  6867  #if IS_ENABLED(CONFIG_CHELSIO_IPSEC_INLINE)
76f919ebffe2f66 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ayush Sawal          2020-09-09  6868  		if (pi->adapter->params.crypto & FW_CAPS_CONFIG_IPSEC_INLINE) {
76f919ebffe2f66 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ayush Sawal          2020-09-09  6869  			netdev->hw_enc_features |= NETIF_F_HW_ESP;
76f919ebffe2f66 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ayush Sawal          2020-09-09  6870  			netdev->features |= NETIF_F_HW_ESP;
76f919ebffe2f66 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ayush Sawal          2020-09-09  6871  			netdev->xfrmdev_ops = &cxgb4_xfrmdev_ops;
76f919ebffe2f66 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ayush Sawal          2020-09-09  6872  		}
76f919ebffe2f66 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ayush Sawal          2020-09-09  6873  #endif /* CONFIG_CHELSIO_IPSEC_INLINE */
76f919ebffe2f66 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ayush Sawal          2020-09-09  6874  
01789349ee52e4a drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Jiri Pirko           2011-08-16  6875  		netdev->priv_flags |= IFF_UNICAST_FLT;
01789349ee52e4a drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Jiri Pirko           2011-08-16  6876  
d894be57ca92c8a drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Jarod Wilson         2016-10-20  6877  		/* MTU range: 81 - 9600 */
a047fbae23e1d94 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Arjun Vynipadath     2017-10-03  6878  		netdev->min_mtu = 81;              /* accommodate SACK */
d894be57ca92c8a drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Jarod Wilson         2016-10-20  6879  		netdev->max_mtu = MAX_MTU;
d894be57ca92c8a drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Jarod Wilson         2016-10-20  6880  
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6881  		netdev->netdev_ops = &cxgb4_netdev_ops;
688848b1493a0a5 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Anish Bhatt          2014-06-19  6882  #ifdef CONFIG_CHELSIO_T4_DCB
688848b1493a0a5 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Anish Bhatt          2014-06-19  6883  		netdev->dcbnl_ops = &cxgb4_dcb_ops;
688848b1493a0a5 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Anish Bhatt          2014-06-19  6884  		cxgb4_dcb_state_init(netdev);
ebddd97afb89cb1 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Ganesh Goudar        2018-08-10  6885  		cxgb4_dcb_version_init(netdev);
688848b1493a0a5 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Anish Bhatt          2014-06-19  6886  #endif
812034f11628aaa drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-04-06  6887  		cxgb4_set_ethtool_ops(netdev);
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6888  	}
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6889  
ad75b7d32f2517a drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Rahul Lakkireddy     2017-10-13  6890  	cxgb4_init_ethtool_dump(adapter);
ad75b7d32f2517a drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Rahul Lakkireddy     2017-10-13  6891  
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6892  	pci_set_drvdata(pdev, adapter);
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6893  
80f61f19e542aed drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Arjun Vynipadath     2019-03-04  6894  	if (adapter->flags & CXGB4_FW_OK) {
060e0c752b5047e drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-08-02  6895  		err = t4_port_init(adapter, func, func, 0);
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6896  		if (err)
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6897  			goto out_free_dev;
098ef6c28a956ba drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-06-05  6898  	} else if (adapter->params.nports == 1) {
098ef6c28a956ba drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-06-05  6899  		/* If we don't have a connection to the firmware -- possibly
098ef6c28a956ba drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-06-05  6900  		 * because of an error -- grab the raw VPD parameters so we
098ef6c28a956ba drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-06-05  6901  		 * can set the proper MAC Address on the debug network
098ef6c28a956ba drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-06-05  6902  		 * interface that we've created.
098ef6c28a956ba drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-06-05  6903  		 */
098ef6c28a956ba drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-06-05  6904  		u8 hw_addr[ETH_ALEN];
098ef6c28a956ba drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-06-05  6905  		u8 *na = adapter->params.vpd.na;
098ef6c28a956ba drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-06-05  6906  
098ef6c28a956ba drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-06-05  6907  		err = t4_get_raw_vpd_params(adapter, &adapter->params.vpd);
098ef6c28a956ba drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-06-05  6908  		if (!err) {
098ef6c28a956ba drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-06-05  6909  			for (i = 0; i < ETH_ALEN; i++)
098ef6c28a956ba drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-06-05  6910  				hw_addr[i] = (hex2val(na[2 * i + 0]) * 16 +
098ef6c28a956ba drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-06-05  6911  					      hex2val(na[2 * i + 1]));
098ef6c28a956ba drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-06-05  6912  			t4_set_hw_addr(adapter, 0, hw_addr);
098ef6c28a956ba drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-06-05  6913  		}
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6914  	}
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6915  
80f61f19e542aed drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Arjun Vynipadath     2019-03-04  6916  	if (!(adapter->flags & CXGB4_FW_OK))
0eaec62a91ed9d5 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Casey Leedom         2018-07-04  6917  		goto fw_attach_fail;
0eaec62a91ed9d5 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Casey Leedom         2018-07-04  6918  
098ef6c28a956ba drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-06-05  6919  	/* Configure queues and allocate tables now, they can be needed as
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6920  	 * soon as the first register_netdev completes.
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6921  	 */
0eaec62a91ed9d5 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Casey Leedom         2018-07-04  6922  	err = cfg_queues(adapter);
0eaec62a91ed9d5 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Casey Leedom         2018-07-04  6923  	if (err)
0eaec62a91ed9d5 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Casey Leedom         2018-07-04  6924  		goto out_free_dev;
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6925  
3bdb376e6944134 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Kumar Sanghvi        2017-10-18  6926  	adapter->smt = t4_init_smt();
3bdb376e6944134 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Kumar Sanghvi        2017-10-18  6927  	if (!adapter->smt) {
3bdb376e6944134 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Kumar Sanghvi        2017-10-18  6928  		/* We tolerate a lack of SMT, giving up some functionality */
3bdb376e6944134 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Kumar Sanghvi        2017-10-18  6929  		dev_warn(&pdev->dev, "could not allocate SMT, continuing\n");
3bdb376e6944134 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Kumar Sanghvi        2017-10-18  6930  	}
3bdb376e6944134 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Kumar Sanghvi        2017-10-18  6931  
5be9ed8d49754c2 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c Hariprasad Shenai    2015-07-07  6932  	adapter->l2t = t4_init_l2t(adapter->l2t_start, adapter->l2t_end);
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6933  	if (!adapter->l2t) {
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6934  		/* We tolerate a lack of L2T, giving up some functionality */
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6935  		dev_warn(&pdev->dev, "could not allocate L2T, continuing\n");
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6936  		adapter->params.offload = 0;
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6937  	}
b8ff05a9c3237f6 drivers/net/cxgb4/cxgb4_main.c                  Dimitris Michailidis 2010-04-01  6938  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--FCuugMFkClbJLl1L
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
--FCuugMFkClbJLl1L
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--FCuugMFkClbJLl1L--

