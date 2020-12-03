Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id DFF802CCDCC
	for <lists+linux-audit@lfdr.de>; Thu,  3 Dec 2020 05:13:07 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-L5mUQ2rwNeqH8cbrLk37Wg-1; Wed, 02 Dec 2020 23:13:04 -0500
X-MC-Unique: L5mUQ2rwNeqH8cbrLk37Wg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24B711E7D3;
	Thu,  3 Dec 2020 04:12:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9304B5D9CA;
	Thu,  3 Dec 2020 04:12:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C8789180954D;
	Thu,  3 Dec 2020 04:12:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B34CmsT015618 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 2 Dec 2020 23:12:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B30F32026D3A; Thu,  3 Dec 2020 04:12:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE2AA2026D3C
	for <linux-audit@redhat.com>; Thu,  3 Dec 2020 04:12:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58C00811E76
	for <linux-audit@redhat.com>; Thu,  3 Dec 2020 04:12:46 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
	[209.85.218.51]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-183-wxHtbkgMN02UdAkLn6hEHg-1; Wed, 02 Dec 2020 23:12:44 -0500
X-MC-Unique: wxHtbkgMN02UdAkLn6hEHg-1
Received: by mail-ej1-f51.google.com with SMTP id jx16so1378188ejb.10
	for <linux-audit@redhat.com>; Wed, 02 Dec 2020 20:12:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NeLoahRGNsTDQThe9i4ICCLH8dvLzLtfzlj9L9+aD+0=;
	b=t6Q98LFsuY9Af2PUi9gJbWbqkBt2DGutbH95c9sSG7xbF/xgei5iSUVH/42e0YGhW3
	a3xkRPLZR55mpaXaKEhTGABZ1fIi5Ao4pLXYxI8uy+4KAprOVDpgBl44ZvsS8phzr86v
	wbOCeMQvty/qCYoJArlNAgePP+VpMAAvktgSXjkxhrgIXcYm29QHgWVJpCqdoc4XWW8n
	zth173DlLvabxu/mvcI+8yorY0AqntAztdN6tVv8spQYC3/uRZEjkshFDJMMl6+401Aa
	gcSXXM2CHJSYvbyAWOIQBNhUY5F8+JnA7yP0U555L/GASU2DwmQFkLTHCNdoxuovbav8
	2xig==
X-Gm-Message-State: AOAM5302wvWOps8dJAVo4rQHtterb7Bkr/DrByeyD06r1RkFSYC6yW+o
	HuUNdrR1hB/Jg6qnN1kloX9MqHSGOu+er1ifjOGQ
X-Google-Smtp-Source: ABdhPJwnpfgOGTaLsZ3BN9ahbyPwfLxshdK4cBGILo4RaPYL5NvtesKaT28y3sb1EW4tWgH9zNJZbgKg5HAqyBH+MUc=
X-Received: by 2002:a17:906:268c:: with SMTP id
	t12mr877582ejc.91.1606968762784; 
	Wed, 02 Dec 2020 20:12:42 -0800 (PST)
MIME-Version: 1.0
References: <20200701213244.GA1817@linux-kernel-dev>
	<CAHC9VhTctHCCrm4Q1cPdFX-6NXEtmjEPmw6rvUoxOq8UUmycxA@mail.gmail.com>
	<11647352.O9o76ZdvQC@x2>
In-Reply-To: <11647352.O9o76ZdvQC@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 2 Dec 2020 23:12:31 -0500
Message-ID: <CAHC9VhQzRP6Gyji83MEjQbdZxePLFn2Ai7Zo-Wd0D7MPqQ_Ekw@mail.gmail.com>
Subject: Re: [PATCH v2] audit: report audit wait metric in audit status reply
To: Steve Grubb <sgrubb@redhat.com>
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
Cc: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 2, 2020 at 10:52 PM Steve Grubb <sgrubb@redhat.com> wrote:
>
> Hello Paul,

Steve.

> On Thursday, July 2, 2020 4:42:13 PM EST Paul Moore wrote:
> > > #define AUDIT_FEATURE_BITMAP_BACKLOG_LIMIT     0x00000001
> > > #define AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_TIME 0x00000002
> > > @@ -348,6 +349,7 @@ enum {
> > > #define AUDIT_FEATURE_BITMAP_SESSIONID_FILTER  0x00000010
> > > #define AUDIT_FEATURE_BITMAP_LOST_RESET                0x00000020
> > > #define AUDIT_FEATURE_BITMAP_FILTER_FS         0x00000040
> > > +#define AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_SUM  0x00000080
> >
> > In an effort not to exhaust the feature bitmap too quickly, I've been
> > restricting it to only those features that would cause breakage with
> > userspace.  I haven't looked closely at Steve's userspace in quite a
> > while, but I'm guessing it can key off the structure size and doesn't
> > need this entry in the bitmap, right?  Let me rephrase, if userspace
> > needs to key off anything, it *should* key off the structure size and
> > not a new flag in the bitmask
> >
> > Also, I'm assuming that older userspace doesn't blow-up if it sees the
> > larger structure size?  That's even more important.
>
> We need this FEATURE_BITMAP to do anything in userspace. Max's instinct was
> right. Anything that changes the user space API needs to have a
> FEATURE_BITMAP so that user space can do the right thing. The lack of this is
> blocking acceptance of the pull request for the user space piece.

I don't believe you need a new bitmap entry in this case, you should
be able to examine the size of the reply from the AUDIT_GET request
and make a determination from there.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

