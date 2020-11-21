Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A05932BC027
	for <lists+linux-audit@lfdr.de>; Sat, 21 Nov 2020 16:07:18 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-zyRjjuNXNS-uEpa_skKSqQ-1; Sat, 21 Nov 2020 10:07:13 -0500
X-MC-Unique: zyRjjuNXNS-uEpa_skKSqQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25CED107AD44;
	Sat, 21 Nov 2020 15:07:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4065260C15;
	Sat, 21 Nov 2020 15:07:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D6A6B180954D;
	Sat, 21 Nov 2020 15:06:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AL7b8Wc020215 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 21 Nov 2020 02:37:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C97CB2026D49; Sat, 21 Nov 2020 07:37:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C030F2026D48
	for <linux-audit@redhat.com>; Sat, 21 Nov 2020 07:37:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DC3F858EEC
	for <linux-audit@redhat.com>; Sat, 21 Nov 2020 07:37:06 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-497-nCNFNU0XMLi4oRuQC_cS-Q-1;
	Sat, 21 Nov 2020 02:37:01 -0500
X-MC-Unique: nCNFNU0XMLi4oRuQC_cS-Q-1
IronPort-SDR: zg1efb4mv0ccecz3Qk37IznvTKA9brbuUGkWjT0U31k8tksk8Nw+hRa/ti/rtSqkNn+oYko3VN
	smZqbNIr7uCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9811"; a="256289459"
X-IronPort-AV: E=Sophos;i="5.78,358,1599548400"; 
	d="gz'50?scan'50,208,50";a="256289459"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	20 Nov 2020 23:36:59 -0800
IronPort-SDR: P4qNPpgSmxx4Mbr8htJfwjJczEM6CCDql4BgHgnRJBKgFC3AMdIHG9+a8ScRxbKOO8y3gZ4PHS
	CtAtwM1dw1bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,358,1599548400"; 
	d="gz'50?scan'50,208,50";a="311683381"
Received: from lkp-server01.sh.intel.com (HELO 00bc34107a07) ([10.239.97.150])
	by fmsmga008.fm.intel.com with ESMTP; 20 Nov 2020 23:36:55 -0800
Received: from kbuild by 00bc34107a07 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1kgNS3-0000Es-8m; Sat, 21 Nov 2020 07:36:55 +0000
Date: Sat, 21 Nov 2020 15:36:28 +0800
From: kernel test robot <lkp@intel.com>
To: Casey Schaufler <casey@schaufler-ca.com>, casey.schaufler@intel.com,
	jmorris@namei.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org
Subject: Re: [PATCH v23 19/23] audit: add support for non-syscall auxiliary
	records
Message-ID: <202011211532.1iZbmwso-lkp@intel.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Sat, 21 Nov 2020 10:06:42 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline

--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Casey,

I love your patch! Yet something to improve:

[auto build test ERROR on nf/master]
[also build test ERROR on linus/master v5.10-rc4 next-20201120]
[cannot apply to nf-next/master security/next-testing]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Casey-Schaufler/LSM-Module-stacking-for-AppArmor/20201121-044616
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf.git master
config: x86_64-randconfig-a015-20201120 (attached as .config)
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

All errors (new ones prefixed by >>):

   In file included from drivers/net/gtp.c:30:
   In file included from include/net/xfrm.h:15:
>> include/linux/audit.h:563:1: error: expected external declaration
   +static inline struct audit_context *audit_alloc_local(gfp_t gfpflags)
   ^
   1 error generated.
--
   In file included from drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:40:
   In file included from include/net/xfrm.h:15:
>> include/linux/audit.h:563:1: error: expected external declaration
   +static inline struct audit_context *audit_alloc_local(gfp_t gfpflags)
   ^
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8108:14: warning: division by zero is undefined [-Wdivision-by-zero]
           cmd_type |= IXGBE_SET_FLAG(tx_flags, IXGBE_TX_FLAGS_HW_VLAN,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8098:26: note: expanded from macro 'IXGBE_SET_FLAG'
            ((u32)(_input & _flag) / (_flag / _result)))
                                   ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8112:14: warning: division by zero is undefined [-Wdivision-by-zero]
           cmd_type |= IXGBE_SET_FLAG(tx_flags, IXGBE_TX_FLAGS_TSO,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8098:26: note: expanded from macro 'IXGBE_SET_FLAG'
            ((u32)(_input & _flag) / (_flag / _result)))
                                   ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8116:14: warning: division by zero is undefined [-Wdivision-by-zero]
           cmd_type |= IXGBE_SET_FLAG(tx_flags, IXGBE_TX_FLAGS_TSTAMP,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8098:26: note: expanded from macro 'IXGBE_SET_FLAG'
            ((u32)(_input & _flag) / (_flag / _result)))
                                   ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8120:14: warning: division by zero is undefined [-Wdivision-by-zero]
           cmd_type ^= IXGBE_SET_FLAG(skb->no_fcs, 1, IXGBE_ADVTXD_DCMD_IFCS);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8098:26: note: expanded from macro 'IXGBE_SET_FLAG'
            ((u32)(_input & _flag) / (_flag / _result)))
                                   ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8131:19: warning: division by zero is undefined [-Wdivision-by-zero]
           olinfo_status |= IXGBE_SET_FLAG(tx_flags,
                            ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8098:26: note: expanded from macro 'IXGBE_SET_FLAG'
            ((u32)(_input & _flag) / (_flag / _result)))
                                   ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8136:19: warning: division by zero is undefined [-Wdivision-by-zero]
           olinfo_status |= IXGBE_SET_FLAG(tx_flags,
                            ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8098:26: note: expanded from macro 'IXGBE_SET_FLAG'
            ((u32)(_input & _flag) / (_flag / _result)))
                                   ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8141:19: warning: division by zero is undefined [-Wdivision-by-zero]
           olinfo_status |= IXGBE_SET_FLAG(tx_flags,
                            ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8098:26: note: expanded from macro 'IXGBE_SET_FLAG'
            ((u32)(_input & _flag) / (_flag / _result)))
                                   ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8149:19: warning: division by zero is undefined [-Wdivision-by-zero]
           olinfo_status |= IXGBE_SET_FLAG(tx_flags,
                            ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8098:26: note: expanded from macro 'IXGBE_SET_FLAG'
            ((u32)(_input & _flag) / (_flag / _result)))
                                   ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:10621:45: warning: shift count >= width of type [-Wshift-count-overflow]
           if (!dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64))) {
                                                      ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   9 warnings and 1 error generated.
--
   In file included from drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c:33:
   In file included from include/net/xfrm.h:15:
>> include/linux/audit.h:563:1: error: expected external declaration
   +static inline struct audit_context *audit_alloc_local(gfp_t gfpflags)
   ^
   drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c:4529:45: warning: shift count >= width of type [-Wshift-count-overflow]
           if (!dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64))) {
                                                      ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 1 error generated.

vim +563 include/linux/audit.h

   559	
   560	extern int audit_n_rules;
   561	extern int audit_signals;
   562	#else /* CONFIG_AUDITSYSCALL */
 > 563	+static inline struct audit_context *audit_alloc_local(gfp_t gfpflags)
   564	{
   565		return NULL;
   566	}
   567	static inline void audit_free_context(struct audit_context *context)
   568	{ }
   569	static inline int audit_alloc(struct task_struct *task)
   570	{
   571		return 0;
   572	}
   573	static inline void audit_free(struct task_struct *task)
   574	{ }
   575	static inline void audit_syscall_entry(int major, unsigned long a0,
   576					       unsigned long a1, unsigned long a2,
   577					       unsigned long a3)
   578	{ }
   579	static inline void audit_syscall_exit(void *pt_regs)
   580	{ }
   581	static inline bool audit_dummy_context(void)
   582	{
   583		return true;
   584	}
   585	static inline void audit_set_context(struct task_struct *task, struct audit_context *ctx)
   586	{ }
   587	static inline struct audit_context *audit_context(void)
   588	{
   589		return NULL;
   590	}
   591	static inline struct filename *audit_reusename(const __user char *name)
   592	{
   593		return NULL;
   594	}
   595	static inline void audit_getname(struct filename *name)
   596	{ }
   597	static inline void audit_getcwd(void)
   598	{ }
   599	static inline void audit_inode(struct filename *name,
   600					const struct dentry *dentry,
   601					unsigned int aflags)
   602	{ }
   603	static inline void audit_file(struct file *file)
   604	{
   605	}
   606	static inline void audit_inode_parent_hidden(struct filename *name,
   607					const struct dentry *dentry)
   608	{ }
   609	static inline void audit_inode_child(struct inode *parent,
   610					     const struct dentry *dentry,
   611					     const unsigned char type)
   612	{ }
   613	static inline void audit_core_dumps(long signr)
   614	{ }
   615	static inline void audit_seccomp(unsigned long syscall, long signr, int code)
   616	{ }
   617	static inline void audit_seccomp_actions_logged(const char *names,
   618							const char *old_names, int res)
   619	{ }
   620	static inline void audit_ipc_obj(struct kern_ipc_perm *ipcp)
   621	{ }
   622	static inline void audit_ipc_set_perm(unsigned long qbytes, uid_t uid,
   623						gid_t gid, umode_t mode)
   624	{ }
   625	static inline void audit_bprm(struct linux_binprm *bprm)
   626	{ }
   627	static inline int audit_socketcall(int nargs, unsigned long *args)
   628	{
   629		return 0;
   630	}
   631	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--UugvWAfsgieZRqgk
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
AHDqtST3AQA=
--UugvWAfsgieZRqgk
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--UugvWAfsgieZRqgk--

