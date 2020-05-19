Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 70BE91DA1AF
	for <lists+linux-audit@lfdr.de>; Tue, 19 May 2020 21:59:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589918384;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mDVooybXhVOWJzrOaizwWQWF89Wh8Bnaa50GSYhncc8=;
	b=DYpT/WBYozf1WqDE5+sGs5KxLgcfZ6HMjYAS0/Vxtj1+gyS1dsrKaaCSK+RjzPoQtgL0Sk
	kzQTGWyKPgC4sL44w+JH/gybkuG8mx6Df/JUz9imnABfqab4iMkzAdKZliyPU/ChWF+orh
	niyKQXzHKMHzHjTex0awGSByrdZPe94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-Xs4SjJMBNfmXhUMsWRU1hQ-1; Tue, 19 May 2020 15:59:41 -0400
X-MC-Unique: Xs4SjJMBNfmXhUMsWRU1hQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19983461;
	Tue, 19 May 2020 19:59:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94FED6E716;
	Tue, 19 May 2020 19:59:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF73E4EDA9;
	Tue, 19 May 2020 19:59:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04JJxQv2024102 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 May 2020 15:59:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 54E89B17D8; Tue, 19 May 2020 19:59:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47B0EB17CA
	for <linux-audit@redhat.com>; Tue, 19 May 2020 19:59:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D22C2108C26A
	for <linux-audit@redhat.com>; Tue, 19 May 2020 19:59:23 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-507-3S644w_vOI-B2LXYbQAGgA-1; Tue, 19 May 2020 15:59:19 -0400
X-MC-Unique: 3S644w_vOI-B2LXYbQAGgA-1
Received: by mail-ed1-f66.google.com with SMTP id be9so587751edb.2
	for <linux-audit@redhat.com>; Tue, 19 May 2020 12:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BMIDPgMbHVu3g+tSpT5bxTKgYe2ruTghD+dp0Ce+ezo=;
	b=Fld1jv91KvBqBcbST+A0tre7GdrZXbROkdlSssjN3HvPYqIkuBCxt0yR7RsGUQ8UIJ
	s1Ibs8D2c10tW2TRWRIkSM3ZXarfx+3QMTWkPMJd+UCDmqwywdfOwZ2lQLZ0yiJ5/y8F
	8F1F34gLQmDN6X2py/szkXmww6c10lnruGmfuPTDHYwzv5za46E2jvLY2aRRJ/qXhVGd
	Z7zrebVVVvWSbLH8URcAJAP8wl3BmZhvErOIML7cAHcRzgDs/YJNatOEKtJCCVyYg8h7
	1xOcwdFqLOe09kbriRf5rzlK7RZK601mXlfo7LXd5SqJIwlHLmQJjl9f8vOBr0amC2QG
	U+tg==
X-Gm-Message-State: AOAM530dWHW8OCPxnpkddXmuwB7LhRegHA08bI3sTC0R8vnjtU0I/Q9r
	AkrG6IRj4NwStpWecsBOISBonGgHz3jhtbDMeOhY
X-Google-Smtp-Source: ABdhPJz65RXV/YZirbNciXMjDODPfXWd7iH/a+VM6sKDALr2hlZkHrs+ze8+PoO2Ue4Kga0UI8IYhfgPg7XEruoS49s=
X-Received: by 2002:a05:6402:14d3:: with SMTP id
	f19mr444826edx.135.1589918358022; 
	Tue, 19 May 2020 12:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <2794b22c0b88637a4270b346e52aeb8db7f59457.1589853445.git.rgb@redhat.com>
	<CAHC9VhQYUooJbZ9tcOOwb=48LTjtnfo0g11vQuyLzoxdetaxnw@mail.gmail.com>
	<20200519194457.nouzteqv2vpcqnta@madcap2.tricolour.ca>
In-Reply-To: <20200519194457.nouzteqv2vpcqnta@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 19 May 2020 15:59:05 -0400
Message-ID: <CAHC9VhQRSwTURYZ2dL_YWqi-xnPfFGN_Aef73mip=eYNVfObRw@mail.gmail.com>
Subject: Re: [PATCH ghak25 v5] audit: add subj creds to NETFILTER_CFG record
	to cover async unregister
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 19, 2020 at 3:45 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-05-19 15:18, Paul Moore wrote:
> > On Tue, May 19, 2020 at 11:31 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > Some table unregister actions seem to be initiated by the kernel to
> > > garbage collect unused tables that are not initiated by any userspace
> > > actions.  It was found to be necessary to add the subject credentials to
> > > cover this case to reveal the source of these actions.  A sample record:
> > >
> > > The tty, ses and exe fields have not been included since they are in the
> > > SYSCALL record and contain nothing useful in the non-user context.
> > >
> > >   type=NETFILTER_CFG msg=audit(2020-03-11 21:25:21.491:269) : table=nat family=bridge entries=0 op=unregister pid=153 uid=root auid=unset subj=system_u:system_r:kernel_t:s0 comm=kworker/u4:2
> >
> > Based on where things were left in the discussion on the previous
> > draft, I think it would be good if you could explain a bit why the uid
> > and auid fields are useful here.
>
> They aren't really useful here.  I was hoping to remove them given your
> reasoning, but I was having trouble guessing what you wanted even after
> asking for clarity.  Can you clarify what you would prefer to see in
> this patch?

/me heavily rolls eyes

In my last email to you I said:

"I think it is pointless to record the subject info in this record as we
either have that info from other records in the event or there is no
valid subject info to record."

... I also said:

"As I've mentioned in the thread above, including the auid was done as
a concession to Steve, I don't think it serves any useful purpose."

If phrases like "pointless to record the subject info" and "I don't
think it serves any useful purpose" leave you unsure about what to do,
I'm at a bit of a loss.

Drop the "uid" field.  Drop the "auid" field.  Hopefully those last
two statements should remove any ambiguity from your mind.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

