Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EA38D693A8B
	for <lists+linux-audit@lfdr.de>; Sun, 12 Feb 2023 23:48:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676242098;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cRLKr0vCVPV4D5RcXmaVwMusphmifHugrd/Q2yaT99w=;
	b=OuW96Ibex4JbpVAdf2Cx2Vlo380ySa0tNhsmr5uRp3RQPaHo2IQYZ1xyS+Z0bTJAkRk5pi
	+iLI4Q0zEnmu6yLklnWANUqtydruL8uxgJRFcd55TPFvzjsmc4E7tQSBSFbuYzNm0i+Ome
	r+enjNcwXUd6MZJ10A50UB/uSoehYuw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-QUHR_30aOCCQ6Zb_xTcxdg-1; Sun, 12 Feb 2023 17:48:14 -0500
X-MC-Unique: QUHR_30aOCCQ6Zb_xTcxdg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D33E285A588;
	Sun, 12 Feb 2023 22:48:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 677684051E44;
	Sun, 12 Feb 2023 22:48:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BD57C19465A0;
	Sun, 12 Feb 2023 22:48:00 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BC3FC194658F for <linux-audit@listman.corp.redhat.com>;
 Fri, 10 Feb 2023 23:21:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7D3BE2166B2A; Fri, 10 Feb 2023 23:21:57 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7686A2166B29
 for <linux-audit@redhat.com>; Fri, 10 Feb 2023 23:21:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 540132817234
 for <linux-audit@redhat.com>; Fri, 10 Feb 2023 23:21:57 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
 relay.mimecast.com with ESMTP id us-mta-661-z6XYjHh_OxiRTy1sVTNaNg-1; Fri,
 10 Feb 2023 18:21:55 -0500
X-MC-Unique: z6XYjHh_OxiRTy1sVTNaNg-1
Received: by linux.microsoft.com (Postfix, from userid 1052)
 id 0D21520C8B19; Fri, 10 Feb 2023 15:21:54 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0D21520C8B19
Date: Fri, 10 Feb 2023 15:21:54 -0800
From: Fan Wu <wufan@linux.microsoft.com>
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [RFC PATCH v9 03/16] ipe: add evaluation loop and introduce
 'boot_verified' as a trust provider
Message-ID: <20230210232154.GA17962@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
 <1675119451-23180-4-git-send-email-wufan@linux.microsoft.com>
 <061df661004a06ef1e8790d48157c7ba4ecfc009.camel@huaweicloud.com>
MIME-Version: 1.0
In-Reply-To: <061df661004a06ef1e8790d48157c7ba4ecfc009.camel@huaweicloud.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Sun, 12 Feb 2023 22:47:58 +0000
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

On Tue, Jan 31, 2023 at 04:49:44PM +0100, Roberto Sassu wrote:
> On Mon, 2023-01-30 at 14:57 -0800, Fan Wu wrote:
> > From: Deven Bowers <deven.desai@linux.microsoft.com>
> > 
> > IPE must have a centralized function to evaluate incoming callers
> > against IPE's policy. This iteration of the policy against the rules
> > for that specific caller is known as the evaluation loop.
> 
> Not sure if you check the properties at every access.
> 
> >From my previous comments (also for previous versions of the patches)
> you could evaluate the property once, by calling the respective
> functions in the other subsystems.
> 
> Then, you reserve space in the security blob for inodes and superblocks
> to cache the decision. The format could be a policy sequence number, to
> ensure that the cache is valid only for the current policy, and a bit
> for every hook you enforce.

Thanks for raising this idea. I agree that if the property evaluation
leads to a performance issue, it will be better to cache the evaluation
result. But for this version, all the property evaluations are simple,
so it is just as fast as accessing a cache. Also, for the initial
version we prefer to keep the patch as minimal as possible. 

If the policy evolved to be super complex and the evaluation becomes
a bottleneck, cache support will absolutely be the right way we will go.
-Fan

> 
> Also, currently you rely on the fact that the properties you defined
> are immutable and the immutability is guaranteed by the other
> subsystems, so no write can occur.
> 
> But if you remove this limitation, the immutability is not guaranteed
> anymore by the other subsystems (for example if a file is in an ext4
> filesystem), the LSM needs to take extra care to ensure that the
> properties are still verified. This would be required for example if
> IPE is used in conjuction with DIGLIM.
> 
> In my opinion, IPE value would increase if the generic enforcement
> mechanism is property-agnostic.
> 
> Roberto
> 

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

