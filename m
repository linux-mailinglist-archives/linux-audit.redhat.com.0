Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 28F73318FF1
	for <lists+linux-audit@lfdr.de>; Thu, 11 Feb 2021 17:30:39 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-dFqqBhRDOROHq_G2J_TmjQ-1; Thu, 11 Feb 2021 11:30:36 -0500
X-MC-Unique: dFqqBhRDOROHq_G2J_TmjQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00C955220;
	Thu, 11 Feb 2021 16:30:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EC8C1F40D;
	Thu, 11 Feb 2021 16:30:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BB06350033;
	Thu, 11 Feb 2021 16:30:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11BGTrM3026584 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 11 Feb 2021 11:29:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 87D3B2026D14; Thu, 11 Feb 2021 16:29:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82DE52026D13
	for <linux-audit@redhat.com>; Thu, 11 Feb 2021 16:29:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F88B185A793
	for <linux-audit@redhat.com>; Thu, 11 Feb 2021 16:29:51 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
	[209.85.218.54]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-551-KFsyAk7aMDiXuLHSVY283g-1; Thu, 11 Feb 2021 11:29:46 -0500
X-MC-Unique: KFsyAk7aMDiXuLHSVY283g-1
Received: by mail-ej1-f54.google.com with SMTP id l25so10968770eja.9
	for <linux-audit@redhat.com>; Thu, 11 Feb 2021 08:29:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=ABj8h6JxoKzCkEFlLOPlFl55Hb6x4ubH36UnScGj9KU=;
	b=A72LIC647cF7gtJyCaBaQB92FF8e42gk5Kb5fl81RM5zvzjfQXoyG/eQDoSlJmBDwi
	tOCBnP7BTuLyvH0GYxnY3sPWUFJmf+pEtHfhujArnGzkK33zPYsQvlCUW+OeDIS3JVLW
	tSD7aAAmiuPlOjqOkJfuT+Tyf3nPslonDoW93lFrqMnCM5e6veHQrmp+ONOFgCcqeGVK
	N2qIpSnFgjNWGtzkx/8ulCa+hdV/iJOW0odsEK9Hob2ZMazjFsRd0RpXBJlJpjv61qp/
	C7yMG9st4TtdzwcKgdhM8hN09jVGglzXpjA9h+QkY/SXf3A3nasWETNRPXai2mCk4PoU
	E31Q==
X-Gm-Message-State: AOAM533l94XjBtjOGMbpNPFAK4G/RdiZ70RYw5QsNDpDpVyzVu3rjWSV
	NTRgxJFAA/p9fxgAWsWHHlgn7YNE5pThKEVYashG
X-Google-Smtp-Source: ABdhPJweNZP4TzMhtMYaYgcn1PzXigwCB0MySFfbTC8o7Eq1L6ARWGPA1NXZPn9sU34dwjLDUP8/GMbabKeHGrzw3ck=
X-Received: by 2002:a17:906:35d9:: with SMTP id
	p25mr9185445ejb.398.1613060985419; 
	Thu, 11 Feb 2021 08:29:45 -0800 (PST)
MIME-Version: 1.0
References: <f9da8b5dbf2396b621c77c17b5b1123be5aa484e.1591275439.git.rgb@redhat.com>
	<20210211151606.GX3158@orbyte.nwl.cc>
In-Reply-To: <20210211151606.GX3158@orbyte.nwl.cc>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 11 Feb 2021 11:29:34 -0500
Message-ID: <CAHC9VhTNQW9d=8GCW-70vAEMh8-LXviP+JHFC2-YkuitokLLMQ@mail.gmail.com>
Subject: Re: [PATCH ghak124 v3] audit: log nftables configuration change events
To: Phil Sutter <phil@nwl.cc>, Richard Guy Briggs <rgb@redhat.com>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, netfilter-devel@vger.kernel.org,
	Paul Moore <paul@paul-moore.com>, sgrubb@redhat.com,
	Ondrej Mosnacek <omosnace@redhat.com>, fw@strlen.de,
	twoerner@redhat.com, Eric Paris <eparis@parisplace.org>,
	tgraf@infradead.org
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 11, 2021 at 10:16 AM Phil Sutter <phil@nwl.cc> wrote:
> Hi,
>
> On Thu, Jun 04, 2020 at 09:20:49AM -0400, Richard Guy Briggs wrote:
> > iptables, ip6tables, arptables and ebtables table registration,
> > replacement and unregistration configuration events are logged for the
> > native (legacy) iptables setsockopt api, but not for the
> > nftables netlink api which is used by the nft-variant of iptables in
> > addition to nftables itself.
> >
> > Add calls to log the configuration actions in the nftables netlink api.
>
> As discussed offline already, these audit notifications are pretty hefty
> performance-wise. In an internal report, 300% restore time of a ruleset
> containing 70k set elements is measured.

If you're going to reference offline/off-list discussions in a post to
a public list, perhaps the original discussion shouldn't have been
off-list ;)  If you don't involve us in the discussion, we have to
waste a lot of time getting caught up.

> If I'm not mistaken, iptables emits a single audit log per table, ipset
> doesn't support audit at all. So I wonder how much audit logging is
> required at all (for certification or whatever reason). How much
> granularity is desired?

That's a question for the people who track these certification
requirements, which is thankfully not me at the moment.  Unless
somebody else wants to speak up, Steve Grubb is probably the only
person who tracks that sort of stuff and comments here.

I believe the netfilter auditing was mostly a nice-to-have bit of
functionality to help add to the completeness of the audit logs, but I
could very easily be mistaken.  Richard put together those patches, he
can probably provide the background/motivation for the effort.

> I personally would notify once per transaction. This is easy and quick.
> Once per table or chain should be acceptable, as well. At the very
> least, we should not have to notify once per each element. This is the
> last resort of fast ruleset adjustments. If we lose it, people are
> better off with ipset IMHO.
>
> Unlike nft monitor, auditd is not designed to be disabled "at will". So
> turning it off for performance-critical workloads is no option.

Patches are always welcome, but it might be wise to get to the bottom
of the certification requirements first.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

