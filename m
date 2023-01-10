Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD71663840
	for <lists+linux-audit@lfdr.de>; Tue, 10 Jan 2023 05:39:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673325557;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=V1sqwf/MSbsMcEhTh+kCM4rXqNGurfneXASE7ZnmX8U=;
	b=ZIUiS/xa0IhmpZhLfxnnpQzMIhv9a3c7/+0xVyB84uEkkcDx5nLFMX7PumjloO4ZO8kmUq
	xqvdlm96iFD0CRu62QQ4PeW364GicwhKsCdZI+gyvW6TnfWX+1p2Y4KKWALRCVod+wuNU0
	OsFNDGn+P4zLfY8qweg8C7/2KnF8enU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-Uah2HlGgNdq59BsbwmQTRw-1; Mon, 09 Jan 2023 23:39:13 -0500
X-MC-Unique: Uah2HlGgNdq59BsbwmQTRw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 807D48533DF;
	Tue, 10 Jan 2023 04:39:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 36AB74014CE2;
	Tue, 10 Jan 2023 04:39:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2B1E31940376;
	Tue, 10 Jan 2023 04:39:06 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0F5D11946587 for <linux-audit@listman.corp.redhat.com>;
 Tue, 10 Jan 2023 04:39:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E003E42220; Tue, 10 Jan 2023 04:39:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7F87175AD
 for <linux-audit@redhat.com>; Tue, 10 Jan 2023 04:39:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8D6580234E
 for <linux-audit@redhat.com>; Tue, 10 Jan 2023 04:39:04 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-272-n8nQwpsLONe4U3MQIzboxQ-1; Mon, 09 Jan 2023 23:39:01 -0500
X-MC-Unique: n8nQwpsLONe4U3MQIzboxQ-1
Received: by mail-pg1-f174.google.com with SMTP id 141so7429977pgc.0
 for <linux-audit@redhat.com>; Mon, 09 Jan 2023 20:39:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/SmD/pftVHMlxVXpQWv++WKt9E5LDe4Cgin/uVDJq5k=;
 b=m+NwKOJRlAbIlG5PZHxZPtChzeDt0qX0UUIbSA/R1SVeBdxSisk1/YH1do6dHDpYNM
 0RHtqbea3O6YYxGi8impdmDaehcHT1apfau0DYmgQ1wMXHBM/k8PS6k3twX+jlIRAddh
 PhAU2DdWV2yz8dcwIvTS6MvbkDs7eBXXpyKAdM9WDYeA9fmK4RTPzqUM2MePlf0vexdK
 UidGlguCEMsOPO5Pj3Nouj0PwkuJq0oyYcXkLBiGQ/zVRCHTHYnlUQAQOU9q/wq2fyql
 2j1YfLTUJqPAL6+CNs+72eavYdpoWDRo6QRFNkX55952kmNBaht36R8ZTTbJukReoOjd
 WGsQ==
X-Gm-Message-State: AFqh2kqiLuG19SBg/1dRHk9QKeYTngpTHQoJA3ky/0H3G6qhSpJNt/kf
 c7OJR1BW/RzXuA73XxNcTd8JuVjp0K94HOe0aQrJ
X-Google-Smtp-Source: AMrXdXsgj/jhoM6gDnx2RxhPagvY+AbnmFlLzIQOkJ+2Mainht1ZoLideVAcW+OhliTl00TyE1dTMA5FBLCP4jR9em4=
X-Received: by 2002:a63:4e5d:0:b0:478:42f:5a3d with SMTP id
 o29-20020a634e5d000000b00478042f5a3dmr4249130pgl.3.1673325539959; Mon, 09 Jan
 2023 20:38:59 -0800 (PST)
MIME-Version: 1.0
References: <CACKMdf=43CJmauoVnyzemsGtJoR5g=yDUUojJ3P1qsbKrrNMXQ@mail.gmail.com>
 <CAHC9VhTdznAV=ZbUbJM5EPs7_VVAL2KU1i7T=mQaUiq+TiL1=g@mail.gmail.com>
 <CAHC9VhQH28r_fOCaW+=_65M2SBNpVnQqcvxKt28Zc1+YEqwjBQ@mail.gmail.com>
 <8169595.T7Z3S40VBb@x2>
In-Reply-To: <8169595.T7Z3S40VBb@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 9 Jan 2023 23:38:48 -0500
Message-ID: <CAHC9VhSPoAtf-_1LOsHFc7XbO76azy_Q_MjG6Y1a1wOAaVPXLA@mail.gmail.com>
Subject: Re: New bug in Audit
To: Steve Grubb <sgrubb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
Cc: linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 9, 2023 at 10:59 AM Steve Grubb <sgrubb@redhat.com> wrote:
> On Friday, January 6, 2023 3:33:18 PM EST Paul Moore wrote:
> > > This mailing list is *focused* on upstream work and support, and while
> > > it does not preclude talking about distro specific bugs, I believe
> > > there are better avenues for those discussions (e.g. see the RHBZ link
> > > I provided in my response) as upstream isn't really going to be able
> > > to provide adequate help for someone experiencing problems with a
> > > distro kernel which has a number of patches and backports.
> > >
> > > If you have a problem with this approach, perhaps we should move
> > > upstream development to an audit mailing list on vger.kernel.org and
> > > leave this list for RH specific issues?
> >
> > Steve, I realize it's only been ~24hrs, but should I assume you are
> > okay with that (the upstream focused approach)?
>
> For the 18 years I've spent on this mail list, it has alway been open to any
> topic audit related. I've answered questions for many distributions. If I can
> reproduce the issue, then it's a bug worth looking at. If I can't reproduce
> it, I let them know. I've even answered questions for people writing their
> own audit implementation.

Since I was asked to maintain the upstream Linux Kernel audit
subsystem I've generally asked people to try and reproduce their
problems on a modern~ish upstream Linux Kernel as it simply isn't
sustainable for me to replicate the environment of every problem
report.  Enterprise distributions which run old and/or heavily patched
Linux Kernels should have their own support staff to provide
assistance in these areas, the upstream developers can't support every
distro kernel that ships.

> A lot of the email is upstream kernel work - no doubt. But Many times, we
> miss upstream kernel bugs because no one is running upstream code. We usually
> hear about it when a distribution which stays close to upstream releases a
> new update.

In which case I would expect the distro support team to reproduce the
problem and report it upstream and/or submit an upstream patch for
review.  This has been shown to work very well, and fits nicely within
the "upstream first" motto adopted by some of the better Linux
distributions.

> The text where you sign up for this mail list does not limit the topc to
> upstream work,

Perhaps the term "limit" is a bit strong, but I think it would be good
if the list welcome message indicates that the list is primarily for
the development and support of the upstream Linux audit tools,
distribution specific concerns should be sent to the distribution
provider.

> it allows for any discussion as long as it's audit related. I
> do not think making a new mail list is in anyone's interest. Bugs will always
> get misreported if there are 2 lists.

I disagree, the upstream and Fedora SELinux mailing lists have been a
good example of this working well.  I also tend to think there is some
value in having a vendor agnostic mailing list host, but that's more
of a tie breaker in my mind, and not reason enough alone to force a
switch.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

