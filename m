Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E55521DC205
	for <lists+linux-audit@lfdr.de>; Thu, 21 May 2020 00:25:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590013513;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Q4qOtZdMC7xpNF0M6n8dRUNCANa3mK/jpKcfdYXqhUc=;
	b=Vw3vBAdnEyKe77pppKcvAxyUI6CJwjbUblIB0SWJX33uk+yK0Hy5elZe2BZUROeJFQTmdP
	Pbvf/OHh5QS4r5CSzohi/wndF6om0Pw8vEwKmT9wvE/Hn+KPVwPK8LaAdAXZOiHkf/Ae/B
	FqYCVZxBNr4DitXD2ILbDmq9SZOx6bI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-zPYQP1nqObS2s-RFiYsYvg-1; Wed, 20 May 2020 18:25:11 -0400
X-MC-Unique: zPYQP1nqObS2s-RFiYsYvg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AFB5872FE0;
	Wed, 20 May 2020 22:25:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45FE648D8D;
	Wed, 20 May 2020 22:25:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE3904EDB8;
	Wed, 20 May 2020 22:24:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04KMOfhD007235 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 20 May 2020 18:24:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2DC17202683E; Wed, 20 May 2020 22:24:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A09A2026DFD
	for <linux-audit@redhat.com>; Wed, 20 May 2020 22:24:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27389811E77
	for <linux-audit@redhat.com>; Wed, 20 May 2020 22:24:39 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-316-Qz0oGpCDOliQT2SyAXayHw-1; Wed, 20 May 2020 18:24:36 -0400
X-MC-Unique: Qz0oGpCDOliQT2SyAXayHw-1
Received: by mail-ed1-f68.google.com with SMTP id l25so4970722edj.4
	for <linux-audit@redhat.com>; Wed, 20 May 2020 15:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gSA5WX2rtYW1qr92WeUFtesNCfHgIL2bBAZXuvDm0SU=;
	b=Cd5V4LltzJMkEamy6sgrazzYapP4IY2P/ApvKD5O88O2uRksCCOAlwXfeRtJFJCdPH
	w/Vu0Fw5M/jOQvImM6Kq7D8d90Bg6ROxNO4UTwRtakb4oVYUVG8Y6okvFaE0NhLuWRLf
	DOszMF3e4N4JgZGuUv9ebAlNX2+n1ZQwHoCDo3oD9pC/il+xpbXz7lm308WIDiFWOmd3
	6RA2Ir3IIM7n2F85rNUl+RvfnmoIZOGweE12UWA8YabkNDQRSntRjjo4ZoKupR4b/ufW
	c0s3tnmtDcI23KUn1o62nahziSK6030D5q1l/j6U39Vvu3MlO69uxfL5lqpM5R8l1v1W
	1o7w==
X-Gm-Message-State: AOAM531LdsobuGqLzdKNN+tHwXpzncRM71ENd9q75eqZxG1vTUZRFY3T
	UZIxigFpDp2Th/vCElF+0R2R63FqpkSvOjEiKUso
X-Google-Smtp-Source: ABdhPJwyqUoPXRS1K83vaC0amG6iqYApHCZJSf4TceWjICSJ1ftF4STVZFMnk8HOeRoFwUQbHOTEDke4sib5YKcAtW4=
X-Received: by 2002:a05:6402:14d3:: with SMTP id
	f19mr5159480edx.135.1590013474492; 
	Wed, 20 May 2020 15:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <6404938413ca29b0e0196dd74bacb9b0c1cb6f42.1589993784.git.rgb@redhat.com>
In-Reply-To: <6404938413ca29b0e0196dd74bacb9b0c1cb6f42.1589993784.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 20 May 2020 18:24:23 -0400
Message-ID: <CAHC9VhT9MBseD87hOq-9FN7-fdKEPn5bcvUYiX3S3Nu4EJwiig@mail.gmail.com>
Subject: Re: [PATCH ghak25 v6a] audit: add subj creds to NETFILTER_CFG record
	to cover async unregister
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, twoerner@redhat.com,
	Eric Paris <eparis@parisplace.org>, tgraf@infradead.org
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 20, 2020 at 2:47 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Some table unregister actions seem to be initiated by the kernel to
> garbage collect unused tables that are not initiated by any userspace
> actions.  It was found to be necessary to add the subject credentials to
> cover this case to reveal the source of these actions.  A sample record:
>
> The uid, auid, tty, ses and exe fields have not been included since they
> are in the SYSCALL record and contain nothing useful in the non-user
> context.
>
> Here are two sample orphaned records:
>
>   type=NETFILTER_CFG msg=audit(2020-05-20 12:14:36.505:5) : table=filter family=ipv4 entries=0 op=register pid=1 subj=kernel comm=swapper/0
>
>   type=NETFILTER_CFG msg=audit(2020-05-20 12:15:27.701:301) : table=nat family=bridge entries=0 op=unregister pid=30 subj=system_u:system_r:kernel_t:s0 comm=kworker/u4:1
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>

Merged into audit/next, thanks Richard.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

