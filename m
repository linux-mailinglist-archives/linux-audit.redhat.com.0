Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A16662AF02C
	for <lists+linux-audit@lfdr.de>; Wed, 11 Nov 2020 12:58:12 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-kRLu8Ij8M1uxL7a2jj6UiQ-1; Wed, 11 Nov 2020 06:58:07 -0500
X-MC-Unique: kRLu8Ij8M1uxL7a2jj6UiQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7AB5809DDF;
	Wed, 11 Nov 2020 11:58:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 100B17513C;
	Wed, 11 Nov 2020 11:58:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A09F2181A050;
	Wed, 11 Nov 2020 11:57:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AB4kF9w030631 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 10 Nov 2020 23:46:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B10591004173; Wed, 11 Nov 2020 04:46:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB2C71004C73
	for <linux-audit@redhat.com>; Wed, 11 Nov 2020 04:46:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DF29185A7A2
	for <linux-audit@redhat.com>; Wed, 11 Nov 2020 04:46:12 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-206-mqBt4GcFMxWzxWj9Qfkriw-1; Tue, 10 Nov 2020 23:46:08 -0500
X-MC-Unique: mqBt4GcFMxWzxWj9Qfkriw-1
IronPort-SDR: 1JMX+WFqlXMFWoEWZoJVzGwyf36sOdQoYLY5+5w1LsUjovOKFRS0+CtHrIsqW73xYQbmZxDr5c
	fbbFrF4Zofew==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="157101953"
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; 
	d="gz'50?scan'50,208,50";a="157101953"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	10 Nov 2020 20:46:07 -0800
IronPort-SDR: 6OvFVp05xGRSksP/f/KDm9csjhU0yXoxUPGzAypmb+GzYfwwDmZH02rlDo2FdzBIbYutccABqh
	kz72E53FG+bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; 
	d="gz'50?scan'50,208,50";a="531497363"
Received: from lkp-server02.sh.intel.com (HELO 14a21f3b7a6a) ([10.239.97.151])
	by fmsmga005.fm.intel.com with ESMTP; 10 Nov 2020 20:46:04 -0800
Received: from kbuild by 14a21f3b7a6a with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1kci1D-00003J-9Q; Wed, 11 Nov 2020 04:46:03 +0000
Date: Wed, 11 Nov 2020 12:45:30 +0800
From: kernel test robot <lkp@intel.com>
To: Casey Schaufler <casey@schaufler-ca.com>, casey.schaufler@intel.com,
	jmorris@namei.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org
Subject: Re: [PATCH v22 20/23] Audit: Add new record for multiple process LSM
	attributes
Message-ID: <202011111201.tleMU64S-lkp@intel.com>
References: <20201105004924.11651-21-casey@schaufler-ca.com>
MIME-Version: 1.0
In-Reply-To: <20201105004924.11651-21-casey@schaufler-ca.com>
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
X-Mailman-Approved-At: Wed, 11 Nov 2020 06:57:51 -0500
Cc: john.johansen@canonical.com, kbuild-all@lists.01.org,
	linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline

--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Casey,

I love your patch! Yet something to improve:

[auto build test ERROR on nf-next/master]
[also build test ERROR on nf/master linus/master v5.10-rc3 next-20201110]
[cannot apply to security/next-testing]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Casey-Schaufler/LSM-Module-stacking-for-AppArmor/20201105-091817
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf-next.git master
config: powerpc-allnoconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/3fc93335d8a4090601fe221c305017ca73c23c61
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Casey-Schaufler/LSM-Module-stacking-for-AppArmor/20201105-091817
        git checkout 3fc93335d8a4090601fe221c305017ca73c23c61
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/ptrace/ptrace.c:20:
   include/linux/audit.h:585:1: error: expected identifier or '(' before '+' token
     585 | +static inline struct audit_context *audit_alloc_local(gfp_t gfpflags)
         | ^
>> include/linux/audit.h:261:13: error: 'audit_log_lsm' defined but not used [-Werror=unused-function]
     261 | static void audit_log_lsm(struct audit_context *context)
         |             ^~~~~~~~~~~~~
   cc1: all warnings being treated as errors

vim +/audit_log_lsm +261 include/linux/audit.h

   216	
   217	#else /* CONFIG_AUDIT */
   218	static inline __printf(4, 5)
   219	void audit_log(struct audit_context *ctx, gfp_t gfp_mask, int type,
   220		       const char *fmt, ...)
   221	{ }
   222	static inline struct audit_buffer *audit_log_start(struct audit_context *ctx,
   223							   gfp_t gfp_mask, int type)
   224	{
   225		return NULL;
   226	}
   227	static inline __printf(2, 3)
   228	void audit_log_format(struct audit_buffer *ab, const char *fmt, ...)
   229	{ }
   230	static inline void audit_log_end(struct audit_buffer *ab)
   231	{ }
   232	static inline void audit_log_end_local(struct audit_buffer *ab,
   233					       struct audit_context *context)
   234	{ }
   235	static inline void audit_log_n_hex(struct audit_buffer *ab,
   236					   const unsigned char *buf, size_t len)
   237	{ }
   238	static inline void audit_log_n_string(struct audit_buffer *ab,
   239					      const char *buf, size_t n)
   240	{ }
   241	static inline void  audit_log_n_untrustedstring(struct audit_buffer *ab,
   242							const char *string, size_t n)
   243	{ }
   244	static inline void audit_log_untrustedstring(struct audit_buffer *ab,
   245						     const char *string)
   246	{ }
   247	static inline void audit_log_d_path(struct audit_buffer *ab,
   248					    const char *prefix,
   249					    const struct path *path)
   250	{ }
   251	static inline void audit_log_key(struct audit_buffer *ab, char *key)
   252	{ }
   253	static inline void audit_log_path_denied(int type, const char *operation)
   254	{ }
   255	static inline int audit_log_task_context(struct audit_buffer *ab)
   256	{
   257		return 0;
   258	}
   259	static inline void audit_log_task_info(struct audit_buffer *ab)
   260	{ }
 > 261	static void audit_log_lsm(struct audit_context *context)
   262	{ }
   263	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--/9DWx/yDrRhgMJTb
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICOdmq18AAy5jb25maWcAnFxbj9u2s3//fwohBQ5aoEn3lm2Kg32gKcpmrduKlO3dF8GxtRsj
u/YeX9rkfPozQ0k2JQ2d4BRok3KG97n8ZjjyL//5xWOH/eZ1vl8t5i8v373ncl1u5/ty6T2tXsr/
9vzEixPtCV/qD8AcrtaHb3+8bf4tt28L7+OHy4sPF++3i0tvXG7X5YvHN+un1fMBRlht1v/55T88
iQM5LDgvJiJTMokLLWb67l09wvsXHO/982Lh/Trk/Dfvrw/XHy7eWd2kKoBw971pGp6Guvvr4vri
oiGE/rH96vrmwvxzHCdk8fBIvrCGHzFVMBUVw0Qnp0ksgoxDGYsTaZDL0NcyEoVmg1AUKsn0iapH
mWA+dAoS+A+wqDEQ4Rx+8YbmYF+8Xbk/vJ1OZpAlYxEXcDAqSk8DyVjqQsSTgmWwNRlJfXd9BaM0
C0yiVMLsWijtrXbeerPHgY9nkXAWNtt99+7UzyYULNcJ0dnssFAs1Ni1bhyxiSjGIotFWAwfpbVS
mzJ7PLW3mY8rOHISM/siYHmozeatuZvmUaJ0zCJx9+7X9WZd/mbtSz2oiUy5PeaRNmWaj4r7XOSC
pPMsUaqIRJRkDwXTmvERyZcrEcoBsWxzAiyDSVgOagJrgUMOm3uX2b23O3zefd/ty9fTvQ9FLDIJ
8p3dF2qUTC0J71CKUExEaIkGtPtJxGTcbguSjAu/FkEZD09UlbJMCWQyN1Gul97mqbOw7uxGxCen
vXTIHCRpDOuKtSKIUaKKPPWZFs0p6NVrud1RBzF6LFLolfiS23ISJ0iRfkhfmiGTlJEcjopMKLOD
TLV56q33VtMsJs2EiFINwxudPw7atE+SMI81yx7IqWsum2Y2z9P8Dz3fffX2MK83hzXs9vP9zpsv
FpvDer9aP5+OQ0s+LqBDwThPYK7qIo9TTGSmO+QiZlpO6GNCuTA3eWKnV64keVA/sXKzw4znnurf
Lcz3UADN3gH8byFmcOWanLE9krWTcfWX3uGqxZdyeXgpt95TOd8ftuXONNfDEVRL84dZkqeKtgoj
wcdpImONwqSTjD5gBXy+saRmLJInEyGjBWYQjsG6TYzBy3yaJUngwntbPzmqJIULlo8C9R81Cf6I
WMxb4ttlU/AXlyED2++jD+OJLwpQYVYI9D8oZElsD3qWkRgdbYkO4e65SLVBAhnjlmethMKeIQKr
L8HsZvTRD4WOwMEWtZGimR5UoM5yBCMWu6xMmig5Iw3JUeNBQMb0xeW0qg0YmOIgd60mB3xEUkSa
uPYohzELA1p+zOIdNGO/HTQ1Ao9IUphMaFuTFHnmMjDMn0jYd30R9GHChAOWZdJx32Ps+BDRfQdp
cPaWUYoMimhvt1kdOm9EfKclFDjUgPGx5d8oNvUQg8MD89CycUrcE9NAL+H7wu+AJ1Ta4uhLT7LF
Ly9ueuauxtlpuX3abF/n60XpiX/KNdhkBhaPo1UG11a5nXqc0/Ckxf3JES0fFFXDFcaluFQDISrT
gG9p9VAho7CUCvOBfQgqTAbO/nAP2VA0+NDNFoBfDqUCSw6qntBS3WYcscwHMONSjTwIAHynDCYH
KQFMDf7BYR+SQIY9pahPvh0SHDFIyq+vWoKQ8tsb4qygHd3D+FoVpoO59HS7WZS73WYL6ObtbbPd
n7yxxX/77VtnhuLTx2/f6D0g0UG7uXC039Dt4urigtjJETimLaggILzjV9hKD4bkayd5eNMl9c7h
pIjYFrRnhwAIYBV3DFCFPblIu+eIbef7MKIPO9snjfJC5WmatP2jaUYHR4tplJJS15eQZr6JrxIj
SY0KA84c4EHHvmRWtHF9NZBW0BtFecdGRhFLiyz2obcGa8lmd5d/nmOAUObykmZozMiPBmrxtcaL
M4TB6u7j5dXRykCQNzbwwzrWxmGaZugRhGyo+nQMfHyR9gmNEI+mAkIQ3ZItC+WwLHyocYPFwuI6
5kpyfXf56ZiiqPBlAvE/GCeIfQsDSUVmHTjGnOYwuo5KDiDWNmgMgYySg1B0WOo9KDChAFeMQTP2
zMWWgz0bCFtthlUWxISo6u6qtkEv8z36EssEtcSdjzIaKSMxSjnclNsUIf3qjKlKI0bnAYwdO9fz
0/U54q2D2Dh1F51FcsggnKQxDfjSYd5J4liQj6WA6VnGMOxzLi0JqigBJDcCkCjbczURqBdsy/85
lOvFd2+3mL9UQefJW4Oqg/e7Jy0G3bsZWC5fSm+5Xf1TbqHpOB02d2foh/PWDFUHq8Ue2AK0zGHu
RVxkmtMmryuQNpTavGGusgWZMIfggr+jx+KSdGJAuPp4YdtnaLlus3ZGoYe5g2Fa+idio2R1imqU
6DTMhx0d7fFk8LdJC5WOxUzQqsEzpkaFn0eUFzLDgzHUMHY9jZV4CkMxZGFjlooJC3NxyrCieN6M
jWHpOFsDntRIBmDujna5Tp/WzdfHBCAGl11ek+5Cl1A8gnYlgNcyy+jzyDd521MWUcxAP0B6ADEC
zraTomlECk1HPIx8DA47Sl4CFRbhgJY9u4vpw5b/IMheHjPBdpCEkbtvgvUkVj019sun+eHFNGDu
ZeeBUHvzZryFnXtv5vTm29I77MrlCQeGyRSvEpMAdxffri/auXJzMUkQKKGBuuhQ6/QtONCMIqej
ByUhcjoyXHQYtAnYq5mPnY9n1TmadtorZ6F87CUXWrn1+XbxZbUvF5joeb8s32BYCGSsG7PDrqQC
5y0V+RtUoIBIQISUZmIvEQSSS4x+cgi6IfLG9A/nQnXjRIg4TSpdy7gYqCnrpswlxIwIXmAVukMa
d91s1ZoJTROqVnxDCDo5FUMP8pgbFCCyLAEwFP8teJ3MsdnMqk3/EYDjPq4BPGkMeK2lRFgMKqll
8FCoJM94F2sY0IiCVXS3i88sUeLXzxLd3WUCUBjEbRVoq8+6YKns8kHMTQXW2J9qx4xAPSYaPuow
TtLQArvFkOkRdK6gD8aMJBkTnT9gqYwgakP7rKYM5AtBqzkvBrc1YRqMXdQ7dFhqHMlCsUCAzUtn
fNR1DFPBxpiCFJh3Yvw+lxk9nTHK+E7QPBwRJ6IER6B9hlSASlX49BSIVBSXRpk7QC0AqUzaHVsU
V38iJd5VtX4WvMMB4lfvIhVcBtJCwEDKQ9Au1GcRBiabS4wvZijdcfVqg+sm9MN0NymI1pWfzrAV
Fp2LqSxPd+odTwAAglmzevIQfGOBaawpy3yLkOATnxyqHDYc+712xrvZ3jq+qrQYD/PsQ9gEF9sc
g5U4alpdMKNyfOA/aj+TTWfEOSoN9ki3eSyh6RDP5fvQXxU6KfyIHd9peTJ5/3kOHtP7WiGAt+3m
afXSeqU5DoDcdZbH5ILsB7ZzI7WODN+0EdLJuJUAtJrPpo9+4PWO77poAFSEi7y0kq6VeDueJxLy
qqo3cdAVcG15jEz122KbbrBcRT9HI/tOMwkGz9HZJrZ7t8NVpkHTeJFFU0KIYlBWAMhZyNIUX9GY
72foWVRaeVAjDOJbuTjs558hEMFyCM9kSPcWkhjIOIg0arYV4odBNyFcsymeyZQO5GqOSCoHRIcR
uwD9KAmuZZo9ROXrZvvdi+br+XP5SuKhGt2ftoANcEK+CSgAZHctfsCUhsA17ZzrWIjUJMfb16bS
EIxGqs19gaVWdzcdw8K7sO4EztFFZgIv1PW2AAF25np0Ms4BFHyQt1RrrCKCuSk0MKY2AuFGmbi7
ufjr9phLEgD3UnwdAH8zjloGEjxszBkfOaoMIka2P6ZJQj9ZPA5yOv/8aJQ4oTKTDVarskw1xGyl
DEWGSwcj3H0NaEbI02IgYj6KWOY008Z0alF5S9Yyem5pO80RC6poxQgWx4ecv012sY54/lktSs83
WYD2swbnrP1megoFVou6h5f0g7W8erwYiTB1vDT5YqKj1JVW1eDBWejK6KRZNXwgweywrIoB+ssM
VtvXfzE0e9nMlyZxcgompxChMb+7tvp8ux3tfDUEduY5mbYVx81hqs/P5MS5e8MgJpnDLVQMWHpU
D1NUuYbziX3zSG4ilZaPpK/rGGwvzf237i8aSVRnZ7DddLFkOlaOF0dNvQb62oJ/SWCrTwJxQyy1
o+wKqGg4dQvuQ2OljSSp9jqttpZHSxBxQqgyAcNTmWh7MZUDe6DXAqDmaNJ4AvEGyGUXVGKmug6K
DPzvPTFUTT35jSeAAJWV3q0voNVeuZ/VbkFdIwho9IB7pVOfMUBXlYP+4N4ld4iiAsRLEmb46jYr
lB84Ul7pxOTcaVt9Re4ZnFuWRFRSu6IUf13z2S3toNtdq5Ko8tt858n1br89vJr31t0XUOylt9/O
1zvk8wAqlt4SDnD1hn+1D/r/0bvKPr3sATR6QTpkgBVqW7Lc/LtGe+K9brBYxvsVk72rbQkTXPHf
mqyuXO8BwwKi8v7L25YvpkiUOIxJkjr189wQ1nHyUUJ2b8lSOwTzj5hNcSVrpv4bKBIR89o2iOpg
2QjGZawTzI8aY9fPysn122Hfn/FUGBGneV+aRvPt0hy+/CPxsEtLOxSWxLncb1trDWsrbmCR6Arw
cbPUtKfbITZSrQpka74AyaE0WWu6ugkXBqEceqSePDRHk0ayqApwaGc0mp57tIehXWl6II1dNBMo
09UyHP7t5oNPJiV8cAl2/4BOHasNFDrLwWPiS03fvVdydMVJ8bmiE8s2u8V9Tds0CNYc7RFNGHVL
AhvDmfY1INWpt3jZLL5a669M5toEJRBmY+ks1g8C9psm2Rgjb5NGADgVYfzl7TcwXuntv5TefLlc
IQ6A2NaMuvtgW77+ZNbiZMx1RuPpYSqTTgHvkTa9pPeaTA26UcLx+mboGG+GtAqMppEjrsH8H8B4
ejVYsewnVMGfUgP7Mfd0jYqqphlA1EGyDzrhSOWpDy/71dNhvTDvB7UZWPaRdxT4BcaLIUAaMeMO
3TxxjULu00KJPBHqAh0bIXkkb2+uLos0cvjqkUbcoiS/dg4xFlEa0qGUWYC+vf7rTydZRR8vaOlg
g9nHiwuDtt29HxR3SACStSxYdH39cVZoxdmZU9L30ewTjS3OXptlhcQwD52FSpHwJSu44E325AwX
wVGFXtv525fVYkcZMT+LevwM2mx30jwCWc1VrLSdv5be58PTE5hXv+9/ggF5LmS3KrCYL76+rJ6/
7AGFgGyecd1AxY9HFFZIIAqlUzeMj0Pjkt2sTXzyg5mPYVH3KC1NT/KYilpysAzJiMsihPgkFL2i
HaQTNUTYnIdpL6SyyMeQf8T9TtfenWKbAZ8nu3FsT7983+FXRl44/46Osm9ZYoCOOOOMCzkhD/DM
OO09DZk/dFht/ZA6ggLsmCX4Vc9UasdnIFHk0FIRKSzepxGHwM84fBoEVU9acgAhi6ZCOeEz3uQy
Fc9MgaRN6lUiZWATwdO1KlI1r6STBktohHtRVpWAidggD6hHb1P5inlv15DQr8C8AFwrPgueYxsJ
1q3Dry+8M791avnMlyp1ldbnjiplkxAkkHyLQSZwnTFdZzLxU9pbTfD7pF6/OgZebDe7zdPeG31/
K7fvJ97zodztWxbnGOKcZ7XOX7OhKyU6TEI/kIqWYPDYgEpAHGhZHU0xsd9N/Vc3b2CX2hy2DmQg
eZbwkUwBiOnbG9ouk4PY8ZYMBwldAy+T6FQJ2VtdVr5u9uXbdrOg1oY5Ko1hOI2mic7VoG+vu2dy
vDRSjbTQI7Z6dgz4VGb9Ki0Fa/tVmS9fvGQNMcXq7Tdv91YuVk/HFNnRorLXl80zNKsNby2v8aIE
ueoHA0LU7erWp1Yuc7uZLxebV1c/kl5limbpH8G2LLFsrPTuN1t53xukPpn7XHIOjmsou8nVJrv0
g7HMYKsP0cy1zB7NEO8P8xdYu3NzJN2+UCzd7N3mDF/6vrn2WieoJjwnd0p1PuYrfkpMrCglQkjS
r+5rfMhMOyGqqSajVdFhX9NpH+hhkm8Bq+ynY4CC5qJddg1OxeFile4nDK2vGVtzWEtNscjDlYIw
0R1+YaXB84dEWA6RauvbtpORrZPbyOBCE+EwctIhCCvGScyQ8crJhYEyhAYi5qIA9I5J3B/y+T8z
mGLhxHGHwIUlbRJijui+i/NabJGcQYQXSQCQZydNZ6y4+hRHmFZwJGRtLjwR8prbl9GJxDmjnzwi
Tm8gY328w9bL7Wa1bJXlxX6WSJ9cT8NuIRpG+664m6qqsoBTTNguVutnKvxQmo6tsdYyLPSIXBIx
pBUrYd6XGjJwpHuUdPhiFcrImdbDWlD4eyw4Laz1l0M04ms/+dXPZWDvq0tvWdEJCyV+ZgzLr4qX
6OhWzBAwAI95mMYSGfoMsIgDOVywCkYA1ckeUudzNXAAspSOjKh/BgnLilY4v3cM2Jne93mi6YvF
Z7dA3RSO58yK7KIGWPXkoNVvTx1ydTvzxZdOjK6Ip/EGEFbclbHdlYflxlQxENeN6M21HEMDZxL6
YCJpiXV+KlP9QRxDY3X6q7JBr6riIBhfC8f3ibHjm8c8lvj9LJ3AsIW+Aojl4rBd7b9T4dhYPDje
yATPUSIh1hLK+DtTIXWWN6ByAebBofkyzsgpT9KH0xdwrdL3LhstXq2CUXpFmkFUbYaJ4KD6r/aN
atUPnafdMusVN1TR3TuMO/Cl6/fv89f57/je9bZa/76bP5Uwzmr5+2q9L5/xeH///Pb0rvWNwJf5
dlmu0aSeTt4urlmtV/vV/GX1v53fPTE/41EVmXZ/UsCQ8Fc48PiOy3eYlYYZK0mdvO0KjO6SOmXt
xI6O+LIrZZaioO1Levoerj5v5zDndnPYr9ZtzUfw1bGnDf6RGoslwGoTxcY6izkIV4Dvqnj5NEso
4oZqKXPmuzBGhlWgcR4NnF+tZmBEuNQOt5Xxy1tnP3154cvASZY6L6iqAaC1v/c0DSDIYeCoM6gZ
QsnF4OET0bWi3LiWgiwsm4LfPMMBt+Oi3jpHdhLo/HooB2Yy11cp/JMDt+GDmuOMThHWI2gKVSSF
qUyZtOrdqiYECd1iN1XXhh4TeWDTlMlbFSB8Q219dVfVW/CQZcKut7BzXVi3XtXPEOtqBLtK9d3e
tKxFdl90fwDgdIiB3y3sMBVaWLvXKpS3P2Cvvj6oy3rNlwwEX16X2wdhrkbGg3dLbeOh4xZqY9Iz
DW2zuvha1dWa1rctmOCv5plw+VrunvuFivCHSgxIG5pPDhtbePenk+M+l0Lf3RzLuWE7WFLYG+HG
BgrRIAmxjC7L8AeHyI05F1sZv83rG7jv9+Z3UwDeLL7uDOuiat9SHryqq8LfjqJBbP2FF74im18n
IWSh+kZ0yrL47vLi6qZ9Van50sL5EwpYkmtmYMrx5ZvApzpQlBg8GimK1Q5U9XkJAqMIXzKtQtAO
xawU/Fj40NITM0r1fdfx2xUjoVh+TgNrq4v54KGu0aTx5s/eTaugsBZZv/x8eH5Gv2nV3rRyoGyI
zulBOSqb6qU6AVZVSDv0W+l7/H+iw0lPB4rFYNQBJuBvvDSF6A3IRCp5FD+1ufbtVoX1/fvqVi7b
8Og4bhsYgBqKmRaxckVTnc+SaZ9uvlebxo6oyZDTRKokdkV11SzJAD+Lcl5LvXkwnCHIV3/7DeXM
DBUOzNH80FDXfOtdcQn8pL2r5J3x/q+Sq+ltG4ah9/2KHDegyHF3z4kbo4nj2nHdnYygM3raWizp
sJ8/PlL+kki1uxUQI0sqxS/xvQeth3lUCScjwLlwvW4gMr2DkiL0jB8KrxjZYLZnHjNt28NwXOuT
OlFhRzwA+MgSnO5o+mTUec9gFN0mzJJ1nK7H2HTpB82Toga72HmVR9eeTPKr48vr5Wa1p/Ti7VVM
ye7869mLggHwB+TAKz5o4yOKdlZizrh7vilpOSEcarZWDHa7phCopSrU3qsdJrMCTGxTn5akW8ur
HbBu2QeK5h/gBbxbKfkEXogmY/T5QokaNwLdrH6+Xfu/Pf3RX5/W6/WXOawVUD7MfctRicKXUeE1
Mlbg4TmQcsausfI65l8dsDhFu6fbVoRAcNNSBKa/1Ils1dZWWUEEeNW2hRSh4QF5v93GGsPd6XCg
OgR2+rf5q6SIJ3TpmlH4tNFYrF6nWWSqIZT8D61YFBAc14e+PkQgdHZdU9QU25MBjvYbsqkXV2EY
Awf1+nG+nlfwoU8TJ93yoHPjLJzTe2e8jvkyLhTmVo7L3q4QVD0ly1WjlDMXpsDYkv/VtKLzK055
sg8rgqD1U6MAoGRB2xVRIQbSvqdnEKq22YfmMpWBuQnv6zBDW9AT2jatdSycXRVEn3OfNga1vJLK
83jj6G2VlDtdZvOd8hK6zTreWyhsDlxkp0NBQcQTcVRpMjlzN/gY6dT9UGaZBvELw7xm9sHWyaH0
UIZhvIIHEvD9MpCFWdIkK3Rkw3oQWabdJq85b2kZ3645VxKSwRkHBRh4Bvz3tqQ8/ussXWJOwxJO
0k5wp113Wf5InjkqdqhzlFQYARuTw1oZQ0wev2N6Q0UZhwqH1Vz6bZPHWpjQg/zIRMzmEgSyYt+D
8J8yz+tP/QX8FBw1pC9/+t/n5wUXzF1TGNWlwXL5XAXGi4iwBSsyvnbdpceHIDSkgBDwXbku5YJ+
FvK6iQB+/CAWBrph9gmRMpueLHpMQaFWaiT/ACEpmeerWwAA
--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--/9DWx/yDrRhgMJTb--

