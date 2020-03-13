Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D37F8184CF0
	for <lists+linux-audit@lfdr.de>; Fri, 13 Mar 2020 17:49:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584118188;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hdYUXS4ZtgZVynvieEUAYpLvlDk5WmIbmfgmGsHitMY=;
	b=EAVzsK53i0lRoTAjnr/hBPRuD0ggrGLhujOqbLFU2IdqEVPIlxg2NRZUltZ+QzX4tPnQ+7
	Aez/VyhY+MZYP60dBYdmTFZyFEmcMHNC9xTzHQfK+OPvSyB74Zz/4c44UoEnEGb9lMDGTA
	DnLKIHVtNWY5OC2PX1OJaAl7JfUJ/P4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-vWTE741fPiexy_kfqsN5ug-1; Fri, 13 Mar 2020 12:49:46 -0400
X-MC-Unique: vWTE741fPiexy_kfqsN5ug-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8285110CE78B;
	Fri, 13 Mar 2020 16:49:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F82560BEE;
	Fri, 13 Mar 2020 16:49:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0348A18089C8;
	Fri, 13 Mar 2020 16:49:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02DGnaSV011662 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 13 Mar 2020 12:49:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6F2DD2166B30; Fri, 13 Mar 2020 16:49:36 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B3BF2166B32
	for <linux-audit@redhat.com>; Fri, 13 Mar 2020 16:49:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5C8B1011E01
	for <linux-audit@redhat.com>; Fri, 13 Mar 2020 16:49:33 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-239-qsYnvuTvPKOd0v1DcaCG9g-1; Fri, 13 Mar 2020 12:49:31 -0400
X-MC-Unique: qsYnvuTvPKOd0v1DcaCG9g-1
Received: by mail-ed1-f66.google.com with SMTP id h62so12638016edd.12
	for <linux-audit@redhat.com>; Fri, 13 Mar 2020 09:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YGG5XY3Ewg2kr6ydPgEVpPEQe8Bu0vVCZeuUuZTd/eQ=;
	b=LshXpyMdNHKVn4WN6l8TQ0u0MHpKCyI3j040SEvG5t0PIIdEWughLQvQk5yu6Rc6PY
	LGV3yXq54HnMhIaRb5lb3xpmu4JeK/bTCN3twD11o4e3wYW1g9zZEHu0D8H0cfuaIYDe
	a9F89uVPGxD6KrbjKd0wRl6m2QpbthvBCceN57QiYMjEk1OfANeBjENSuITHuf/j9E7U
	uMwdZVYi87uAu7HgimLfARdiwzJuXtfviqdZI1YiOEA31Hdtrv0bIVMfn2NHkdAlYSMh
	wCYKYlFkf5dYTbwTEOkDVhUEn7EWMgox7C/jNBxRF7xZoSZwTiYqu1Ftd6+I9Sgv6aMf
	TNSA==
X-Gm-Message-State: ANhLgQ34u9PVFQ614w4i+bRpsEUVAxuYI2ql5wrQyEUZXbqXymRU1e3A
	OS/BLdA5gN4SF/ffuIy1Y0jWCEwSyVeFpyqKwl4v
X-Google-Smtp-Source: ADFU+vv+9NsRZqnIPliXMbq5GOtlCub1wdzEkmolWWP97LJYncHkT1zJ8K+tAtQcCN/BN4QsA0IqfHmFy6PXx2taKa0=
X-Received: by 2002:aa7:dd01:: with SMTP id i1mr14078117edv.164.1584118169827; 
	Fri, 13 Mar 2020 09:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1577736799.git.rgb@redhat.com>
	<20200312202733.7kli64zsnqc4mrd2@madcap2.tricolour.ca>
	<CAHC9VhS9DtxJ4gvOfMRnzoo6ccGJVKL+uZYe6qqH+SPqD8r01Q@mail.gmail.com>
	<2588582.z15pWOfGEt@x2>
In-Reply-To: <2588582.z15pWOfGEt@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 13 Mar 2020 12:49:18 -0400
Message-ID: <CAHC9VhQ7hFc8EqrEojmjQriWtKkqjPyzWrnrc_eVKjcYhhV8QQ@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 07/16] audit: add contid support for signalling
	the audit daemon
To: Steve Grubb <sgrubb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02DGnaSV011662
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, Richard Guy Briggs <rgb@redhat.com>,
	linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
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

On Fri, Mar 13, 2020 at 12:45 PM Steve Grubb <sgrubb@redhat.com> wrote:
> On Friday, March 13, 2020 12:42:15 PM EDT Paul Moore wrote:
> > > I think more and more, that more complete isolation is being done,
> > > taking advantage of each type of namespace as they become available, but
> > > I know a nuber of them didn't find it important yet to use IPC, PID or
> > > user namespaces which would be the only namespaces I can think of that
> > > would provide that isolation.
> > >
> > > It isn't entirely clear to me which side you fall on this issue, Paul.
> >
> > That's mostly because I was hoping for some clarification in the
> > discussion, especially the relevant certification requirements, but it
> > looks like there is still plenty of room for interpretation there (as
> > usual).  I'd much rather us arrive at decisions based on requirements
> > and not gut feelings, which is where I think we are at right now.
>
> Certification rquirements are that we need the identity of anyone attempting
> to modify the audit configuration including shutting it down.

Yep, got it.  Unfortunately that doesn't really help with what we are
talking about.  Although preventing the reuse of the ACID before the
SIGNAL2 record does help preserve the sanity of the audit stream which
I believe to be very important, regardless.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

