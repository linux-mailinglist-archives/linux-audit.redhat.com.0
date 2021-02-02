Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id ACC1C30CE2A
	for <lists+linux-audit@lfdr.de>; Tue,  2 Feb 2021 22:46:46 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-Fryjhn0eNQ-EhI8QDhU97Q-1; Tue, 02 Feb 2021 16:46:42 -0500
X-MC-Unique: Fryjhn0eNQ-EhI8QDhU97Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48296107ACE3;
	Tue,  2 Feb 2021 21:46:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA01D6EF59;
	Tue,  2 Feb 2021 21:46:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A186618095CB;
	Tue,  2 Feb 2021 21:46:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 112LkEE8017676 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 2 Feb 2021 16:46:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E46EABE5D5; Tue,  2 Feb 2021 21:46:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEDABEAF93
	for <linux-audit@redhat.com>; Tue,  2 Feb 2021 21:46:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AC02800B3B
	for <linux-audit@redhat.com>; Tue,  2 Feb 2021 21:46:11 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-39-e_tffv2TMO6drDhZ89IkvQ-1; Tue, 02 Feb 2021 16:46:09 -0500
X-MC-Unique: e_tffv2TMO6drDhZ89IkvQ-1
Received: by mail-ed1-f42.google.com with SMTP id r22so44227edo.11
	for <linux-audit@redhat.com>; Tue, 02 Feb 2021 13:46:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Vykfbz7/KbotLyXDV6UDBOVFIIhhqEAPP4iNreMMRi8=;
	b=lRZv5/zMrau24CUgPeFu9O0LmhPplaJ9bpORIqs7ZoV2KqEhZApSKYAgJL4pecHsvk
	X8REPHL0wJw8I3gETAT2VQ/VNOM5HybWFlPYdT73IequO9mWiFdXe+UYT5ksn2eitD5e
	iKT5wtqw1ZALbtX+cN9N9ItAZpn5AuTmK83IcPdYJ9aOd+mZIcxfviT+0f21mbRvNh2G
	L2fHV3HtR6ACcL2p/by2RzPQ/207e62milJT6CTW570V+Mkg/v6uO3tc6nmtoHsxzJLB
	g6CYhcDYLyZhi7Hv5AosXo7jGK2UB4rlVU5pFDur6mvhRfpTFFciiE1paiWe3vW1BAPF
	RMzw==
X-Gm-Message-State: AOAM530hF10/kounjwSAoCh/xutFLJPe7Rt20Dj1cIu1tqvfOmfZ6nBQ
	Dpkqyu6HAdbHNiakYaD2bUW7/QILkpLHbH40GQSM
X-Google-Smtp-Source: ABdhPJywY/QThq2tkmbGF5CT7h5pJ5vsKD7paTZ7hsCCLFKMhsTboGdKzTlxlX3jS+mSMamk2GF/JciP/AI8yRl77WY=
X-Received: by 2002:a05:6402:6d6:: with SMTP id
	n22mr136386edy.128.1612302367766; 
	Tue, 02 Feb 2021 13:46:07 -0800 (PST)
MIME-Version: 1.0
References: <20210202212930.18845-1-danielwa@cisco.com>
	<CAHC9VhShkEJHWmuE2C_RLQy-Z3CpvAhTj68ki22v=AKF5hfvrQ@mail.gmail.com>
	<20210202214357.GD3710@zorba>
In-Reply-To: <20210202214357.GD3710@zorba>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 2 Feb 2021 16:45:56 -0500
Message-ID: <CAHC9VhSVBV=_pBnj7sxwJu0siXx5P7JrsYSz1_vW3j6WmTw+6w@mail.gmail.com>
Subject: Re: [PATCH 1/2] audit: show user land backtrace as part of audit
	context messages
To: "Daniel Walker (danielwa)" <danielwa@cisco.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: "Victor Kamensky \(kamensky\)" <kamensky@cisco.com>,
	"Ruslan Bilovol -X \(rbilovol - GLOBALLOGIC INC at Cisco\)"
	<rbilovol@cisco.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>,
	"xe-linux-external\(mailer list\)" <xe-linux-external@cisco.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 2, 2021 at 4:44 PM Daniel Walker (danielwa)
<danielwa@cisco.com> wrote:
> On Tue, Feb 02, 2021 at 04:35:42PM -0500, Paul Moore wrote:
> > On Tue, Feb 2, 2021 at 4:29 PM Daniel Walker <danielwa@cisco.com> wrote:
> > > From: Victor Kamensky <kamensky@cisco.com>
> > >
> > > To efficiently find out where SELinux AVC denial is comming from
> > > take backtrace of user land process and display it as type=UBACKTRACE
> > > message that comes as audit context for SELinux AVC and other audit
> > > messages ...
> >
> > Have you tried the new perf tracepoint for SELinux AVC decisions that
> > trigger an audit event?  It's a new feature for v5.10 and looks to
> > accomplish most of what you are looking for with this patch.
> >
> > * https://www.paul-moore.com/blog/d/2020/12/linux_v510.html
>
> We haven't tried it, but I can look into it. We're not using v5.10 extensively
> yet.

Let us know if that works for you, and if it doesn't, let us know what
might be missing.  I hate seeing the kernel grow multiple features
which do the same thing.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

