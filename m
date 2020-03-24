Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id ADDF91902B6
	for <lists+linux-audit@lfdr.de>; Tue, 24 Mar 2020 01:17:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585009055;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kqPGABOVKHPoBRORWBso9T5AXSEQSyxZuvsxHlRrSA0=;
	b=c+NQbWE6G2fGVURO7ncDy5/RD9gb2Bn8Q94ta2SiBzVfD1L2+4XP5pZQJPoZgBiigppRbX
	qZsU6pWH2WVSzhNpkdYuPXOxmgLVL8M56uXBoZ42ts/qADCpnvHjCNPFj60XbpD561QtPs
	75n514ACn888sMfMkqlfEmbfs1oAk/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-PwdprqKOPfyf2wdFzE_NRg-1; Mon, 23 Mar 2020 20:17:33 -0400
X-MC-Unique: PwdprqKOPfyf2wdFzE_NRg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4953D100550E;
	Tue, 24 Mar 2020 00:17:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 687D88CCE2;
	Tue, 24 Mar 2020 00:17:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7DD258A030;
	Tue, 24 Mar 2020 00:17:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02O0GxP5020684 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 23 Mar 2020 20:16:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ED77D10AF413; Tue, 24 Mar 2020 00:16:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E95FB10AF411
	for <linux-audit@redhat.com>; Tue, 24 Mar 2020 00:16:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE4E1185A78E
	for <linux-audit@redhat.com>; Tue, 24 Mar 2020 00:16:56 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-32-Y6cFAR9DPSajMtvJPcD9xg-1; Mon, 23 Mar 2020 20:16:52 -0400
X-MC-Unique: Y6cFAR9DPSajMtvJPcD9xg-1
Received: by mail-ed1-f66.google.com with SMTP id u59so18594091edc.12
	for <linux-audit@redhat.com>; Mon, 23 Mar 2020 17:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=d/2Y64PABVXdc9ONlMpskyvi+SAnumMA7Crj5Bt/DBQ=;
	b=Vagos5DrmtOIAZQf0SYiyDBL2fPtAv5Mpf7u1QORpSACanszdiXaaNCwVnbuvo+/AD
	lAK0LLRKd+x/+vjHb8yNPLJye7ecdex34QF/NyuiQIpw2UstVcIofh2UQwyG+XEAKRZk
	PZ6RD3Mw8tJwCe/pwdJJSr+QrMMNcjWUxpryec5sMBoJHwABOpPTgZ+3CFW6Yc8NXz0u
	uxnLSS8MzNN+fVkIJJFbRtfvdFeTFdjlFSxtY6r48lLgyxwHYfHfTy2nXCJk4H2VT3hW
	hHT5JaRTGAEByq+XUQt6dpkARMYzy8QTbhSWaaK46rrZlHNAqxWOMmTBQuEK8LGmE24Z
	im+A==
X-Gm-Message-State: ANhLgQ3Dfd753bClk/xwdeiwF5bO2mSRrN4EsVDSFWC+lL73fca7OLXL
	Kpm3fNLjFBuYqXkIiPyeueF91gGo8NJBarRrriIn5xs=
X-Google-Smtp-Source: ADFU+vsjQok/w3GcfT1LJO6k41X3syl3c/RCvqnEbN1LGDpZdSJHQ9PBkLkvozzz1CLw+59ARBWSon4cJDwpW8rrY9U=
X-Received: by 2002:a17:906:4b52:: with SMTP id
	j18mr13098102ejv.272.1585009010419; 
	Mon, 23 Mar 2020 17:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAHC9VhTiCHQbp2SwK0Xb1QgpUZxOQ26JKKPsVGT0ZvMqx28oPQ@mail.gmail.com>
	<CAHC9VhS09b_fM19tn7pHZzxfyxcHnK+PJx80Z9Z1hn8-==4oLA@mail.gmail.com>
	<20200312193037.2tb5f53yeisfq4ta@madcap2.tricolour.ca>
	<CAHC9VhQoVOzy_b9W6h+kmizKr1rPkC4cy5aYoKT2i0ZgsceNDg@mail.gmail.com>
	<20200313185900.y44yvrfm4zxa5lfk@madcap2.tricolour.ca>
	<CAHC9VhR2zCCE5bjH75rSwfLC7TJGFj4RBnrtcOoUiqVp9q5TaA@mail.gmail.com>
	<20200318212630.mw2geg4ykhnbtr3k@madcap2.tricolour.ca>
	<CAHC9VhRYvGAru3aOMwWKCCWDktS+2pGr+=vV4SjHW_0yewD98A@mail.gmail.com>
	<20200318215550.es4stkjwnefrfen2@madcap2.tricolour.ca>
	<CAHC9VhSdDDP7Ec-w61NhGxZG5ZiekmrBCAg=Y=VJvEZcgQh46g@mail.gmail.com>
	<20200319220249.jyr6xmwvflya5mks@madcap2.tricolour.ca>
In-Reply-To: <20200319220249.jyr6xmwvflya5mks@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 23 Mar 2020 20:16:38 -0400
Message-ID: <CAHC9VhR84aN72yNB_j61zZgrQV1y6yvrBLNY7jp7BqQiEDL+cw@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 07/16] audit: add contid support for signalling
	the audit daemon
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02O0GxP5020684
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	linux-audit@redhat.com, netfilter-devel@vger.kernel.org,
	ebiederm@xmission.com, simo@redhat.com, netdev@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 19, 2020 at 6:03 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-03-18 18:06, Paul Moore wrote:

...

> > I hope we can do better than string manipulations in the kernel.  I'd
> > much rather defer generating the ACID list (if possible), than
> > generating a list only to keep copying and editing it as the record is
> > sent.
>
> At the moment we are stuck with a string-only format.

Yes, we are.  That is another topic, and another set of changes I've
been deferring so as to not disrupt the audit container ID work.

I was thinking of what we do inside the kernel between when the record
triggering event happens and when we actually emit the record to
userspace.  Perhaps we collect the ACID information while the event is
occurring, but we defer generating the record until later when we have
a better understanding of what should be included in the ACID list.
It is somewhat similar (but obviously different) to what we do for
PATH records (we collect the pathname info when the path is being
resolved).

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

