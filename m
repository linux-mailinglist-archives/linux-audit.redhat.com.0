Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 592A06913C4
	for <lists+linux-audit@lfdr.de>; Thu,  9 Feb 2023 23:54:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675983292;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/VLzKOwtJchRfcisirnod4NYvTreVxtaxfgOyB2Qt7c=;
	b=O2PaX25xpwOFzIM8oE3Nf2SLggNCDCM1pdHRFZkH8VQuKZs9+LQ8kMVOL5OA2BDlWRWm1y
	pAv2CH32ESL1FekdFCs3PoQdcLuwAZKxrk6Iv+zAx4QG0R15sc09X6ElVSy0FDDNmSdBPH
	8WI2qapPTC0gDW2q1dCFmV8SObhNLW8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-9V7Hr6gPNgOAcujYbzaLAA-1; Thu, 09 Feb 2023 17:54:49 -0500
X-MC-Unique: 9V7Hr6gPNgOAcujYbzaLAA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71F702803618;
	Thu,  9 Feb 2023 22:54:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 559AC40C83B6;
	Thu,  9 Feb 2023 22:54:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DBE4119465A0;
	Thu,  9 Feb 2023 22:54:45 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 679D5194658D for <linux-audit@listman.corp.redhat.com>;
 Thu,  9 Feb 2023 22:42:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 29DD22166B2A; Thu,  9 Feb 2023 22:42:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22DEC2166B29
 for <linux-audit@redhat.com>; Thu,  9 Feb 2023 22:42:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E585B101A521
 for <linux-audit@redhat.com>; Thu,  9 Feb 2023 22:42:48 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
 relay.mimecast.com with ESMTP id us-mta-318-dBJuOm_TNuCbfx4SPWnupg-1; Thu,
 09 Feb 2023 17:42:45 -0500
X-MC-Unique: dBJuOm_TNuCbfx4SPWnupg-1
Received: by linux.microsoft.com (Postfix, from userid 1052)
 id F1D2D20C8AF3; Thu,  9 Feb 2023 14:42:43 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com F1D2D20C8AF3
Date: Thu, 9 Feb 2023 14:42:43 -0800
From: Fan Wu <wufan@linux.microsoft.com>
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [RFC PATCH v9 06/16] ipe: add LSM hooks on execution and kernel
 read
Message-ID: <20230209224243.GA9462@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
 <1675119451-23180-7-git-send-email-wufan@linux.microsoft.com>
 <412da9a9da2e75e896911f01bfd735dd4b5789f4.camel@huaweicloud.com>
MIME-Version: 1.0
In-Reply-To: <412da9a9da2e75e896911f01bfd735dd4b5789f4.camel@huaweicloud.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Thu, 09 Feb 2023 22:54:44 +0000
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, tytso@mit.edu,
 dm-devel@redhat.com, corbet@lwn.net, roberto.sassu@huawei.com,
 Deven Bowers <deven.desai@linux.microsoft.com>, linux-doc@vger.kernel.org,
 snitzer@kernel.org, jmorris@namei.org, zohar@linux.ibm.com,
 linux-kernel@vger.kernel.org, ebiggers@kernel.org,
 linux-security-module@vger.kernel.org, linux-audit@redhat.com,
 eparis@redhat.com, linux-fscrypt@vger.kernel.org,
 linux-integrity@vger.kernel.org, agk@redhat.com, serge@hallyn.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 31, 2023 at 01:51:39PM +0100, Roberto Sassu wrote:
> On Mon, 2023-01-30 at 14:57 -0800, Fan Wu wrote:
> > +
> > +/**
> > + * ipe_mmap_file - ipe security hook function for mmap check.
> > + * @f: File being mmap'd. Can be NULL in the case of anonymous memory.
> > + * @reqprot: The requested protection on the mmap, passed from usermode.
> > + * @prot: The effective protection on the mmap, resolved from reqprot and
> > + *	  system configuration.
> > + * @flags: Unused.
> > + *
> > + * This hook is called when a file is loaded through the mmap
> > + * family of system calls.
> > + *
> > + * Return:
> > + * * 0	- OK
> > + * * !0	- Error
> > + */
> > +int ipe_mmap_file(struct file *f, unsigned long reqprot, unsigned long prot,
> > +		  unsigned long flags)
> > +{
> > +	struct ipe_eval_ctx ctx = { 0 };
> > +
> > +	if (prot & PROT_EXEC || reqprot & PROT_EXEC) {
> 
> Since the kernel only adds flags and doesn't clear them, isn't safe to
> just consider prot? Oh, you mentioned it in the changelog, maybe just
> for ipe_file_mprotect().
> 

Thanks for pointing that out, yes reqprot it indeed unnecessary, I will remove
this part in the next version. 

> > +		build_eval_ctx(&ctx, f, ipe_op_exec);
> > +		return ipe_evaluate_event(&ctx);
> > +	}
> 
> Uhm, I think some considerations that IMA does for mmap() are relevant
> also for IPE.
> 
> For example, look at mmap_violation_check(). It checks if there are
> writable mappings, and if yes, it denies the access.
> 
> Similarly for mprotect(), is adding PROT_EXEC safe?
> 

Yes, writable mapping might need to treat differently. But for the current version
I think it is safe because currently we only support dmverity and fsverity,
they are inherently read-only.

But if in the future if there is a feature can support writable mapping, IPE might
better provide user the flexibility to allow or deny execute writable mappings,
for example, adding a new property like file_writable=TRUE. Then user can deploy
a rule like op=EXECUTE file_writable=TRUE action=DENY to deny execute a writable
mapping.

> >  
> > @@ -12,6 +13,11 @@ static struct lsm_blob_sizes ipe_blobs __lsm_ro_after_init = {
> >  
> >  static struct security_hook_list ipe_hooks[] __lsm_ro_after_init = {
> >  	LSM_HOOK_INIT(sb_free_security, ipe_sb_free_security),
> > +	LSM_HOOK_INIT(bprm_check_security, ipe_bprm_check_security),
> > +	LSM_HOOK_INIT(mmap_file, ipe_mmap_file),
> > +	LSM_HOOK_INIT(file_mprotect, ipe_file_mprotect),
> > +	LSM_HOOK_INIT(kernel_read_file, ipe_kernel_read_file),
> > +	LSM_HOOK_INIT(kernel_load_data, ipe_kernel_load_data),
> >  };
> 
> Uhm, maybe I would incorporate patch 1 with this.
> 
> Roberto

This might not be possible because this patch has some dependencies on the previous patches.
-Fan

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

