Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 92CB91891A3
	for <lists+linux-audit@lfdr.de>; Tue, 17 Mar 2020 23:54:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584485676;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=03TLc9TWgZ96MG26huiDJ184pK/6QT/QiBXK+Ktw17w=;
	b=cYCBJJZ7gRz/baF56o22WgzibgQ4pelY7mbO++iJsDRf3HSx8ImaWDQfAtBm4TWbQrBUnv
	8MjZtEv3o1O3B3dKb8gwCFR5OMN8zd8MkO1VYQ4magCsrwUeuqqBPNREtU3ayKAR1gHMfZ
	F78aZT0kF0W8HF4axHkssn8lDa55LEM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-5DG2QGg4NlmsaxreLMBbpg-1; Tue, 17 Mar 2020 18:54:34 -0400
X-MC-Unique: 5DG2QGg4NlmsaxreLMBbpg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26D1B13F7;
	Tue, 17 Mar 2020 22:54:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86D9C90803;
	Tue, 17 Mar 2020 22:54:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C4BAF18089CD;
	Tue, 17 Mar 2020 22:54:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02HMrFMH021154 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 17 Mar 2020 18:53:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B300F12253C; Tue, 17 Mar 2020 22:53:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF28312254F
	for <linux-audit@redhat.com>; Tue, 17 Mar 2020 22:53:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31050800298
	for <linux-audit@redhat.com>; Tue, 17 Mar 2020 22:53:13 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-157-tiCeBxn2NKSGTSN84b_Npg-1; Tue, 17 Mar 2020 18:53:10 -0400
X-MC-Unique: tiCeBxn2NKSGTSN84b_Npg-1
Received: by mail-ed1-f68.google.com with SMTP id i24so24797897eds.1
	for <linux-audit@redhat.com>; Tue, 17 Mar 2020 15:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=H2AI051rLZAHAFnm2zrh9zVZ1G4fGE+/AeEYX9+wv+E=;
	b=MR+6ZRVrcbjYePZ5kUwzLN3ZqaP/J8a/HtEpW+ta+WDjjuu5QRUbYcDBpHeZqzbw0u
	1slmF4hiyeDqRhVMlCoOiRHADzoCzx5YbAnPXRdEtrvjf2UsO5BWTwfXRif8DizihzUs
	RgCEZLUdxV2R5H7WXbFVAOcUPaZt/sy3DM8I8O7uNkBieESdX0sWQ9UL3PVAo8pvghjT
	sqVYm8T1/HsqhAdINDAas6RXFdLobyzeS+p9icK7tPf8xcmQuMkvyzZVqD6Uvk3aMBJe
	lkXYU1u4FI9WWt9lRbc/Y8iD/r6ImzdKKUTbIINaEJQwErUV7Jf4tNcJ7kItNYKsKtZR
	KFHg==
X-Gm-Message-State: ANhLgQ0Y3iPeJQ4OaXJZA7IeevpEfinWnVzMucx4JSE4NKLbwpcVMmqk
	0uIHNg21jBnrisADpaX+izpZ0b8o3Y0zg5Szwj9a
X-Google-Smtp-Source: ADFU+vtPay+qB+R3Hvch37dTE+5rewBMIpIMXcNW/3urIKs5hbI+IW9Yo87KYtCs3qD5j2rwxHO2Ib2ZIZBFoRet6xM=
X-Received: by 2002:a05:6402:13cc:: with SMTP id
	a12mr1113788edx.128.1584485588949; 
	Tue, 17 Mar 2020 15:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200317221237.vrkru2kdc63zq3vi@chatter.i7.local>
	<CAHC9VhTF8MH7UodKLGmAmMNzUeh-68W92pivnBgJfGhWV5F7HQ@mail.gmail.com>
In-Reply-To: <CAHC9VhTF8MH7UodKLGmAmMNzUeh-68W92pivnBgJfGhWV5F7HQ@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 17 Mar 2020 18:52:57 -0400
Message-ID: <CAHC9VhTrqszEHq8UywBYRPbeysiLYJav_UcRE4v+CM+JGq_m7A@mail.gmail.com>
Subject: Re: Looking for help testing patch attestation
To: selinux@vger.kernel.org, linux-audit@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02HMrFMH021154
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

[NOTE: fixed with the proper linux-audit address]

On Tue, Mar 17, 2020 at 6:51 PM Paul Moore <paul@paul-moore.com> wrote:
> On Tue, Mar 17, 2020 at 6:12 PM Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> > Hello, all:
> >
> > I'm reaching out to you because you're a security-oriented mailing list
> > and would likely be among the folks most interested in end-to-end
> > cryptographic patch attestation features -- or, at least, you're likely
> > to be least indifferent about it. :)
> >
> > In brief:
> >
> > - the mechanism I propose uses an external mailing list for attestation
> >   data, so list subscribers will see no changes to the mailing list
> >   traffic at all (no proliferation of pgp signatures, extra junky
> >   messages, etc)
> > - attestation can be submitted after the fact for patches/series that
> >   were already sent to the list, so a maintainer can ask for attestation
> >   to be provided post-fact before they apply the series to their git
> >   tree
> > - a single attestation document is generated per series (or, in fact,
> >   any collection of patches)
> >
> > For technical details of the proposed scheme, please see the following
> > LWN article:
> > https://lwn.net/Articles/813646/
> >
> > The proposal is still experimental and requires more real-life testing
> > before I feel comfortable inviting wider participation. This is why I am
> > approaching individual lists that are likely to show interest in this
> > idea.
> >
> > If you are interested in participating, all you need to do is to install
> > the "b4" tool and start submitting and checking patch attestation.
> > Please see the following post for details:
> >
> > https://people.kernel.org/monsieuricon/introducing-b4-and-patch-attestation
> >
> > With any feedback, please email the tools@linux.kernel.org list in order
> > to minimize off-topic conversations on this list.
>
> Hi Konstantin,
>
> You might want to extend this test to the LSM list as well.  I'm
> refraining from CC'ing them on this email because I don't want to
> spoil your beta test rollout, but I think it would be a good thing to
> do.
>
> Speaking as the person who merges patches for both the SELinux and
> audit kernel subsystems, I look at every patch I merge; I don't
> blindly merge patches (even from certain "trusted" individuals).
> Simply put, I've always considered that to be part of the job.  While
> the patch attestation could provide some assurance about who created
> the patch (assuming a reasonable web-of-trust), and that it hadn't
> been tampered with, I feel it is more important to review correctness
> than it is to guarantee provenance.  If you ever develop a tool which
> can help with the correctness part, I'll gladly jump to the front of
> the line to test that one! ;)
>
> Having said that, I'm happy to see work going into tools like this,
> and at some point I'll look into adding it into my workflow for an
> extra level of safety (although I'm on the fence about making it
> mandatory for submissions).  Sorry to disappoint, but I'm probably not
> the best test monkey right now.
>
> --
> paul moore
> www.paul-moore.com



-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

