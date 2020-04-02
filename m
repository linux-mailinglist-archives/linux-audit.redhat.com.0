Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5712019C611
	for <lists+linux-audit@lfdr.de>; Thu,  2 Apr 2020 17:39:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585841978;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:autocrypt:autocrypt;
	bh=F5jU3P31oLRVSg3Z0jyhCJe4wXAI7HAa4aN6afM7+sM=;
	b=dxm7Fxq2yA5+72ieJ0GmcBCBZrxKpBgtIzDPhFHZdcApNfzHc/hkcvBM/J05iQjG+7NnBb
	q8CEwRP/YbWhbXc+qqMdLRTPR73s3t8KR+z4COmT8zRM688A5iWjucpnQGFq/waY69Y5Bm
	3D8Axgo80cEwtc9ZnJW5o7elK281rwM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-0mUiMCb5N82E6JxwCEsJUg-1; Thu, 02 Apr 2020 11:39:36 -0400
X-MC-Unique: 0mUiMCb5N82E6JxwCEsJUg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EE9D8017FE;
	Thu,  2 Apr 2020 15:39:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3A5D5E000;
	Thu,  2 Apr 2020 15:39:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 20D7318089CD;
	Thu,  2 Apr 2020 15:39:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 032Fd2JW005638 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 2 Apr 2020 11:39:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4CA902166B2B; Thu,  2 Apr 2020 15:39:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48E922166B2F
	for <linux-audit@redhat.com>; Thu,  2 Apr 2020 15:38:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00BC3101A55A
	for <linux-audit@redhat.com>; Thu,  2 Apr 2020 15:38:58 +0000 (UTC)
Received: from sonic313-14.consmr.mail.ne1.yahoo.com
	(sonic313-14.consmr.mail.ne1.yahoo.com [66.163.185.37]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-6-LtOpnlUgMBuT4RDwF3yd8Q-1;
	Thu, 02 Apr 2020 11:38:55 -0400
X-MC-Unique: LtOpnlUgMBuT4RDwF3yd8Q-1
X-YMail-OSG: GJ6dvEsVM1lh6avaxiXiyn22Y8HV9g03fKWIPCJHyjbf50bsPmrv1zeZp12GTgE
	j.eSuhg54qq7ZG.pYNseCi5hxwhPG5EnanSk0mwttk8NTYKwqzanze8tNtp1muCLlqY.gzFe8yzS
	LfGcWsNbX6uvbXm0aO5DLOs5ihaI9TZs9KIFWkcHe9vS9oZtksRTcmSskkjc1Ay1gFSrHmntaic9
	1gwuMLmLtNRen5C2JrmVHtvps4Am04.iRpMTm5bOYMH0dRXx_RWHvCBGhZtWY6u7OelEygfpksYY
	oMtkuZMCEbcHVfi1T0VqIGW0sShb9fT5_5GuQ7IvKQiFH8GueEuD9dyCflGHo2WwSB_l.ijGrjzF
	_tfIdxUolB2mieR1VSSmdXU31rd8UDsxIdBh.KU3I2IvyU62.sIeObfuxZO2lUdTFSnmKsRUgBJy
	A6y1oUTlc6Q9zc_PhTt_B8lD1W.tNZ8B8YgdMnef4PevaHpFtVCHC2XRxdvKAmvc6tHn8R7OfC6g
	plBML5xkmu_X22crv1lZbRomBRXmz8PqSWPKUcifxKpwmRQEnUkG7326_zOwk92NkNQVIZ25o7ZW
	ZQDqO5b.hq3pmpYVmTSRSSy7V6fzPRu1lM7X1SBNCkCQ9YfGY.Ug.MxC5PpXjHrCI.y8YLMrPOUG
	Aj9Hoj3vcIFH6.vx_e1hoer6rM3vP_4b2dKd2rU8S0Q3LvHIo9EY7UNEfE39uPZFOMCXjCXiU7eT
	JFEwDFGC1_Cv0LaBTo4NApvNGT7_n3CaokPNlEo0Q5BRzjTQ7LPXxBvPsKGld0qmIXVrO2CE4QEo
	huv6CJH2pqHbQXejVKxTNHrrr07nLf7U8kPz5hTroc8uV0qDhBLPAr4BqQsj_H9rnvz0al0610fG
	010nIwSN4NbYoI4mks2rxaS_NUlshb_5bF6topFSj_mWHvGzAbqMMSZuJeVZAaFFj6OdfQNMCCW7
	SyGsUqD4YvlRaqVlkv8fKT3lzugZmiiH5jioS7OpobIBafSJeGLepcGeE1GBiRr8Z1HPrWkx.16L
	xYeQoHA1ftatsd5PVda6QLg9FrvVnyDs9tc1oxyTZ6cO_qVpBl1xAb4dOmLQOX43rJLMKJGA3otf
	SxXZtb.0CJInkVOdWAk86reKqcCMpa674B20y3KGoYWNJ7AyA1yCjVLNNPS8bR4MYIKIdHrThSA.
	KVnQ3kQGCPTxUuRN7VQemhSdYsgk7TvD0Abv066vjIXVVcmm6KWV6wlSeHj0ud4gv3LtC1N0oF58
	Bv0gC3MBsitsh_S1TMRZBfWfrXqCL1ijEo1OmnNslRi3rLo9BXvKvr45ThBWK9_TOIEbxgyuAIB8
	_ppn7fEP0IoJkejRjG8SRQJxTRAerJcgKL0aNP8fPDw84z5Gz4KZ36ttUeId2zBsrRMKBmhOWNaZ
	GvhPbQQ--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic313.consmr.mail.ne1.yahoo.com with HTTP;
	Thu, 2 Apr 2020 15:38:55 +0000
Received: by smtp426.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 888e51d1dfccdd95cd8d762db68d7010; 
	Thu, 02 Apr 2020 15:38:51 +0000 (UTC)
Subject: Re: [PATCH ghak96] audit: set cwd in audit context for file-related
	LSM audit records
To: Vladis Dronov <vdronov@redhat.com>, Paul Moore <paul@paul-moore.com>,
	Eric Paris <eparis@redhat.com>, linux-audit@redhat.com,
	James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200402141319.28714-1-vdronov@redhat.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	mQINBFzV9HABEAC/mmv3jeJyF7lR7QhILYg1+PeBLIMZv7KCzBSc/4ZZipoWdmr77Lel/RxQ
	1PrNx0UaM5r6Hj9lJmJ9eg4s/TUBSP67mTx+tsZ1RhG78/WFf9aBe8MSXxY5cu7IUwo0J/CG
	vdSqACKyYPV5eoTJmnMxalu8/oVUHyPnKF3eMGgE0mKOFBUMsb2pLS/enE4QyxhcZ26jeeS6
	3BaqDl1aTXGowM5BHyn7s9LEU38x/y2ffdqBjd3au2YOlvZ+XUkzoclSVfSR29bomZVVyhMB
	h1jTmX4Ac9QjpwsxihT8KNGvOM5CeCjQyWcW/g8LfWTzOVF9lzbx6IfEZDDoDem4+ZiPsAXC
	SWKBKil3npdbgb8MARPes2DpuhVm8yfkJEQQmuLYv8GPiJbwHQVLZGQAPBZSAc7IidD2zbf9
	XAw1/SJGe1poxOMfuSBsfKxv9ba2i8hUR+PH7gWwkMQaQ97B1yXYxVEkpG8Y4MfE5Vd3bjJU
	kvQ/tOBUCw5zwyIRC9+7zr1zYi/3hk+OG8OryZ5kpILBNCo+aePeAJ44znrySarUqS69tuXd
	a3lMPHUJJpUpIwSKQ5UuYYkWlWwENEWSefpakFAIwY4YIBkzoJ/t+XJHE1HTaJnRk6SWpeDf
	CreF3+LouP4njyeLEjVIMzaEpwROsw++BX5i5vTXJB+4UApTAQARAQABtChDYXNleSBTY2hh
	dWZsZXIgPGNhc2V5QHNjaGF1Zmxlci1jYS5jb20+iQJUBBMBCAA+FiEEC+9tH1YyUwIQzUIe
	OKUVfIxDyBEFAlzV9HACGwMFCRLMAwAFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQOKUV
	fIxDyBG6ag/6AiRl8yof47YOEVHlrmewbpnlBTaYNfJ5cZflNRKRX6t4bp1B2YV1whlDTpiL
	vNOwFkh+ZE0eI5M4x8Gw2Oiok+4Q5liA9PHTozQYF+Ia+qdL5EehfbLGoEBqklpGvG3h8JsO
	7SvONJuFDgvab/U/UriDYycJwzwKZuhVtK9EMpnTtUDyP3DY+Q8h7MWsniNBLVXnh4yBIEJg
	SSgDn3COpZoFTPGKE+rIzioo/GJe8CTa2g+ZggJiY/myWTS3quG0FMvwvNYvZ4I2g6uxSl7n
	bZVqAZgqwoTAv1HSXIAn9muwZUJL03qo25PFi2gQmX15BgJKQcV5RL0GHFHRThDS3IyadOgK
	P2j78P8SddTN73EmsG5OoyzwZAxXfck9A512BfVESqapHurRu2qvMoUkQaW/2yCeRQwGTsFj
	/rr0lnOBkyC6wCmPSKXe3dT2mnD5KnCkjn7KxLqexKt4itGjJz4/ynD/qh+gL7IPbifrQtVH
	JI7cr0fI6Tl8V6efurk5RjtELsAlSR6fKV7hClfeDEgLpigHXGyVOsynXLr59uE+g/+InVic
	jKueTq7LzFd0BiduXGO5HbGyRKw4MG5DNQvC//85EWmFUnDlD3WHz7Hicg95D+2IjD2ZVXJy
	x3LTfKWdC8bU8am1fi+d6tVEFAe/KbUfe+stXkgmfB7pxqW5Ag0EXNX0cAEQAPIEYtPebJzT
	wHpKLu1/j4jQcke06Kmu5RNuj1pEje7kX5IKzQSs+CPH0NbSNGvrA4dNGcuDUTNHgb5Be9hF
	zVqRCEvF2j7BFbrGe9jqMBWHuWheQM8RRoa2UMwQ704mRvKr4sNPh01nKT52ASbWpBPYG3/t
	WbYaqfgtRmCxBnqdOx5mBJIBh9Q38i63DjQgdNcsTx2qS7HFuFyNef5LCf3jogcbmZGxG/b7
	yF4OwmGsVc8ufvlKo5A9Wm+tnRjLr/9Mn9vl5Xa/tQDoPxz26+aWz7j1in7UFzAarcvqzsdM
	Em6S7uT+qy5jcqyuipuenDKYF/yNOVSNnsiFyQTFqCPCpFihOnuaWqfmdeUOQHCSo8fD4aRF
	emsuxqcsq0Jp2ODq73DOTsdFxX2ESXYoFt3Oy7QmIxeEgiHBzdKU2bruIB5OVaZ4zWF+jusM
	Uh+jh+44w9DZkDNjxRAA5CxPlmBIn1OOYt1tsphrHg1cH1fDLK/pDjsJZkiH8EIjhckOtGSb
	aoUUMMJ85nVhN1EbU/A3DkWCVFEA//Vu1+BckbSbJKE7Hl6WdW19BXOZ7v3jo1q6lWwcFYth
	esJfk3ZPPJXuBokrFH8kqnEQ9W2QgrjDX3et2WwZFLOoOCItWxT0/1QO4ikcef/E7HXQf/ij
	Dxf9HG2o5hOlMIAkJq/uLNMvABEBAAGJAjwEGAEIACYWIQQL720fVjJTAhDNQh44pRV8jEPI
	EQUCXNX0cAIbDAUJEswDAAAKCRA4pRV8jEPIEWkzEACKFUnpp+wIVHpckMfBqN8BE5dUbWJc
	GyQ7wXWajLtlPdw1nNw0Wrv+ob2RCT7qQlUo6GRLcvj9Fn5tR4hBvR6D3m8aR0AGHbcC62cq
	I7LjaSDP5j/em4oVL2SMgNTrXgE2w33JMGjAx9oBzkxmKUqprhJomPwmfDHMJ0t7y39Da724
	oLPTkQDpJL1kuraM9TC5NyLe1+MyIxqM/8NujoJbWeQUgGjn9uxQAil7o/xSCjrWCP3kZDID
	vd5ZaHpdl8e1mTExQoKr4EWgaMjmD/a3hZ/j3KfTVNpM2cLfD/QwTMaC2fkK8ExMsz+rUl1H
	icmcmpptCwOSgwSpPY1Zfio6HvEJp7gmDwMgozMfwQuT9oxyFTxn1X3rn1IoYQF3P8gsziY5
	qtTxy2RrgqQFm/hr8gM78RhP54UPltIE96VywviFzDZehMvuwzW//fxysIoK97Y/KBZZOQs+
	/T+Bw80Pwk/dqQ8UmIt2ffHEgwCTbkSm711BejapWCfklxkMZDp16mkxSt2qZovboVjXnfuq
	wQ1QL4o4t1hviM7LyoflsCLnQFJh6RSBhBpKQinMJl/z0A6NYDkQi6vEGMDBWX/M2vk9Jvwa
	v0cEBfY3Z5oFgkh7BUORsu1V+Hn0fR/Lqq/Pyq+nTR26WzGDkolLsDr3IH0TiAVH5ZuPxyz6
	abzjfg==
Message-ID: <2d7174b1-115f-b86f-8054-a5caef4b69ff@schaufler-ca.com>
Date: Thu, 2 Apr 2020 08:38:51 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200402141319.28714-1-vdronov@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 032Fd2JW005638
X-loop: linux-audit@redhat.com
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 4/2/2020 7:13 AM, Vladis Dronov wrote:
> Set a current working directory in an audit context for the following record
> types in dump_common_audit_data(): LSM_AUDIT_DATA_PATH, LSM_AUDIT_DATA_FILE,
> LSM_AUDIT_DATA_IOCTL_OP, LSM_AUDIT_DATA_DENTRY, LSM_AUDIT_DATA_INODE so a
> separate CWD record is emitted later.
>
> Link: https://github.com/linux-audit/audit-kernel/issues/96

I don't have a problem with the patch, but it sure would be nice
if you explained why these events "could use a CWD record".

> Signed-off-by: Vladis Dronov <vdronov@redhat.com>
> ---
> out-of-commit-message-note:
>
> Hello,
> Honestly, I'm not sure about "if (!context->in_syscall)" check in
> __audit_getcwd(). It was copied from __audit_getname() and I do
> not quite understand why it is there and if __audit_getcwd() needs
> it. If you have an idea on this, could you please, tell?
>
>  include/linux/audit.h |  9 ++++++++-
>  kernel/auditsc.c      | 17 +++++++++++++++++
>  security/lsm_audit.c  |  5 +++++
>  3 files changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/audit.h b/include/linux/audit.h
> index f9ceae57ca8d..b4306abc5891 100644
> --- a/include/linux/audit.h
> +++ b/include/linux/audit.h
> @@ -268,7 +268,7 @@ extern void __audit_syscall_entry(int major, unsigned long a0, unsigned long a1,
>  extern void __audit_syscall_exit(int ret_success, long ret_value);
>  extern struct filename *__audit_reusename(const __user char *uptr);
>  extern void __audit_getname(struct filename *name);
> -
> +extern void __audit_getcwd(void);
>  extern void __audit_inode(struct filename *name, const struct dentry *dentry,
>  				unsigned int flags);
>  extern void __audit_file(const struct file *);
> @@ -327,6 +327,11 @@ static inline void audit_getname(struct filename *name)
>  	if (unlikely(!audit_dummy_context()))
>  		__audit_getname(name);
>  }
> +static inline void audit_getcwd(void)
> +{
> +	if (unlikely(!audit_dummy_context()))
> +		__audit_getcwd();
> +}
>  static inline void audit_inode(struct filename *name,
>  				const struct dentry *dentry,
>  				unsigned int aflags) {
> @@ -545,6 +550,8 @@ static inline struct filename *audit_reusename(const __user char *name)
>  }
>  static inline void audit_getname(struct filename *name)
>  { }
> +static inline void audit_getcwd(void)
> +{ }
>  static inline void __audit_inode(struct filename *name,
>  					const struct dentry *dentry,
>  					unsigned int flags)
> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 814406a35db1..16316032ef9f 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -1890,6 +1890,23 @@ void __audit_getname(struct filename *name)
>  		get_fs_pwd(current->fs, &context->pwd);
>  }
>  
> +/**
> + * __audit_getcwd - set a current working directory
> + *
> + * Set a current working directory of an audited process for this context.
> + * Called from security/lsm_audit.c:dump_common_audit_data().
> + */
> +void __audit_getcwd(void)
> +{
> +	struct audit_context *context = audit_context();
> +
> +	if (!context->in_syscall)
> +		return;
> +
> +	if (!context->pwd.dentry)
> +		get_fs_pwd(current->fs, &context->pwd);
> +}
> +
>  static inline int audit_copy_fcaps(struct audit_names *name,
>  				   const struct dentry *dentry)
>  {
> diff --git a/security/lsm_audit.c b/security/lsm_audit.c
> index 2d2bf49016f4..7c555621c2bd 100644
> --- a/security/lsm_audit.c
> +++ b/security/lsm_audit.c
> @@ -241,6 +241,7 @@ static void dump_common_audit_data(struct audit_buffer *ab,
>  			audit_log_untrustedstring(ab, inode->i_sb->s_id);
>  			audit_log_format(ab, " ino=%lu", inode->i_ino);
>  		}
> +		audit_getcwd();
>  		break;
>  	}
>  	case LSM_AUDIT_DATA_FILE: {
> @@ -254,6 +255,7 @@ static void dump_common_audit_data(struct audit_buffer *ab,
>  			audit_log_untrustedstring(ab, inode->i_sb->s_id);
>  			audit_log_format(ab, " ino=%lu", inode->i_ino);
>  		}
> +		audit_getcwd();
>  		break;
>  	}
>  	case LSM_AUDIT_DATA_IOCTL_OP: {
> @@ -269,6 +271,7 @@ static void dump_common_audit_data(struct audit_buffer *ab,
>  		}
>  
>  		audit_log_format(ab, " ioctlcmd=0x%hx", a->u.op->cmd);
> +		audit_getcwd();
>  		break;
>  	}
>  	case LSM_AUDIT_DATA_DENTRY: {
> @@ -283,6 +286,7 @@ static void dump_common_audit_data(struct audit_buffer *ab,
>  			audit_log_untrustedstring(ab, inode->i_sb->s_id);
>  			audit_log_format(ab, " ino=%lu", inode->i_ino);
>  		}
> +		audit_getcwd();
>  		break;
>  	}
>  	case LSM_AUDIT_DATA_INODE: {
> @@ -300,6 +304,7 @@ static void dump_common_audit_data(struct audit_buffer *ab,
>  		audit_log_format(ab, " dev=");
>  		audit_log_untrustedstring(ab, inode->i_sb->s_id);
>  		audit_log_format(ab, " ino=%lu", inode->i_ino);
> +		audit_getcwd();
>  		break;
>  	}
>  	case LSM_AUDIT_DATA_TASK: {


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

